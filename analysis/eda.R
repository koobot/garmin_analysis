# Exploratory data analysis
library(tidyverse)

in_dir <- "D:/Documents/garmin_analysis/data_processed/activity/"

test_def <- read_csv(file.path(in_dir, "2022-09-21-22-19-01_defn.csv"))
test_rec <- read_csv(file.path(in_dir, "2022-09-21-22-19-01_records.csv"))
test_rec_data <- read_csv(file.path(in_dir, "2022-09-21-22-19-01_records_data.csv"))
