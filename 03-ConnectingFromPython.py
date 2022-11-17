## Connecting from Python

import urllib3
urllib3.disable_warnings()


## Alternative 1 using 'SQLAlchemy'

pip install SQLAlchemy

## Simple python script to run a query on a presto cluster and display the result set 
from sqlalchemy import *
from sqlalchemy.engine import create_engine
from sqlalchemy.schema import *
engine = create_engine("presto://<user>:<password>@<prestoServerName>:443/<catalog>/<schema>",
                        connect_args={'protocol':'https', 'requests'kwargs':{'verify':False}})

with engine.connect() as con:
    rs = con.execute('SELECT now()')
    for row in rs:
        print(row)

## using pandas        
import pandas as pd
df = pd.read_sql("show tables", engine)
print(df)


## Alternative 2 using 'PyHive'

pip install 'pyhive[presto]'

## Simple python script to run a query on a presto cluster and display the result set 
from pyhive import presto
conn = presto.connect(
            host='<hostname>',
            port='<port>',
            username='xxx',
            password='xxx',
            catalog='<catalog>',
            schema='<schema>'
)
cur = conn.cursor()

## Retrieve data
cur.execute('SELECT * FROM <schema>.<set> LIMIT 10')
print(cur.fetchall())

cur.execute('SELECT * FROM nodes')
for row in cur.fetchall():
    print(row)
