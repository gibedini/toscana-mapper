## code to prepare `toscana` dataset goes here
library(here)
library(sf)

toscanaR <- st_read(here("data-raw","toscana_shp_32632.shp"))

usethis::use_data(toscanaR, overwrite = TRUE)
