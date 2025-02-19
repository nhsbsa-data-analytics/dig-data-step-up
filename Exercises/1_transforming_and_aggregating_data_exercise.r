
# Transforming and Aggregating Data Exercises

# Set directory
setwd(rprojroot::find_root(criterion = rprojroot::is_rstudio_project))

# Load data
data = readRDS("Data/STEP_UP_REGIONAL_ANTIDEPRESSANTS.Rds")

# Load libraries
library(dplyr)
library(tidyr)

# Question 1: Nationally, calculate the top 10 prescribed anti-depressants across the whole time frame, sorted from biggest from smallest.
data %>% 
  group_by(DRUG) %>% 
  summarise(ITEMS = sum(ITEMS)) %>% 
  ungroup() %>% 
  top_n(10, ITEMS) %>% 
  arrange(desc(ITEMS))

# Question 2: Calculate the monthly national cost of Mirtazapine prescribing 
data %>% 
  filter(DRUG == "Mirtazapine") %>% 
  group_by(YM) %>% 
  summarise(COST = sum(COST)) %>% 
  ungroup()

# Question 3: What is the annual spend of Sertraline hydrochloride prescribing in the Midlands region?
data %>% 
  filter(DRUG == "Sertraline hydrochloride", REGION == "MIDLANDS") %>% 
  group_by(YEAR) %>% 
  summarise(COST = sum(COST)) %>% 
  ungroup()

# Question 4: Create a (pivoted) table that showsthe cost of anti-depressant prescribing per region per year?
# Note: Each row should be a year and each column should be a region.
data %>% 
  group_by(YEAR, REGION) %>% 
  summarise(COST = sum(COST)) %>% 
  ungroup() %>% 
  pivot_wider(names_from = YEAR, values_from = COST)
