library(tidyverse)
library(USAboundaries)
library(sf)
States <- us_states() %>%
  filter(name != "Alaska" & name != "Puerto Rico" & name != "Hawaii")
Colorado <- States %>%
  filter(name == "Colorado")
touchColorado = st_filter(states, Colorado, .predicate = st_touches)

map <- ggplot() +
  geom_sf(data = states) +
  geom_sf(data = touchColorado, fill = "red", alpha = 0.5) +
  labs(title = "States That Touch Colorado",
       x = "Longitude",
       y = "Latitude") +
  ggthemes::theme_map() +
  theme(legend.position = 'none')

ggsave(map, file = "img/12Q.png")
