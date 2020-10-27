# Cargar las funciones de los siguientes paquetes:
library(tidyr)
library(dplyr)


# Leer la data del censo agricola:
data_long <- tibble(read.csv('data/Cierre_agricola_mun_long.csv'))
print(data_long)

# Pivotar a lo ancho
data_censo <- pivot_wider(data = data_long,
                          id_cols = c('Nommunicipio','Nommodalidad'),
                          names_from = 'Variable',
                          values_from = 'value'
)

print(data_censo)

# Crear una nueva columna resultado de una función das columnas existentes:
mutate(data_censo, Producion = Area * Rendimiento)


# Pivotar a lo ancho
data_wide <- pivot_wider(data = data_censo,
                         id_cols = 'Nommunicipio',
                         names_from = 'Nommodalidad',
                         values_from = 'Rendimiento'
)


# Pivotar a lo largo
pivot_longer(data = data_wide,
             cols = c('Riego', 'Temporal'),
             names_to = 'Nommodalidad',
             values_to = 'Rendimiento'
)

