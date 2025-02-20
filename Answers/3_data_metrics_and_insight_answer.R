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
data %>% 
  group_by(YM) %>%
  summarise(COST = sum(COST)) %>% 
  ungroup() %>% 
  hchart("line", hcaes(YM, COST)) %>% 
  hc_yAxis(min = 0) %>% 
  hc_yAxis(title = list(text = "Cost (£)")) %>% 
  hc_xAxis(title = list(text = "Year-month")) %>% 
  hc_title(text = "The national monthly total prescribing cost from January 2021 until December 2024")

# Question 2: Create *annual* summary statistics, for the min, Q1, median, Q3 and maximum national monthly prescribing cost (i.e. all drugs across all regions)
data %>% 
  group_by(YEAR, YM) %>%
  summarise(COST = sum(COST)) %>% 
  ungroup() %>% 
  group_by(YEAR) %>% 
  summarise(
    min = min(COST),
    Q1 = quantile(COST, 0.25),
    median = median(COST),
    Q3 = quantile(COST, 0.75),
    max = max(COST)
  ) %>% 
  ungroup()
  
# Question 3: create a grouped boxplot that shows the above information (4 boxplots, 1 per year)

# Data
box = data %>% 
  group_by(YM, YEAR) %>% 
  summarise(COST = sum(COST)) %>% 
  ungroup()

# Chart
hcboxplot(x = box$COST, var = box$YEAR) %>% 
  hc_yAxis(title = list(text = "Cost (£)")) %>% 
  hc_xAxis(title = list(text = "Year")) %>% 
  hc_title(text = "The distribution of monthly national prescribing costs per year, from 2021 to 2024")

# Question 4: calculate the annual *mean* monthly total national prescribing cost and display in a vertical barchart
data %>% 
  group_by(YEAR, YM) %>%
  summarise(COST = sum(COST)) %>% 
  ungroup() %>% 
  group_by(YEAR) %>% 
  summarise(COST = mean(COST)) %>% 
  ungroup() %>% 
  hchart("column", hcaes(YEAR, COST)) %>% 
  hc_yAxis(title = list(text = "Mean monthly prescribing cost (£)")) %>% 
  hc_xAxis(title = list(text = "Year")) %>% 
  hc_title(text = "The national mean monthly prescribing cost across all prescribing, from 2021 to 2024")

# Question 5: Create a monthly line chart, which shows what percentage of *national* prescribing is from the '02: Cardiovascular System' BNF_CHAPTER.
data %>% 
  mutate(CARDIO_COST = ifelse(BNF_CHAPTER == "02: Cardiovascular System", COST, 0)) %>% 
  group_by(YM) %>% 
  summarise(
    COST = sum(COST),
    CARDIO_COST = sum(CARDIO_COST)
    ) %>% 
  ungroup() %>% 
  mutate(CARDIO_PCT = round(100 * CARDIO_COST / COST, 2)) %>% 
  hchart("line", hcaes(YM, CARDIO_PCT)) %>% 
  hc_yAxis(min = 0, title = list(text = "Percentage of prescribing (%)")) %>% 
  hc_xAxis(title = list(text = "Year-month")) %>% 
  hc_title(text = "The percentage of prescribing cost from the Cardiovascular System BNF Chapter out of all prescribing cost, in England from January 2021 to December 2024")
