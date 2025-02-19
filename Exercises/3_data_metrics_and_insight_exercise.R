# Data Metrics and Insight Exercises

# Set directory
setwd(rprojroot::find_root(criterion = rprojroot::is_rstudio_project))

# Load Data
data = readRDS("Data/EXTENSION_STEP_UP_REGIONAL_ANTIDEPRESSANTS.Rds")

# Load libraries
library(dplyr)
library(tidyr)
library(highcharter)

# Question 1: For context, create a monthly line chart showing total national prescribing cost


# Question 2: Create *annual* summary statistics, for the min, Q1, median, Q3 and maximum national monthly prescribing cost (i.e. all drugs across all regions)

  
# Question 3: create a grouped boxplot that shows the above information (4 boxplots, 1 per year)


# Question 4: calculate the annual *mean* monthly total national prescribing cost and display in a vertical barchart


# Question 5: Create a monthly line chart, which shows what percentage of *national* prescribing is from the '02: Cardiovascular System' BNF_CHAPTER.

