
# Transforming and Aggregating Data Exercises

# Load Data
data = readRDS("Data/STEP_UP_REGIONAL_ANTIDEPRESSANTS.Rds")

# Load libraries
library(dplyr)

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
  summarise(ITEMS = sum(ITEMS)) %>% 
  ungroup()

# Question 3: What is the annual spend of Sertraline hydrochloride prescribing in the Midlands region?
data %>% 
  filter(DRUG == "Sertraline hydrochloride", REGION == "MIDLANDS") %>% 
  group_by(YEAR) %>% 
  summarise(COST = sum(COST)) %>% 
  ungroup()

# Question 4: How many anti-depressant items were prescribed nationally in 2024?
data %>% 
  filter(YEAR == 2024) %>% 
  summarise(ITEMS = sum(ITEMS))
