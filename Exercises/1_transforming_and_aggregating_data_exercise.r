
# Transforming and Aggregating Data Exercises

# Set directory
setwd(rprojroot::find_root(criterion = rprojroot::is_rstudio_project))

# Load data
data = readRDS("Data/STEP_UP_REGIONAL_ANTIDEPRESSANTS.Rds")

# Load libraries
library(dplyr)
library(tidyr)

# Question 1: Nationally, calculate the top 10 prescribed anti-depressants across the whole time frame, sorted from biggest from smallest.


# Question 2: Calculate the monthly national cost of Mirtazapine prescribing 


# Question 3: What is the annual spend of Sertraline hydrochloride prescribing in the Midlands region?


# Question 4: Create a (pivoted) table that showsthe cost of anti-depressant prescribing per region per year?
# Note: Each row should be a year and each column should be a region.

