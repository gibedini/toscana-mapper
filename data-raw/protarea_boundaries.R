### protarea_boundaries.R
### load shapefile of protected areas of Tuscany (single consolidated file with all area types)
### MAKE SURE TO HAVE LAUNCHED start_here.R FIRST
toscana_protareas <- st_read(here("data-raw","aree_protette","APToscana_tutte.shp")) %>%
  mutate(GROUP_CODE = case_when(
    AP_PN_  != 0 ~ "PNA",
    AP_PP_  != 0 ~ "PPR",
    AP_RNS_ != 0 ~ "RNS",
    NAT2000 != "0" ~ "N2K",
    grepl("PARCO REGIONALE", NOME) == TRUE ~ "PRE",
    grepl("^RP[A-Z]{2}[0-9]{2}$", CODICE) == TRUE ~ "RRE",
    grepl("^AP[A-Z]{2}[0-9]{2}$", CODICE) == TRUE ~ "ANP"
  )) %>%
  sf::st_transform(32632)

my_crs <- sf::st_crs(toscana_protareas)$wkt

repl_crs <- gsub("(\\d+)\\°([A-Z])", "\\1deg \\2", my_crs, perl = TRUE)

sf::st_crs(toscana_protareas)$wkt <- repl_crs

usethis::use_data(toscana_protareas, overwrite = TRUE)

ggplot() +
  geom_sf(data = toscana) +
  geom_sf(data = toscana_provinces) +
  geom_sf(data = toscana_protareas, aes(fill = GROUP_CODE)) +
  theme_bw()
