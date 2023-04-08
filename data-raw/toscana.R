## code to prepare `toscana` dataset goes here
## script by G. Bedini 8 April 2023

library(here)
library(sf)

toscana <- st_read(here("data-raw","toscana_shp_32632.shp"))
usethis::use_data(toscana, overwrite = TRUE)
