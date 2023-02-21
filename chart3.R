# Mapping obesity by state

# Install maps packages
install.packages("maps")
install.packages("plotly")

# Load libraies 
library(dplyr)
library(plotly)
library(ggplot2)
library(tidyr)


# Load data
obesity_df <- read.csv("https://www.cdc.gov/obesity/data/maps/2021/Obesity-prevalence-by-state-2021.csv", stringsAsFactors = FALSE)

# Load state shapefile 
state_shape <- map_data("state")
View(state_shape)

# Create new column for full state name lowercased
obesity_df <- obesity_df %>% 
  mutate(state_fullname =
  tolower(State))


# Create dataframe that summarizes each state with total prevalence
obesity_state_data <- obesity_df %>% 
  group_by(state_fullname) %>% 
  summarize(state_total = sum(Prevalence, na.rm = TRUE))

  


# Create new dataframe by combining both dataframes state_shape and obesity_state_data

obesity_state_shape_data <- left_join(state_shape, obesity_state_data, by= c("region" = "state_fullname"))

  

# Create a choropleth map of total prevalences in each state
ggplot(obesity_state_shape_data) +
  geom_polygon(mapping = aes(x = long, 
                             y = lat, 
                             group = group, fill = state_total)) +
                            
  coord_map() +
  
  
  labs(title = 'Total Obesity in US', fill = 'Obesity Rates (Prevalence)')



#PARAGRAPH : This is a map consisting of the prevalences of self-reported obesity by State and Territory in 2021. Each prevalence was calculated by the longitude and latitude categorized by each state in the US. From the map, we can see that the highest state for the most self-reported obesity rates in the US was Kentucky while the state with the least self-reported obesity rates in the US was Flordia due to there being no data information found. 

  