
# Library
library(dplyr)

# Bnf data
bnf = read.csv("Data/BNF_LOOKUP.csv")

# Original Data
epd = read.csv("Data/DIG_DATA_EPD.csv")

# Extension data
extension_df = epd %>%
  inner_join(bnf) %>% 
  filter(YEAR_MONTH >= 202101) %>% 
  mutate(YEAR = substr(YEAR_MONTH,1,4)) %>% 
  transmute(
    YM = factor(YEAR_MONTH),
    YEAR = factor(YEAR),
    REGION = REGIONAL_OFFICE_NAME,
    BNF_CHAPTER = BNF_CHAPTER_PLUS_CODE,
    BNF_SECTION = SECTION_DESCR,
    DRUG = CHEMICAL_SUBSTANCE_BNF_DESCR,
    ITEMS = ITEMS,
    COST = NIC
  ) %>% 
  filter(REGION != "UNIDENTIFIED")

# Standard data
standard_df = extension_df %>% 
  filter(BNF_SECTION == "Antidepressant drugs") %>% 
  group_by(
    YM,
    YEAR,
    REGION,
    DRUG
  ) %>% 
  summarise(
    ITEMS = sum(ITEMS),
    COST = sum(COST)
  ) %>% 
  ungroup()

# Save Data
saveRDS(standard_df, "Data/STEP_UP_REGIONAL_ANTIDEPRESSANTS.Rds")
saveRDS(extension_df, "Data/EXTENSION_STEP_UP_REGIONAL_ANTIDEPRESSANTS.Rds")

# Check consistency
a = readRDS("Data/STEP_UP_REGIONAL_ANTIDEPRESSANTS.Rds")
b = readRDS("Data/EXTENSION_STEP_UP_REGIONAL_ANTIDEPRESSANTS.Rds")

# check number of differing rows after aggregation
setdiff(
  x = b %>% 
    filter(BNF_SECTION == "Antidepressant drugs") %>% 
    group_by(
      YM,
      YEAR,
      REGION,
      DRUG
    ) %>% 
    summarise(
      ITEMS = sum(ITEMS),
      COST = sum(COST)
    ) %>% 
    ungroup(),
  y = a
)

# check structures
str(extension_df)
str(standard_df)

# Clean up
rm(list = ls()); gc()
