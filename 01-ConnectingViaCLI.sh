## Connect via terminal

ssh presto@192.168.56.101
# presto@192.168.56.101's password: <presto>

## Rename CLI to 'presto'
cd bin/
cp presto-cli presto

## Login to presto
presto --server localhost:8080

## Login to presto with .jar
java -jar presto-cli-349-executable.jar --server xx --catalog hive --schema xx --user xx --password

## Show catalogs
show catalogs;
# Catalog
# ---------
# hive
# system
# tpcds
# tpch
# (4 rows)

## Show schemas
show schemas from hive;
# Schema
# --------------------
# default
# information_schema
# (2 rows)

## Show tables
show tables from hive.default;
# Table
# --------
 # nation
 # region
# (2 rows)

## Query nation table
select * from hive.default.nation limit 10;
# ...

## Query for current time
select now();
# _col0
# -----------------------------
# 2017-02-14 21:45:56.555 UTC
# (1 row)


## Alternative way with Docker image
## https://hub.docker.com/r/ahanaio/prestodb-sandbox
## Docker Pull Command:
docker pull ahanaio/prestodb-sandbox

## Start Presto
## This will start the Presto server and expose & publish port
docker run -p 8080:8080 --name presto ahanaio/prestodb-sandbox

## Bring up Presto-cli
docker exec -it presto  presto-cli

show catalogs;
 # Catalog
# ---------
 # jmx
 # memory
 # system
 # tpcds
 # tpch
# (5 rows)

show schemas from tpcds;
       # Schema
# --------------------
 # information_schema
 # sf1
 # sf10
 # sf100
 # sf1000
 # sf10000
 # sf100000
 # sf300
 # sf3000
 # sf30000
 # tiny
# (11 rows)

## Choose a catalog and schema to query
## This can be done by when bringing up the presto-cli
docker exec -it presto  presto-cli  --catalog tpcds --schema sf10

## Or by choosing the schema on command line
use tpcds.sf10;
