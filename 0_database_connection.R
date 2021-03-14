library(odbc)
library(DBI)
library(rstudioapi)

# con <- DBI::dbConnect(odbc::odbc(), 
#                       Driver = "SQL Server", 
#                       Server = rstudioapi::askForSecret("What is the server name?"),
#                       Database = rstudioapi::askForSecret("Which database would you like to connect to?"),
#                       Trusted_Connection = "True")

con <- DBI::dbConnect(odbc::odbc(), 
                      Driver = "SQL Server", 
                      Server =  "PCNJRPT01",
                      Database = "DM",
                      Trusted_Connection = "True")
