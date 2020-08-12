#Xuefei Gao
#2020/8/12
#My first Plots-Daily Exercises 6

#Question1
#Identify the 6 states with the most current cases
library(ggplot2)
library(ggthemes)
library(tidyverse)
covid = read.csv("data/covid.csv")
covid %>%
  filter(date == max(date)) %>%
  group_by(state) %>%
  summarize(cases = sum(cases, na.rm = TRUE)) %>%
  ungroup() %>%
  slice_max(cases, n = 6) %>%
  pull(state)
#Filter the raw data to those 6 states
covid %>%
  filter(state %in% c("California", "Florida", "Texas", "New York", "Georgia", "Illinois")) %>%
#Plot graphs for the 6 States
  ggplot(aes(x = date, y = cases)) +
  geom_line(aes(color = state), size = 0.1) +
  labs(title = "Top 6 States Covid-19 Case Counts",
  x = "Date",
  y = "Cases",
  caption = "My first Plots-Daily Exercises 6") +
  facet_wrap(~state) +
  ggthemes::theme_solarized_2() +
  ggsave(file = "img/Q1-Plot.png")

#Question2
#Identify the total cases each day in the whole country
library(ggplot2)
library(ggthemes)
library(tidyverse)
covid %>%
  group_by(date) %>%
  summarize(cases = sum(cases, na.rm = TRUE)) %>%
  arrange(-cases)
#Plot graph for each day cases nationally
covid %>%
  ggplot(aes(x = date, y = cases)) +
  geom_col(color = "green") +
  labs(title = "National Daily Total COVID Cases",
       caption = "My first Plots-Daily Exercises 6",
       x = "Date",
       y = "Cases") +
  ggthemes::theme_solarized() +
  ggsave(file = "img/Q2-Plot.png")
