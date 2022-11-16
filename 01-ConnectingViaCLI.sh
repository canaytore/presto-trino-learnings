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
