# Import libraries
library(ggmap)
library(tidyverse)

# Import dataset 
setwd("./")
df <- read.csv("./data/geo_locations.csv")

# Load world map data
map_world <- map_data("world")

# Create map theme
map_theme <- 
  theme(text = element_text(family = "Gill Sans", color = "#444444")) +
  theme(plot.title = element_text(size = 32)) +
  theme(plot.subtitle = element_text(size = 16)) +
  theme(panel.grid = element_blank()) +
  theme(axis.text = element_blank()) +
  theme(axis.ticks = element_blank()) +
  theme(axis.title = element_blank()) +
  theme(legend.background = element_blank()) +
  theme(legend.key = element_blank()) +
  theme(legend.title = element_text(size = 18)) +
  theme(legend.text = element_text(size = 10)) +
  theme(panel.background = element_rect(fill = "#596673")) +
  theme(panel.grid = element_blank())

# Generate plot
ggplot() +
  geom_polygon(data = map_world, aes(x = long, y = lat, group = group), fill = "#DEDEDE",colour = "#818181", size = .15) +
  geom_point(data = df, aes(x = lon, y = lat, size = einwohnerzahl), color = "red", alpha = .3) +
  geom_point(data = df, aes(x = lon, y = lat, size = einwohnerzahl), color = "red", shape = 1) +
  coord_cartesian(xlim = c(-110,45), ylim = c(-45,70)) +
  labs(title = "Spanisch-sprachige Orte", subtitle = "Ausgewählte Orte auf der Welt") +
  scale_size_continuous(range = c(.7,15), breaks = c(1100000, 4000000, 8000000, 12000000), name = "Population", labels = scales::comma_format()) +
  map_theme

# Filter for cities in Europe vs Latin America
loc_amerika <- filter(df, kontinent == "Lateinamerika")
loc_europa <- filter(df, kontinent == "Europa")


# Alternative plot
ggplot() +
  geom_polygon(data = map_world, aes(x=long, y = lat, group = group), fill="grey", alpha=0.3) +
  geom_point(data = loc_europa, aes(x=lon, y=lat, size = einwohnerzahl / 1000), alpha = 0.7) +
  geom_text(data = loc_europa, aes(lon, lat, label = ort), position = position_nudge(y = -0.6)) +
  coord_cartesian(xlim = c(-10,+10), ylim = c(35,50)) +
  ggtitle("Spanischsprachige Orte in Europa") +
  theme(
    legend.position = c(0.85, 0.8),
    text = element_text(color = "#22211d"),
    plot.background = element_rect(fill = "#f5f5f2", color = NA), 
    panel.background = element_rect(fill = "#f5f5f2", color = NA), 
    legend.background = element_rect(fill = "#f5f5f2", color = NA),
    plot.title = element_text(size= 16, hjust=0.1, color = "#4e4d47", margin = margin(b = 0.2, t = 0.1, l = 2, unit = "cm")),
  ) +
  labs(size="Einwohnerzahl")

ggplot() +
  geom_polygon(data = map_world, aes(x=long, y = lat, group = group), fill="grey", alpha=0.3) +
  geom_point(data = loc_amerika, aes(x=lon, y=lat, size=einwohnerzahl / 1000), alpha = 0.7) +
  geom_text(data = loc_amerika, aes(lon, lat, label = ort), position = position_nudge(y = -2.5)) +
  coord_cartesian(xlim = c(-105,-10), ylim = c(-45,40)) +
  ggtitle("Spanischsprachige Orte in Lateinamerika") +
  theme(
    legend.position = c(0.85, 0.8),
    text = element_text(color = "#22211d"),
    plot.background = element_rect(fill = "#f5f5f2", color = NA), 
    panel.background = element_rect(fill = "#f5f5f2", color = NA), 
    legend.background = element_rect(fill = "#f5f5f2", color = NA),
    plot.title = element_text(size= 16, hjust=0.1, color = "#4e4d47", margin = margin(b = 0.2, t = 0.1, l = 2, unit = "cm")),
  ) +
  labs(size="Einwohnerzahl")




