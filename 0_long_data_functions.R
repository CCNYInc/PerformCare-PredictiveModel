library(odbc)
library(dbplyr)
library(dplyr)

# Source: https://www.nickvasile.com/2020/05/13/error-invalid-descriptor-index/
# Author: Nick Vasile
# Github: https://github.com/nickv9

# Create functions to handle long data issues----

tbl_long_cols <- function(con, table, size_thresh = 200) {
    
    long_cols <-
        odbc::odbcConnectionColumns(con, table) %>%
        dplyr::filter(column_size >= size_thresh) %>%
        dplyr::pull(name)
    
    dplyr::tbl(con, table) %>%
        dplyr::select(-tidyselect::all_of(long_cols),
                      tidyselect::everything(),
                      tidyselect::all_of(long_cols))
}

tbl_long_cols_2 <- function(con, table) {
    cols_sorted <- 
        odbc::odbcConnectionColumns(con, table) %>% 
        dplyr::arrange(column_size) %>% 
        pull(name)
    
    dplyr::tbl(con, table) %>%
        dplyr::select(tidyselect::all_of(cols_sorted)) 
}

tbl_long_cols_3 <- function(con, table) {
    long_cols <-
        odbc::odbcConnectionColumns(con, table) %>%
        dplyr::filter(field.type == "varbinary") %>%
        pull(name)
    
    dplyr::tbl(con, table) %>%
        dplyr::select(-tidyselect::all_of(long_cols),
                      tidyselect::everything(),
                      tidyselect::all_of(long_cols))
}