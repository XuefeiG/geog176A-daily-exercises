#Xuefei Gao
#2020/8/12
#My first Plots-Daily Exercises 6

#Question1
#Identify the 6 states with the most current cases
library(ggplot2)
library(ggthemes)
library(tidyverse)
covid = read.csv("data/covid.csv")
topstates <- covid %>%
  filter(date == max(date)) %>%
  group_by(state) %>%
  summarize(cases = sum(cases, na.rm = TRUE)) %>%
  ungroup() %>%
  slice_max(cases, n = 6) %>%
  pull(state)
#Filter the raw data to those 6 states
statecumu <- covid %>%
  filter(state %in% topstates) %>%
  group_by(state, date) %>%
  summarize(cases = sum(cases, na.rm = TRUE)) %>%
  ungroup()
#Plot graphs for the 6 States
  ggplot(data = statecumu, aes(x = date, y = cases)) +
  geom_line(aes(color = state), size = 0.8, group = 6) +
  labs(title = "Top 6 States Covid-19 Case Counts",
  x = "Date",
  y = "Cases",
  caption = "My first Plots-Daily Exercises 6") +
  facet_wrap(~state) +
  ggthemes::theme_igray() +
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
  geom_col(color = "red") +
  labs(title = "National Daily Total COVID Cases",
       caption = "My first Plots-Daily Exercises 6",
       x = "Date",
       y = "Cases") +
  ggthemes::theme_igray() +
  ggsave(file = "img/Q2-Plot.png")
