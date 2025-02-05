
# Check if pacman not already installed, if not install
if(!'pacman' %in% rownames(installed.packages())){
  install.packages('pacman')
  }

# Load required packages
pacman::p_load(
  'dplyr',
  'jsonlite'
  )

# Function to add a zero to generate year month strings
add_zero = function(x) ifelse(nchar(x) == 1, paste0("0", x), x)

# Get year from year month
get_year = function(x) substr(x, 1, 4)

# Define min year month: MANUALLY DEFINE
min_year_month = 202101

# Define max year month: MANUALLY DEFINE
max_year_month = 202410

# Generate list of year months for epd query
year_month_vec = expand.grid(
  get_year(min_year_month):get_year(max_year_month),
  add_zero(1:12)
  ) %>% 
  transmute(YEAR_MONTH = as.integer(paste0(Var1, Var2))) %>% 
  filter(
    YEAR_MONTH <= max_year_month,
    YEAR_MONTH >= min_year_month
    ) %>% 
  arrange(YEAR_MONTH) %>% 
  pull()

# String (rather than vector) of query grouping columna
grouping_columns = c(
  "YEAR_MONTH,
  REGION_NAME,
  BNF_CHAPTER,
  BNF_CHAPTER_CODE,
  BNF_SECTION,
  BNF_SECTION_CODE,
  BNF_PARAGRAPH,
  BNF_PARAGRAPH_CODE,
  BNF_CHEMICAL_SUBSTANCE,
  BNF_CHEMICAL_SUBSTANCE_CODE"
  )

# Function to get single month of pca data
get_pca_data = function(year_month){
  
  # Print 
  print(paste0("Year Month: ", year_month))
  
  # Use year month string to generate query
  query = paste0(
    "https://opendata.nhsbsa.net/api/3/action/datastore_search_sql?resource_id=PCA_",
    year_month,
    "&sql=select ",
    grouping_columns,
    ", sum(ITEMS) as ITEMS, sum(NIC) as NIC from `PCA_", 
    year_month,
    "` GROUP BY ",
    grouping_columns
  )
  
  # Encode query
  sql_query = URLencode(query)
  
  # Collect 
  data = fromJSON(sql_query)
  
  # Get results from collected json
  results = data$result$result$records
  
  # Define select columns
  select_cols = c(strsplit(grouping_columns, ",\\s*")[[1]], "ITEMS", "NIC")
  
  # Format final results or row bind
  results = results %>% select(all_of(select_cols))
  
  # Print row count
  print(paste0("Number of rows: ", nrow(results)))
  
  # Sys sleep for api throttle
  Sys.sleep(2)
  
  # Return final tabular data
  return(results)
}

# Loop through year months with function: ~10 mins
data = lapply(year_month_vec, get_pca_data)

# Bind rows: 35 MB
df = data %>% bind_rows() 

# Save data
write.csv(df, "OneDrive - NHS Business Services Authority/Desktop/DIG_DATA/DIG_DATA_PCA.csv")
