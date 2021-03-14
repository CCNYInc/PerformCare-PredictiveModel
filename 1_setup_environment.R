library(odbc)
library(DBI)
library(rstudioapi)
library(dbplyr)
library(dplyr)
library(dataMaid)
library(ggplot2)
library(writexl)
library(readr)
library(stringr)
library(forcats)
library(lubridate)
library(janitor)
library(scales)

# load the functions to handle to deal with----
# Invalid Descriptor Index Error
source("0_long_data_functions.R")

# load function to create an anaysis table
source("0_column_analysis_tbl_function.R")


# Connect to the DM database----
# Ask the user what the database name is, 
# which is only known by our staff via LastPass
source("0_database_connection.R")

# Test the connection
dbListTables(con)

dbGetInfo(con)