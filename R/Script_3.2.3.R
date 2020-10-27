# Cargar las funciones de los siguientes paquetes:
library(tidyr)
library(dplyr)


# Leer la data de cultivo del archivo csv:
crop_data <- tibble(read.csv("data/Maize_Cordoba_Crop.csv"))
glimpse(crop_data)

# Leer la data de suelo del archivo csv:
soil_data <- tibble(read.csv("data/Maize_Cordoba_Soil.csv"))
glimpse(soil_data)

# Unir ambos dataset basados en una columna en común "Soil_ID":
all_data <- left_join(crop_data, soil_data, by = "Soil_ID")
glimpse(all_data)

# Filtrar en base a dos condiciones:
soil_data_low_OM <- filter(soil_data, Organic_Matter_Content == "BAJA")

# Unir ambos dataset basados en una columna en común "Soil_ID":
all_data_low_OM <- left_join(crop_data, soil_data_low_OM, by = "Soil_ID")
glimpse(all_data_low_OM)

# Unir ambos dataset y mantener solo datos coincidentes, basados en una columna 
#en común "Soil_ID":
all_data_low_OM <- inner_join(crop_data, soil_data_low_OM, by = "Soil_ID")
glimpse(all_data_low_OM)

# Filtrar el primer dataset basadoes en la columna en común "Soil_ID":
all_data_low_OM <- semi_join(crop_data, soil_data_low_OM, by = "Soil_ID")
glimpse(all_data_low_OM)
