
# Visualising Data Exercises

# NOTE: all chart axes must be labelled and have an appropriatee title

# Load Data
data = readRDS("Data/STEP_UP_REGIONAL_ANTIDEPRESSANTS.Rds")

# Load libraries
library(dplyr)
library(highcharter)

# Question 1: Create a horizontal bar chart of the top 5 most prescribed drugs in 2024, arranged in order.

# Data
df_bar = data %>% 
  filter(YEAR == 2024) %>% 
  group_by(DRUG) %>% 
  summarise(ITEMS = sum(ITEMS)) %>% 
  ungroup() %>% 
  top_n(10, ITEMS) %>% 
  arrange(ITEMS)

# Chart
hchart(df_bar, "bar", hcaes(DRUG, ITEMS)) %>% 
  hc_yAxis(title = list(text = "Total number of items")) %>% 
  hc_xAxis(title = list(text = "Drug name")) %>% 
  hc_title(text = "The top 10 nationally prescribed antidepressants in 2024")
  
# Question 2: Create a vertical bar chart showing the total annual cost of Sertraline hydrochloride prescribing in the NORTH EAST region.

# Data
df_column = data %>% 
  filter(
    REGION == "NORTH EAST AND YORKSHIRE",
    DRUG == "Sertraline hydrochloride"
    ) %>% 
  group_by(YEAR) %>% 
  summarise(COST = sum(COST)) %>% 
  ungroup()

# Chart
hchart(df_column, "column", hcaes(YEAR, COST)) %>% 
  hc_yAxis(title = list(text = "Cost in millions (£)")) %>% 
  hc_xAxis(title = list(text = "Year")) %>% 
  hc_title(text = "The annual prescribing cost of sertraline hydrochloride in the North East & Yorkshire region")

# Question 3: Create a line chart of the nationally monthly cost (rounded to the nearest pound) of escitalopram.

# Data
df_line = data %>% 
  filter(DRUG == "Escitalopram") %>% 
  group_by(YM) %>% 
  summarise(COST = round(sum(COST))) %>% 
  ungroup()

# chart
hchart(df_line, "line", hcaes(YM, COST)) %>% 
  hc_yAxis(min = 0, title = list(text = "Cost (£)")) %>% 
  hc_xAxis(title = list(text = "Year-month")) %>% 
  hc_title(text = "The national monthly prescribing cost of escitalopram")
