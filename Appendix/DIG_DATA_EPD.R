
# Check if pacman not already installed, if not install
if(!'pacman' %in% rownames(installed.packages())){
  install.packages('pacman')
  }

# Load required packages
pacman::p_load(
  'dplyr',
  'jsonlite',
  'rprojroot',
  'readr'
  )

# Set directory to project root
setwd(find_root(criterion = is_rstudio_project))

# Function to add a zero to generate year month strings
add_zero = function(x) ifelse(nchar(x) == 1, paste0("0", x), x)

# Define max year month: MANUALLY DEFINE
min_year_month = 202101

# Define max year month: MANUALLY DEFINE
max_year_month = 202412

# Generate max year
max_year = substr(max_year_month, 1, 4)

# Generate list of year months for epd query
year_month_vec = expand.grid(
  2014:max_year,
  add_zero(1:12)
  ) %>% 
  transmute(YEAR_MONTH = as.integer(paste0(Var1, Var2))) %>% 
  filter(
    YEAR_MONTH <= max_year_month,
    YEAR_MONTH >= min_year_month
    ) %>% 
  arrange(YEAR_MONTH) %>% 
  pull()

# Function to get data from epd
get_epd_data = function(year_month){
  
  # Print 
  print(paste0("Year Month: ", year_month))
  
  # Use year month string to generate query
  query = paste0(
    "https://opendata.nhsbsa.net/api/3/action/datastore_search_sql?resource_id=EPD_",
    year_month,
    "&sql=select year_month, regional_office_name, bnf_chapter_plus_code, chemical_substance_bnf_descr, bnf_chemical_substance, sum(items) as items, sum(nic) as nic from `EPD_",
    year_month,
    "` group by year_month, regional_office_name, bnf_chapter_plus_code, chemical_substance_bnf_descr, bnf_chemical_substance"
  )
  
  # Encode query
  sql_query = URLencode(query)
  
  # Collect 
  data = fromJSON(sql_query)
  
  # Get results from collected json
  results = data$result$result$records
  
  # Format final results or row bind
  results = results %>% 
    select(
      year_month, 
      regional_office_name, 
      bnf_chapter_plus_code, 
      chemical_substance_bnf_descr, 
      bnf_chemical_substance,
      items,
      nic
    )
  
  # Print row count
  print(paste0("Number of rows: ", nrow(results)))
  
  # Return final tabular data
  return(results)
}

# Loop through year months with function: ~25 mins
data = lapply(year_month_vec, get_epd_data)

# Bind rows: 50 MB
epd = data %>% 
  bind_rows() %>% 
  rename_all(.funs = toupper)

# Bnf lookup
bnf = read.csv("Appendix/BNF_LOOKUP.csv")

# Extension data
extension_df = epd %>%
  inner_join(bnf) %>% 
  filter(YEAR_MONTH >= min_year_month) %>% 
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
  filter(REGION != "UNIDENTIFIED") %>% 
  arrange(BNF_SECTION, BNF_SECTION, DRUG, REGION, YM)

# Standard data
standard_df = extension_df %>% 
  filter(BNF_SECTION == "Antidepressant drugs") %>% 
  select(-BNF_CHAPTER, -BNF_SECTION)

# Save Data
saveRDS(standard_df, "Data/STEP_UP_REGIONAL_ANTIDEPRESSANTS.Rds")
saveRDS(extension_df, "Data/EXTENSION_STEP_UP_REGIONAL_ANTIDEPRESSANTS.Rds")

# Save Data as csv
write_csv(standard_df, "Data/STEP_UP_REGIONAL_ANTIDEPRESSANTS.csv")
write_csv(extension_df, "Data/EXTENSION_STEP_UP_REGIONAL_ANTIDEPRESSANTS.csv")

# Clean
rm(list = ls()); gc()
