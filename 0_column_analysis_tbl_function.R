column_analysis <- function(input_table_name, output_table_name) {
    output_table_name <- janitor::tabyl(input_table_name, 
                                        show_na = TRUE, 
                                        show_missing_levels = TRUE)
    output_table_name$n <- format(output_table_name$n,
                                  scientific = FALSE,
                                  big.mark = ",",)
    output_table_name$percent <- scales::percent(output_table_name$percent,
                                                 accuracy = 0.01)
    output_table_name$valid_percent <- scales::percent(output_table_name$valid_percent, accuracy = 0.01)
    
    return(output_table_name)
}