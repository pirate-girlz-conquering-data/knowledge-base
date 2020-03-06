# Import libraries
library(ggmap)

# Register Google API Key
# Add key to Adding key to ~/.Renviron
# register_google(key = "[API KEY]", write = TRUE)

# Import dataset 
setwd("./")
df <- read.csv("./data/locations.csv")

# Get Latitude and Longitude data for cities in df
geo_data <- geocode(as.character(df$ort))

# Add join data to data frame
df <- cbind(df, geo_data)

# Save to CSV file
write.csv(df, "./data/geo_locations.csv", row.names = FALSE)
