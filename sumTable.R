# AGGREGATE TABLE
# ------------------------------------------------------------------

# # loading dplyr
library(dplyr)

# # loading dataframes into variables 'obesity_df' and 'fastfood_df'
obesity_df <- read.csv("obesity.csv", stringsAsFactors = FALSE)
fastfood_df <- read.csv("fastfood.csv", stringsAsFactors = FALSE)

# # joining the 'obesity_df' and 'fastfood_df' together by States, filtering by the most recent year, and renaming columns to something more readable
obesity_fastfood_df <- left_join(obesity_df, fastfood_df) %>%
  filter(Year == max(Year, na.rm = TRUE)) %>% 
  rename("Adults with Obesity" = "Adult.Obesity.100", 
         "Average Age" = "Average.Age", 
         "All Fast Food Restaurants" = "All.fast.food.restaurants", 
         "Average Income" = "Average.Income", 
         "Poverty Rate" = "Poverty.Rate.100")

# # subsetting the 'obesity_fastfood_df' dataframe for our table. What we want to show:
# - select State, Population, Adults with Obesity, Average Age, Average Income, All Fast Food Restaurants, and Poverty Rate
# - sort in descending order by Adults with Obesity
agg_table <- obesity_fastfood_df %>% 
  select(State, 
         Population, 
         `Adults with Obesity`, 
         `Average Age`, 
         `Average Income`, 
         `All Fast Food Restaurants`, 
         `Poverty Rate`) %>% 
  arrange(-`Adults with Obesity`)

agg_table

# # PARAGRAPH: describe why you included the table and what it describes
# This 2017 obesity and fast food data includes 50 U.S. states and is organized from the state with the highest rate of obesity in adults to least. Additional information such as each state’s corresponding population, its poverty rate, the average age of adults with obesity, their average income, and availability to all fast food restaurants is included in the table. By providing this table, we can identify which states are most and least affected and compare their economic situations with each other to find potential patterns and significant differences. Our data shows that Mississipi is the most obese state with 35.2% of their adults with obesity. If we compare it to the least obese state Colorado with 20.2%, we see that that they have similar availability to all fast food chains. However, if we compare their incomes, those from Mississipi made around 13,000 dollars less than those from Colorado and their poverty rates had a 9.48% difference. It is evident that as you go down the table to the least obese states, the average income grows bigger and the poverty rates decreases.
