# # load necessary library: dply, ggplot
library(dplyr)
library(ggplot2)
library(plotly)

# # loading datagrames into variables 'obesity' and 'fastfood_df', and joining them together by State
obesity_df <- read.csv("/Users/oscarmaldonado/Desktop/201/201_final/p02/obesity.csv", stringsAsFactors = FALSE)
fastfood_df <- read.csv("/Users/oscarmaldonado/Desktop/201/201_final/p02/fastfood.csv", stringsAsFactors = FALSE)

# create a dataframe that groups average obesity by year
obesity_by_year <- obesity_df %>%
    group_by(Year) %>%
    summarize(avg_obesity = mean(Adult.Obesity))

# create a dataframe with adult obesity a
bar1 <- ggplot(obesity_by_year, aes(x = Year, y = avg_obesity)) +
    geom_bar(stat = "identity", fill = "steelblue") +
    theme_minimal() +
    labs(title = "Fastfood Restaurants vs Average Obesity in US",
         x = "Average Obesity",
         y = "Fastfood Restaurants per 100k")

