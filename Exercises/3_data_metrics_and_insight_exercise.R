# Data Metrics and Insight Exercises

# Load Data
data = readRDS("Data/EXTENSION_STEP_UP_REGIONAL_ANTIDEPRESSANTS.Rds")

# Load libraries
library(dplyr)
library(highcharter)

# Question 1: For context, create a monthly line chart showing total prescribing cost
data %>% 
  group_by(YM) %>%
  summarise(COST = sum(COST)) %>% 
  ungroup() %>% 
  hchart("line", hcaes(YM, COST)) %>% 
  hc_yAxis(min = 0)

# Question 2: Create *annual* summary statistics, for the min, Q1, median, Q3 and maximum national monthly prescribing cost (i.e. all drugs across all regions)
# HINT: first calculate the monthly cost, for all months within each year. 
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
box = data %>% 
  group_by(YM, YEAR) %>% 
  summarise(COST = sum(COST)) %>% 
  ungroup()

hcboxplot(x = box$COST, var = box$YEAR)

# Question 4: calculate the annual *mean* monthly total national prescribing cost and display in a barchart
data %>% 
  group_by(YEAR, YM) %>%
  summarise(COST = sum(COST)) %>% 
  ungroup() %>% 
  group_by(YEAR) %>% 
  summarise(COST = mean(COST)) %>% 
  ungroup() %>% 
  hchart("column", hcaes(YEAR, COST))

# Question 5: Create a monthly line chart, which shows what percentage of *national* prescribing is from the '02: Cardiovascular System' BNF_CHAPTER.
data %>% 
  mutate(CARDIO_COST = ifelse(BNF_CHAPTER == "21: Appliances", COST, 0)) %>% 
  group_by(YM) %>% 
  summarise(
    COST = sum(COST),
    CARDIO_COST = sum(CARDIO_COST)
    ) %>% 
  ungroup() %>% 
  mutate(CARDIO_PCT = round(100 * CARDIO_COST / COST, 2)) %>% 
  hchart("line", hcaes(YM, CARDIO_PCT)) %>% 
  hc_yAxis(min = 0)

# Question 6: Create a 


data %>% 
  filter(REGION == "LONDON") %>% 
  filter(DRUG == "Sertraline hydrochloride") %>% 
  group_by(YM) %>% 
  summarise(A = sum(ITEMS)) %>% 
  ungroup() %>% 
  hchart("line", hcaes(YM, A)) %>% 
  hc_yAxis(min = 0)
