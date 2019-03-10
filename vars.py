import pandas as pd
import r_conf_file
import get_arg
import sys
from sqlalchemy import create_engine
from sqlalchemy import sql
from sqlalchemy.orm import sessionmaker

'''
    Here is all variables.
    list_of_tables consists source and target. To add new source you have to add new row in list_of_tables
    and add target and aslo add DDL to database
'''

r_conf_file.r_conf_file(get_arg.get_arg(sys.argv[1:]))   #Read params from file

list_of_tables = [  #### Add here source command from API and target table in OLAP
	{"source":"managerslist",          "target":"CellXpertManagerList",            "type":"dim"},
	{"source":"affiliateList",         "target":"CellXpertAffiliateList",          "type":"dim"},
	{"source":"ncilist",               "target":"CellXpertNciList",                "type":"dim"},
    {"source":"commissions",           "target":"CellXpertCommisions",             "type":"fact", "date_field":"timestamp"},
    {"source":"ftd",                   "target":"CellXpertFTD",                    "type":"fact", "date_field":"TransactionDate"},
    {"source":"report",                "target":"CellXpertReport",                 "type":"fact", "date_field":"Day"},
    #{"source":"traders",               "target":"CellXpertTraders",                "type":"dim"},
    {"source":"mediareport",           "target":"CellXpertMediaReport",            "type":"fact", "date_field":"Day"},
    {"source":"AffiliatesByManager",    "target":"CellXpertAffiliatesByManager",    "type":"cycle", "cycle_field":"AffiliateManagerId", "cycle_query":"SELECT id FROM site.CellXpertManagerList"}
]
tables = pd.DataFrame(columns=["source","target", "type", "date_field","cycle_field","cycle_query"],data = list_of_tables)
target_schema = "site"
target_db = "DWH"

connection_string = "mssql+pymssql://"+ r_conf_file.mssql_srv_login +":"+ r_conf_file.mssql_srv_pwd +"@"+ r_conf_file.mssql_srv_adr +":1433/"+ target_db
engine = create_engine(connection_string)

API_User = engine.execute("SELECT ParamValue FROM Config WHERE ParamName = 'CellXpert_USER'").fetchall()[0][0]
API_Password = engine.execute("SELECT ParamValue FROM Config WHERE ParamName = 'CellXpert_PASSWORD'").fetchall()[0][0]
url = "http://CELLXPERTURL/api/admin/?api_username="+ API_User +"&api_password="+ API_Password +"&command="
date_delta = 30