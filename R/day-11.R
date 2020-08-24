library(tidyverse)
library(sf)

cities = readr::read_csv("data/uscities.csv") %>%
  st_as_sf(coords = c("lng", "lat"), crs = 4326)

mycity <- cities %>%
  filter(city %in% c("Santa Barbara", "Rio"))

equal <- st_transform(mycity, 5070)
equidistant <- st_transform(mycity, '+proj=eqdc +lat_0=40 +lon_0=-96 +lat_1=20 +lat_2=60 +x_0=0 +y_0=0 +datum=NAD83 +units=m +no_defs')

st_distance(mycity)
st_distance(equal)
st_distance(equidistant)

st_distance(equal) %>%
  units::set_units("km") %>%
  units::drop_units()
