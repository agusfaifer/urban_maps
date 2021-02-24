# Áreas Proteccion Historica, Ciudad de Buenos Aires
# Fuente datos: Data Buenos Aires - Gobierno de la Ciudad de Buenos Aires.
# https://data.buenosaires.gob.ar/dataset/areas-proteccion-historica/archivo/d8e1a617-f2e3-4b69-a824-2ae254a20430

library(sf)
library(tidyverse)

areasph <- read_sf("https://cdn.buenosaires.gob.ar/datosabiertos/datasets/secretaria-de-desarrollo-urbano/areas-proteccion-historica/areas-proteccion-historica.geojson")

p <- ggplot() +
  geom_sf(data = areasph,
          fill = "#044f64",
          colour = "transparent") +

  labs(
    title = toupper("Áreas de Protección Historica"),
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
  "areasproteccionhistorica.png",
  plot = p,
  device = "png",
  height = 6,
  width = 6,
  bg = "#f2f2f2"
)
