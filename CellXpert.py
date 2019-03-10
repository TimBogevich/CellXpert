import requests
import xmltodict
from pandas.io.json import json_normalize
from vars import *
from datetime import datetime, timedelta


def check_last_date(table,date_field):
    return engine.execute("SELECT COALESCE(MAX(["+ date_field +"]),'20190101') as DT FROM "+ target_schema + "." + table).fetchall()[0][0]


for index, row in tables.iterrows():
    source = row["source"]
    target = row["target"]
    print "New data into table "+ target_schema + "." + target + " is going to be inserted"
    if row["type"] == "fact":
        date_from = check_last_date(target,row["date_field"])     
        while date_from <= datetime.now():
            date_to = date_from + timedelta(days=date_delta)
            print "From: " + date_from.strftime("%m/%d/%Y") + "till: " + date_to.strftime("%m/%d/%Y")
            dates_str = "&fromdate=" +  date_from.strftime("%m/%d/%Y") + \
                        "&todate=" +    date_to.strftime("%m/%d/%Y")
            req_result = requests.get(url + source + dates_str).content
            xmlDict = xmltodict.parse(req_result)
            df = json_normalize(xmlDict["ResultSet"].values()[0])
            engine.execute("DELETE "+ target_schema + "." + target + " WHERE ["+ row["date_field"] +"] >= %d" , date_from)
            df.to_sql(target,engine,if_exists="append",schema=target_schema,index=False)
            date_from = date_to
    if row["type"] == "cycle":
        for id in engine.execute(row["cycle_query"]).fetchall():
            print "id: " + str(id[0])
            id_str = "&" + row["cycle_field"] + "=" + str(id[0])
            req_result = requests.get(url + source + id_str).content
            try:
                xmlDict = xmltodict.parse(req_result)
                df = json_normalize(xmlDict["ResultSet"].values()[0])
                engine.execute("DELETE "+ target_schema + "." + target + " WHERE "+ row["cycle_field"] +" = %s" , str(id[0]))
                df.to_sql(target,engine,if_exists="append",schema=target_schema,index=False)
            except:
                print "No data from target by " + row["cycle_field"]  + "=" + str(id[0])
    if row["type"] == "dim":
        req_result = requests.get(url + source).content
        xmlDict = xmltodict.parse(req_result)
        df = json_normalize(xmlDict["ResultSet"].values()[0])
        engine.execute("DELETE "+ target_schema + "." + target)
        df.to_sql(target,engine,if_exists="append",schema=target_schema,index=False)

        

print "All tables successfuly downloaded"