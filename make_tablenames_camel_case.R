# write a script that turns columnnames in a data sheet
# that is on google drive into camel case

library(googledrive)
library(googlesheets4)
library(snakecases)

# create a url for the spreadhseet and set up authorization
ss = "https://docs.google.com/spreadsheets/d/1UjaRP2PmHzTWdW5lQdqu0SLJA8PCye0qbZq823raI-Q/edit#gid=985760927"

drive_auth()

pull_camel_put <- function(gsheet_name) {
    
    # pull the data from the labeled sheet the function needs a string 
    # for example "sheetName"
    
    tbl <- read_sheet(ss, sheet = gsheet_name)
    
    # turn the target column data into camcel case
    tbl$`TARGET COLUMN` <- to_upper_camel_case(tbl$`TARGET COLUMN`)

    # write the result back to the labeled sheet
    write_sheet(tbl, ss, sheet = gsheet_name)
    
}

# Members ----
pull_camel_put("MBR_Members")

# Special Population----

pull_camel_put("MBR_SpecialPop")

# Provider----
pull_camel_put("Provider")

# Authorizations----
pull_camel_put("tdAuthorization")

# You get the idea
pull_camel_put("tdResProvider")

pull_camel_put("tdTreatmentPlans")

pull_camel_put("County_hist")

pull_camel_put("tdCourtOrders")

pull_camel_put("tdCrisisTracking")

pull_camel_put("tdMemberYouthLink")

pull_camel_put("tdServiceRequest")

pull_camel_put("tdAssessment")

pull_camel_put("tdAssessment_LegalMod")

pull_camel_put("tdAssessment_MedMod")

pull_camel_put("tdAssessment_OOHMod")

pull_camel_put("tdAssessment_ProbSexMod")

pull_camel_put("tdAssessment_SABMod")

pull_camel_put("tdAssessment_TraumaMod")

pull_camel_put("tdAssessment_Firesetting")
