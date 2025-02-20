
# Check if pacman not already installed, if not install
if(!'pacman' %in% rownames(installed.packages())){
  install.packages('pacman')
}

# Load required packages
pacman::p_load(
  'dplyr',
  'dbplyr'
)

# Connect to DALP
con = nhsbsaR::con_nhsbsa(database = "DALP")

# Bnf lookup
bnf = con %>% 
  tbl(from = in_schema("DIM", "CDR_DY_DRUG_BNF_DIM"))

# Collect as df
df = bnf %>% 
  select(
    SECTION_DESCR,
    PARAGRAPH_DESCR,
    BNF_CHEMICAL_SUBSTANCE,
    CHEMICAL_SUBSTANCE_BNF_DESCR
  ) %>% 
  distinct() %>% 
  filter(!is.na(BNF_CHEMICAL_SUBSTANCE)) %>% 
  collect()

# Set directory to project root
setwd(find_root(criterion = is_rstudio_project))

# Save data
write.csv(df, "Appendix/BNF_LOOKUP.csv")
