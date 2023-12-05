## code to prepare `toscana` dataset goes here
## script by G. Bedini 8 April 2023

library(here)
library(sf)

toscana <- st_read(here("data-raw","toscana_shp_32632.shp"))
my_crs <- sf::st_crs(toscana)$wkt

repl_crs <- gsub("(\\d+)\\°([A-Z])", "\\1deg \\2", my_crs, perl = TRUE)

sf::st_crs(toscana)$wkt <- repl_crs

usethis::use_data(toscana, overwrite = TRUE)
