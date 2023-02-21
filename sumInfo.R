# SUMMARY INFORMATION
# --------------------------------------------
# These datasets include the obesity rates found in the US as well as
#fast food restaurants. From the information found in
#these datasets, we are able to compared how the
#number of fast food resturants in each state impact the
#level of obesity rates.

# Load libraies
library(dplyr)
library(plotly)
library(ggplot2)
library(tidyr)


# Load data
obesity_df <- read.csv("https://www.cdc.gov/obesity/data/maps/2021/Obesity-prevalence-by-state-2021.csv", stringsAsFactors = FALSE)

# Load state shapefile

# Create new column for full state name lowercased
obesity_df <- obesity_df %>%
    mutate(state_fullname =
               tolower(State))

avg <- obesity_df %>% summarize(average = mean(as.double(Prevalence), na.rm = T)) %>% pull(average)
avg <- round(avg, 2)
print(avg)
max <- obesity_df %>% summarize(maximum = max(as.double(Prevalence), na.rm = T)) %>% pull(maximum)
print(max)
min <- obesity_df %>% summarize(minimum = min(as.double(Prevalence), na.rm = T)) %>% pull(minimum)
print(min)
how_many <- obesity_df %>% filter(as.double(Prevalence) < avg)
under_avg <- nrow(how_many)
print(under_avg)
how_many <- obesity_df %>% filter(as.double(Prevalence) > avg)
over_avg <- nrow(how_many)
print(over_avg)

