# Cargar las funciones de los siguientes paquetes:
library(tidyr)
library(dplyr)


# Leer la data de cultivo del archivo csv:
crop_data <- read.csv("data/Maize_Cordoba_Crop.csv")

# Imprima la data
print(crop_data)

# Mejor forma de imprimir
crop_data <- tibble(crop_data)
print(crop_data)

# Versión transpuesta (vea todas las columnas)
glimpse(crop_data)


# Ayuda para la función "filter":
?filter
?dplyr::filter

# Filtrar en base a una condición:
filter(crop_data, Yield > 8)

# Filtrar en base a dos condiciones:
filter(crop_data, Yield > 8, Sowing_Method == "Mecanizado")
filter(crop_data, Yield > 8 & Sowing_Method == "Mecanizado")

# Organizar la data en base a los valores de una columna:
arrange(crop_data, Yield)
arrange(crop_data, desc(Yield))
arrange(crop_data, Sowing_Method, desc(Yield))


# Ayuda para la función "select":
?select

# Seleccionar solamente las columnas:
select(crop_data, Cultivar, Yield)

# Seleccionar rango de columnas:
select(crop_data, Cultivar:Yield)

# Obviar columnas:
select(crop_data, -Former_Crop)

# Reordenar las columnas:
select(crop_data, Soil_ID, Former_Crop, everything())

# Reordenar y renombrar las columnas:
select(crop_data, Soil_ID, Cultivo_Anterior = Former_Crop, everything())

# Renombrar las columnas:
rename(crop_data, Cultivo_Anterior = Former_Crop)


# Crear una nueva columna con un valor constante:
mutate(crop_data, Dataset = "Test")

# Crear una nueva columna resultado de una función de una columna existente:
mutate(crop_data, Yieldkg = Yield * 1000)

# Crear una nueva columna con el resumen de otra columna existente:
mutate(crop_data, YieldAvg = mean(Yield))

# Crear un resumen usando una función:
summarise(crop_data, Yield = mean(Yield))

# Crear un resumen usando multiples funciones:
summarise(crop_data,
  Yield_avg = mean(Yield),
  Yield_sd = sd(Yield),
  Yield_max = max(Yield),
  Yield_min = min(Yield)
)

# Mostrar las variedades usadas y su frecuencia:
table(crop_data$Cultivar)

# Crear un dataset agrupado:
crop_data_grouped <- group_by(crop_data, Cultivar)

# Crear un resumen usando una función:
summarise(crop_data_grouped, Yield = mean(Yield))

# Crear una nueva columna como resumen de otra columna existente:
mutate(crop_data_grouped, YieldAvg = mean(Yield))

# Crear una nueva columna como resultado de otra existente:
mutate(crop_data_grouped, YieldAvg = Yield - mean(Yield))



