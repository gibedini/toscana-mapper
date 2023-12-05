## code to prepare `toscana` dataset goes here
library(here)
library(sf)

toscana_provinces <- st_read(here("data-raw","province","TOS_province.shp"))
my_crs <- sf::st_crs(toscana_provinces)$wkt

repl_crs <- gsub("(\\d+)\\°([A-Z])", "\\1deg \\2", my_crs, perl = TRUE)

sf::st_crs(toscana_provinces)$wkt <- repl_crs

usethis::use_data(toscana_provinces, overwrite = TRUE)
