# Arbolado lineal de jacarandas, Ciuddad de Buenos Aires
# Fuente datos: Data Buenos Aires - Gobierno de la Ciudad de Buenos Aires.
 

library(sf)
library(tidyverse)

jacaranda <- read_sf("https://cdn.buenosaires.gob.ar/datosabiertos/datasets/arbolado-publico-lineal/arbolado-publico-lineal-2017-2018.geojson")
calles <- read_sf ("https://cdn.buenosaires.gob.ar/datosabiertos/datasets/ministerio-de-educacion/calles/callejero.geojson")  

p <- ggplot() +
  
  geom_sf(data = calles,
          fill = "transparent",
          colour = "#e4e8eb",
          stroke = 0.1) +
  
  geom_point(data = filter (jacaranda,nombre_cientifico =="Jacaranda mimosifolia"),
             aes(x = long, y = lat),
             size = 0.1 ,
             colour = "#7f57ba",
             alpha = 0.5
             ) +
    
  labs(
    title = toupper("Arbolado lineal de Jacarandás"),
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
  "jacarandasycalles5.png",
  plot = p,
  device = "png",
  height = 6,
  width = 6,
  bg = "#f6fcf5"
)
