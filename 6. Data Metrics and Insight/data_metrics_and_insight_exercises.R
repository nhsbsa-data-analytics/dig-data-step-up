# Data Metrics and Insight Exercises

# Load Data
data = readRDS("Data/EXTENSION_STEP_UP_REGIONAL_ANTIDEPRESSANTS.Rds")

# Load libraries
library(dplyr)
library(highcharter)

# Question 1: Create a monthly bar chart, which shows what percentage of *national* prescribing is from the '02: Cardiovascular System' BNF_CHAPTER.

# Data
data %>% 
  mutate(CARDIO_ITEMS = ifelse(BNF_CHAPTER == "02: Cardiovascular System", ITEMS, 0)) %>% 
  group_by(YM) %>% 
  summarise(
    ITEMS = sum(ITEMS),
    CARDIO_ITEMS = sum(CARDIO_ITEMS)
    ) %>% 
  ungroup() %>% 
  mutate(CARDIO_PCT = round(100 * CARDIO_ITEMS / ITEMS, 2)) %>% 
  hchart("line", hcaes(YM, CARDIO_PCT)) %>% 
  hc_yAxis(min = 0)
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


highchart() %>% 
  hc_add_series(ad_pct_summary)


ad_pct %>% 
  group_by(REGION) %>%
  summary()


a = data_to_boxplot(ad_pct, AD_PCT, REGION, name = "Percentage of antidepressant prescribing")

highchart() %>%
  hc_chart(type = "boxplot") %>%
  hc_yAxis(type = "category") %>%
  hc_add_series_list(a)
