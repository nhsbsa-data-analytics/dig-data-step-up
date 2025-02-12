
# Visualising Data Exercises

# Load Data
data = readRDS("Data/STEP_UP_REGIONAL_ANTIDEPRESSANTS.Rds")

# Load libraries
library(dplyr)
library(scales)
library(ggplot)

# Question 1: Create a horizontal bar chart of the top 5 most prescribed drugs in 2024, arranged in order.
# Note: Colour the bars and add a theme. The title might need to split on 2 lines if it is very long.

# Data
df_bar = data %>% 
  filter(YEAR == 2024) %>% 
  group_by(DRUG) %>% 
  summarise(ITEMS = sum(ITEMS)) %>% 
  ungroup() %>% 
  top_n(10, ITEMS)

# Chart
ggplot(df_bar, aes(reorder(DRUG, ITEMS), ITEMS))+
  geom_col(fill = "darkblue")+
  coord_flip()+
  theme_classic()+
  labs(
    x = "Drug name",
    y = "Total number of items",
    title = "The top 10 nationally prescribed antidepressants in 2024"
  ) +
  scale_y_continuous(labels = label_comma())

# Question 1: Create a line chart of the nationally monthly cost of escitalopram.
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
