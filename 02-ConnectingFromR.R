## Connecting from R

## Install R package from CRAN
install.packages('RPresto')

## Load the library
library('DBI')

## setup the connection
## adjust the IP and Port
con <- dbConnect(
  RPresto::Presto(),
  host='http://192.168.56.101',
  port=8080,
  user=Sys.getenv('USER'),
  schema='<schema>',
  catalog='<catalog>',
  source='<source>'
)

## Define the query and result
res <- dbSendQuery(con, 'SELECT NOW()')

## Run the query, returning all the rows
print(dbFetch(res, -1))
