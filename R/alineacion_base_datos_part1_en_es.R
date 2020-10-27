# load the functions from these two packages:
# Cargar las funciones de los siguientes paquetes:
library(tidyr)
library(dplyr)


# Read the crop data from the csv file:
# Leer la data de cultivo del archivo csv:
crop_data <- read.csv("data/Maize_Cordoba_Crop.csv")

# Print the data:
# Imprima la data
print(crop_data)

# Nicer print:
# Mejor forma de imprimir
crop_data <- tibble(crop_data)
print(crop_data)

# Tranposed version (see all collumns):
# Versión transpuesta (vea todas las columnas)
glimpse(crop_data)


# Help for the function "filter":
# Ayuda para la función "filter":
?filter
?dplyr::filter

# Filter based on one condition:
# Filtrar en base a una condición:
filter(crop_data, Yield > 8)

# Filter based on two conditions:
# Filtrar en base a dos condiciones:
filter(crop_data, Yield > 8, Sowing_Method == "Mecanizado")
filter(crop_data, Yield > 8 & Sowing_Method == "Mecanizado")

# Sort the data based on the values of one column:
# Organizar la data en base a los valores de una columna:
arrange(crop_data, Yield)
arrange(crop_data, desc(Yield))
arrange(crop_data, Sowing_Method, desc(Yield))


# Help for the function "select":
# Ayuda para la función "select":
?select

# Select only the columns:
# Seleccionar solamente las columnas:
select(crop_data, Cultivar, Yield)

# Select the range of columns:
# Seleccionar rango de columnas:
select(crop_data, Cultivar:Yield)

# Select except the columns:
# Obviar columnas:
select(crop_data, -Former_Crop)

# Reorder the columns:
# Reordenar las columnas:
select(crop_data, Soil_ID, Former_Crop, everything())

# Reorder and rename the columns:
# Reordenar y renombrar las columnas:
select(crop_data, Soil_ID, Cultivo_Anterior = Former_Crop, everything())

# Rename the columns:
# Renombrar las columnas:
rename(crop_data, Cultivo_Anterior = Former_Crop)


# Create a new column with a constant value:
# Crear una nueva columna con un valor constante:
mutate(crop_data, Dataset = "Test")

# Create a new column as a function of a existing one:
# Crear una nueva columna resultado de una función de una columna existente:
mutate(crop_data, Yieldkg = Yield * 1000)

# Create a new column as a summary of a existing one:
# Crear una nueva columna con el resumen de otra columna existente:
mutate(crop_data, YieldAvg = mean(Yield))

# Create a summary using a function:
# Crear un resumen usando una función:
summarise(crop_data, Yield = mean(Yield))

# Create a summary using multiple function:
# Crear un resumen usando multiples funciones:
summarise(crop_data,
  Yield_avg = mean(Yield),
  Yield_sd = sd(Yield),
  Yield_max = max(Yield),
  Yield_min = min(Yield)
)

# Show the Cultivars used and the frequency:
# Mostrar las variedades usadas y su frecuencia:
table(crop_data$Cultivar)

# Create a grouped dataset:
# Crear un dataset agrupado:
crop_data_grouped <- group_by(crop_data, Cultivar)

# Create a summary using a function:
# Crear un resumen usando una función:
summarise(crop_data_grouped, Yield = mean(Yield))

# Create a new column as a summary of a existing one:
# Crear una nueva columna como resumen de otra columna existente:
mutate(crop_data_grouped, YieldAvg = mean(Yield))

# Create a new column as a function of a existing one:
# Crear una nueva columna como resultado de otra existente:
mutate(crop_data_grouped, YieldAvg = Yield - mean(Yield))



