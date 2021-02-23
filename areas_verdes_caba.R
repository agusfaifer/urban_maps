# Áreas Verdes, Ciuddad de Buenos Aires
# Fuente datos: Data Buenos Aires - Gobierno de la Ciudad de Buenos Aires.
# https://data.buenosaires.gob.ar/dataset/espacios-verdes

library(sf)
library(tidyverse)

verdes <- read_sf("https://cdn.buenosaires.gob.ar/datosabiertos/datasets/secretaria-de-desarrollo-urbano/espacios-verdes/espacio-verde-publico.geojson")
verdeprivado <- read_sf("https://cdn.buenosaires.gob.ar/datosabiertos/datasets/secretaria-de-desarrollo-urbano/espacios-verdes/espacio-verde-privado.geojson")
verdecatastrales <- read_sf("https://cdn.buenosaires.gob.ar/datosabiertos/datasets/secretaria-de-desarrollo-urbano/espacios-verdes/espacios-verdes-catastrales.geojson")

p <- ggplot() +
  
  geom_sf(data = verdecatastrales,
          fill = "#3DB483",
          colour = "transparent") +
  
  geom_sf(data = verdes,
          fill = "#3DB483",
          colour = "transparent") +
  
  geom_sf(data = verdeprivado,
          fill = "#06c719",
          colour = "transparent")  +
  labs(
    title = toupper("Áreas Verdes"),
    subtitle = toupper("Ciudad de Buenos Aires"),
    caption = "@agusfaifer"
  ) +
  theme_void() +
  theme(
    plot.margin = unit(c(5, 5, 5, 5), "mm"),
    panel.spacing = unit(0, "mm"),
    legend.position = "bottom",
    legend.justification = "left",
    plot.caption.position = "panel",
    plot.title.position = "panel",
    text = element_text(size = 8, colour = "grey60"),
    plot.title = element_text(hjust = 0),
    legend.margin = margin(0, 0, 0, 0),
    legend.box.margin = margin(-10, -10, -10, -10)
  )
  

ggsave(
  "areasverdestotalescaba3.png",
  plot = p,
  device = "png",
  height = 6,
  width = 6,
  bg = "#f6fcf5"
)


