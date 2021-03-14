library(odbc)
library(DBI)
library(rstudioapi)

con <- DBI::dbConnect(odbc::odbc(), 
                      Driver = "SQL Server", 
                      Server = "pcnjdevsql02",
                      Database = "PIE_Dev",
                      Trusted_Connection = "True")

dbListTables(con)

dbGetInfo(con)

