# Cargar las funciones de los siguientes paquetes:
library(tidyr)
library(dplyr)


# Leer la data de cultivo del archivo csv:
crop_data <- tibble(read.csv("data/Maize_Cordoba_Crop.csv"))
glimpse(crop_data)

# Leer la data de suelo del archivo csv:
soil_data <- tibble(read.csv("data/Maize_Cordoba_Soil.csv"))
glimpse(soil_data)

# Join both dataset base on the comomn column "Soil_ID": 
all_data <- left_join(crop_data, soil_data, by = "Soil_ID")
glimpse(all_data)


