library(ggplot2)
library(tidycensus)
library(tidyverse)
# Set your Census API key if you haven't already
census_api_key(Sys.getenv("CENSUS_API_KEY"))
# Get some census data for demonstration
demo_data <- get_acs(
  geography = "county",
  variables = c(
    median_income = "B19013_001",
    total_pop = "B01003_001"
  ),
  state = "PA",
  year = 2022,
  output = "wide"
) %>%
  mutate(county_name = str_remove(NAME, ", Pennsylvania"))

# Basic scatter plot
ggplot(demo_data) +
  aes(x = total_popE, y = median_incomeE) +
  geom_point()

##Improving Plots with Labels & Themes
ggplot(demo_data) +
  aes(x = total_popE, y = median_incomeE) +
  geom_point(alpha = 0.7) +
  geom_smooth(method = "lm", se = TRUE) +
  labs(
    title = "Income vs Population in Pennsylvania Counties",
    subtitle = "2018-2022 ACS 5-Year Estimates",
    x = "Total Population",
    y = "Median Household Income ($)",
    caption = "Source: U.S. Census Bureau ACS"
  ) +
  theme_minimal() +
  scale_y_continuous(labels = scales::dollar) +
  scale_x_continuous(labels = scales::comma)