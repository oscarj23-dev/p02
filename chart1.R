library(dplyr)
library(plotly)
library(ggplot2)
library(tidyr)

# # loading datagrames into variables 'obesity' and 'fastfood_df', and joining them together by State
obesity_df <- read.csv("/Users/oscarmaldonado/Desktop/201/201_final/p02/obesity.csv", stringsAsFactors = FALSE)
fastfood_df <- read.csv("/Users/oscarmaldonado/Desktop/201/201_final/p02/fastfood.csv", stringsAsFactors = FALSE)

obesity_income_by_state <- obesity_df %>%
    group_by(State) %>%
    summarize(avg_obesity = mean(Adult.Obesity))

fastfood_obesity_by_state <- obesity_income_by_state %>% left_join(fastfood_df, by = "State")

scatter1 <- ggplot(fastfood_obesity_by_state, aes(x = avg_obesity, y = All.fast.food.restaurants)) +
    geom_point() +
    labs(title = "Fastfood Restaurants vs Average Obesity in US",
         x = "Average Obesity",
         y = "Fastfood Restaurants per 100k")

#summary for chart1: This chart represents the average obesity throughout the United States from 2014 to 2017. the X axis represents the years and the y axis represents the average obesity. Throughout these years the numbers didn't change much much thoughout the US, if anything they got a little worse. This matters because in recent history the numbers say that Americans haven't done a better job with obesity. One postive in this chart is that there is still hope because the rate only changed marginally. The purpose of this chart is to show that the obesity rate didn't get better for the American people and is nearly at .3 for all of the United States
