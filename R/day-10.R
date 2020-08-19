USAboundaries::us_states()
library(tidyverse)
library(USAboundaries)
library(USAboundariesData)
library(sf)
states <- us_states()
CONUS <- states %>%
  filter(name != "Alaska" & name != "Puerto Rico" & name != "Hawaii")

CONUS_ls <- CONUS %>%
  st_union() %>%
  st_cast("MULTILINESTRING")
CONUS_ls2
plot(CONUS_ls)
