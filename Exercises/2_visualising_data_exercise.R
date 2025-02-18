
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
  top_n(10, ITEMS)

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



# Question 3: Create a line chart of the nationally monthly cost of escitalopram.
# Note: Colour the bars and add a theme. The title might need to split on 2 lines if it is very long.

# Data
df_line = data %>% 
  filter(DRUG == "Escitalopram") %>% 
  group_by(YM) %>% 
  summarise(COST = sum(COST)) %>% 
  ungroup()

# Chart
ggplot(df_line, aes(YM, COST, group = 1))+
  geom_point(color = "darkblue") +
  geom_line(colour = "darkblue") +
  theme_classic() +
  labs(
    x = "Year month",
    y = "Total cost (£)",
    title = "The monthly nationally cost of escitalopram prescribing "
  ) +
  theme(axis.text.x = element_text(angle = 90)) +
  scale_y_continuous(labels = label_comma(), , limits = c(0,NA)) 
