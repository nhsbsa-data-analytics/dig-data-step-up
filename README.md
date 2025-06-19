# dig-data-step-up
The Dig Data Step Up Career Challenge


# Learning Material & Exercises


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


# Report

Data Reporting (Part 1 & Q2)  
Data Insight (Part 1, Q2 & Q3)

# Part One

These required content for Part One is: 

1. Create two vertical bar charts for comparison.
   First, create a bar chart showing the total annual antidepressant prescribing  (items).
   Second, create a bar chart that shows the total antidepressant prescribing cost.
   Describe the trend of each chart and compare the charts against each other.
   
2. Create two tables for comparison.
   First, create a table showing the total annual antidepressant prescribing per region (items, pivot_wider).
   Second, create a table showing the annual antidepressant prescribing cost per region (pivot_wider). 
   Describe some regional changes and contrasts between 2021 and 2024.
   (NOTE: within mutate a numerical column name, e.g. 2021 must be placed with ticks, so `2021`, for example *mutate(NEW_VAL = `2021` + `2022`)*)
   
3. By now you may have noticed there are contrasts between antidepressant prescribing volumes and costs.
   Next, we will create two horizontal bar charts for comparison.
   First, create an ordered bar chart showing the 10 most prescribed antidepressants in the most recent year (items).
   Second, create an ordered bar chart that shows antidepressants with the greatest total prescribing cost in the most recent year.
   Highlight and describe any differences between the charts. 
   
Try and make text between sections flow, so the report reads well.
The findings from part one may inform ho you approach part two.

# Part Two (Longitudinal Analysis)

Now you have a good understanding around national and regional antidepressant prescribing volume and cost trends.
You will be given various topics or points to explore, and you will decide what approach or charts best does this.
To supplement the initial analysis, you will now:

- Look at the longitudinal (monthly) trend for all antidepressant items and for the cost of antidepressant prescribing
- Then, explore the data and find the antidepressant drugs that are driving these monthly item and cost trends.
- Then give a high-level summary to your work and findings.


# Part Two Extension (Antidepressant Case studies)

The extension is only to be attempted if you completed the data_metrics_and_insights learning material and exercises. 
The analyses within this section will delve a bit deeper into antidepressant prescribing costs.

- Focus one one or more antidepressants that play a significant role in national volume and cost trends.
- Try to offer more granular insight into their effect on national prescribing trends
- Percentage of total antidepressant volume or cost from a drug 
- Mean cost per item in relation a drug
- Distribution of mean cost per item values for a drug
- Anything else you think might be informative or relevant (be creative!)
- Then give a high-level summary to your work and findings.

# Order of Materials  

Introduction

1. Videos/posit_cloud_setup.mp4
2. Learning Material/0_introduction_to_r.Rmd

Aggregating Data

3. Learning Material/1_and_aggregating_data.Rmd
4. Exercises/1_transforming_and_aggregating_data_exercise.r
5. Videos/1_transforming_and_aggregating_data_video.mp4

Visualising Data  

6. Learning Material/2_visualising_data.Rmd
7. Exercises/2_visualising_data_exercise.R
8. Videos/2_visualising_data_exercise_video.mp4

Data Metrics  

9. Learning Material/3_data_metrics_and_insight.Rmd
10. Exercises/3_data_metrics_and_insight_exercise.R
11. Videos/3_data_metrics_and_insight_video.mp4

Final Report

12. Videos/antidepressant_prescribing_report_setup.mp4
13. Exercises/antidepressant_prescribing_report.Rmd

After you complete the final report, you can be given the final video which reviews the final report.  

