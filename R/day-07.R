#Xuefei Gao
#2020/8/13
#Joins&Pivots-Daily Exercises 7

#Question1
#Create data frame
library(ggplot2)
library(ggthemes)
library(tidyverse)
covid = read.csv("data/covid.csv")
region <- data.frame(
  abb = state.abb,
  state = state.name,
  region = state.region)
#Join new data.frame to the raw COVID data
inner_join(covid, region, by = "state") %>%
  group_by(date, region) %>%
  summarize(cases = sum(cases, na.rm = TRUE), deaths = sum(deaths, na.rm = TRUE)) %>%
#Pivot your data from wide format to long
  pivot_longer(cols = c('cases', 'deaths')) %>%
#Plot your data in a compelling way
  ggplot(aes(x = date, y = value)) +
  geom_line(aes(color = region), size = 0.5, group = 8) +
  facet_grid(name~region, scales = "free_y") +
  labs(title = "Regional COVID-19 Cases Count",
       x = "Date",
       y = "Daily Cases Count",
       caption = "Joins&Pivots-Daily Exercises 7") +
  theme_bw() +
  theme(legend.position = "none")
  ggsave(file = "img/07Q1-Plot.png")
