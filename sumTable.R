# AGGREGATE TABLE
# ------------------------------------------------------------------

# # load necessary library: dplyr, ggplot2
library(dplyr)
library(ggplot2)

# # loading dataframes into variables 'obesity_df' and 'fastfood_df', and joining them together by State
obesity_df <- read.csv("obesity.csv", stringsAsFactors = FALSE)
fastfood_df <- read.csv("fastfood.csv", stringsAsFactors = FALSE)

obesity_fastfood_df <- left_join(obesity_df, fastfood_df)

# # filter for most recent data
obesity_fastfood_df <- obesity_fastfood_df %>% filter(Year == max(Year, na.rm = TRUE))

# Subset the `obesity_df` dataframe for our table. What we want to show:
# - select the state, population, obesity rate among Adults, percentage of fast food restaurants, and poverty rate.
# - sort in descending order by cases
# - slice the top 5 rows
agg_table <- obesity_fastfood_df %>% 
  select(State, Population, Adult.Obesity.100, All.fast.food.restaurants, Poverty.Rate.100) %>% 
  arrange(-Adult.Obesity.100) %>% 
  slice_head(n=5)

agg_table
