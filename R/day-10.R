USAboundaries::us_states()
library(tidyverse)
library(USAboundaries)
library(USAboundariesData)
library(sf)

CONUS <- us_states %>%
  filter(name != "Alaska" & name != "Puerto Rico" & name != "Hawaii")

CONUS_ls0 <- CONUS %>%
  st_combine() %>%
  st_cast("MULTILINESTRING")
CONUS_ls0
plot(CONUS_ls0)

CONUS_ls <- CONUS %>%
  st_union() %>%
  st_cast("MULTILINESTRING")
CONUS_ls
plot(CONUS_ls)
