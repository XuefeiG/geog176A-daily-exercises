#Xuefei Gao
#2020/8/17
#Lags&Rolling Means-Daily Exercises 7

#Question1
library(zoo)
library(ggplot2)
library(ggthemes)
library(tidyverse)
covid = read.csv("data/covid.csv")

covid %>%
  filter(state == "Texas") %>%
  group_by(date) %>%
  summarize(cases = sum(cases)) %>%
  mutate(newcases = cases - lag(cases),
        roll7 = rollmean(newcases, 7, fill=NA, align = 'right')) %>%
  ggplot(aes(x = date) ) +
  geom_col(aes(y = newcases), col = NA, fill = "#50d0d0") +
  geom_line(aes(y = roll7, group = 1)) +
  ggthemes::theme_economist() +
  labs(title = "Daily New Cases in Texas",
       caption = "Lags&Rolling Means-Daily Exercises 7") +
  theme(plot.title = element_text(size = 10, face = 'bold'))
  aspect_ratio <- 1.5
  ggsave(file = "img/08Q1-Plot.png", height = 7 , width = 7 * aspect_ratio)
