# dig-data-step-up
The Dig Data Step Up Career Challenge

Part One: Data Reporting


0. Introduction to R

Functions:

- print()
- getwd()
- list.files()
- readRDS()
- str()
- summary()
- table()
- head()
- ncol()
- nrow()
- nlevels()

Content:

- Why use R?
- Markdown documents
- R Studio overview
- Directories
- Data used in the Step-up Challenge
- Basic Base r functions

Exercise:

The introduction to R section does not have any questions. It is a walk-through tutorial.



1. Transforming and Aggregating Data

Functions:

- install.packages()
- library()
- select()
- filter()
- distinct()
- group_by()
- summarise()
- ungroup()
- sum()
- n_distinct()
- arrange()
- top_n()
- pivot_wider()
- rename()

Content:

- Installing and loading a package
- The dplyr package
- The pipe operator (%>%)
- Assigning a value to a new object
- Logical operators (== and !=)
- Basic dplyr transformations
- Basic dplyr aggregations
- Basic dplyr sorting

Exercise:  

Question 1: Nationally, calculate the top 10 prescribed anti-depressants across the whole time frame, sorted from biggest from smallest.
Question 2: Calculate the monthly national cost of Mirtazapine prescribing 
Question 3: What is the annual spend of Sertraline hydrochloride prescribing in the Midlands region?
Question 4: How many anti-depressant items were prescribed nationally in 2024?


2. Visualising Data  

Functions:  

- hchart()
- hc_yAxis()
- hc_xAxis
- hc_title()
- hc_tooltip()
- hc_plotOptions (additional code for new charts at the end)
- round()

Content:  

- Stages of generating a chart
- Horizontal and vertical bar charts
- Line charts
- Labelling chart axes and titles
- Using the OR logical operator  
- 'Piping' dplyr code into hchart
- hchart chart type varieties

Exercise:  

Question 1: Create a horizontal bar chart of the top 5 most prescribed drugs in 2024, arranged in order.
Question 2: Create a vertical bar chart showing the total annual cost of sertraline hydrochloride prescribing in the North East region.
Question 3: Create a line chart of the nationally monthly cost (rounded to the nearest pound) of escitalopram.


3. Data Metrics and Insight

Functions:

- mutate()
- ifelse()
- case_when()
- round()
- min()
- max()
- median()
- mean()
- quartile()
- hcboxplot()

Content:

- Creating new variables
- Conditional logic
- Logical operators (<, >, <= and >=)
- Metric generation
- Numerical statistical inference
- Visual statistical inference

Exercise:  

Question 1: For context, create a monthly line chart showing total national prescribing cost  
Question 2: Create *annual* summary statistics, for the min, Q1, median, Q3 and maximum national monthly prescribing cost (i.e. all drugs across all regions)  
Question 3: create a grouped boxplot that shows the above information (4 boxplots, 1 per year)  
Question 4: calculate the annual *mean* monthly total national prescribing cost and display in a vertical barchart  
Question 5: Create a monthly line chart, which shows what percentage of *national* prescribing is from the '02: Cardiovascular System' BNF_CHAPTER.  


REPORT: Data Reporting (Q1 & Q2) or Data Insight (Q1, Q2 & Q3)









