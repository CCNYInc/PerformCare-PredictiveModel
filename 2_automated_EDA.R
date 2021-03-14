# Setup the envrionment to set
source("1_setup_environment.R")



# Start analysis of CANS Assessments----
asssessment <- tbl_long_cols_2(con, "tdAssessment_AllModule")
# add %>% collect() to the end of this line to gather the data for analysis


makeDataReport(asssessment)

# Start analysis of Member Data----
members <- tbl_long_cols_2(con, "tdMember") 
# add %>% collect() to the end of this line to gather the data for analysis

makeDataReport(members)

# Analysis of Provider Data----
providers <- tbl_long_cols_2(con, "tdCIMEntity") %>%
    collect()

makeDataReport(providers)

# Disconnect from the database----
dbDisconnect(con)

