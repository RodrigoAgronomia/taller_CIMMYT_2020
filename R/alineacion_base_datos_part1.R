# load the functions from these two packages:
library(tidyr)
library(dplyr)


# Read the crop data from the csv file:
crop_data = read.csv('data/Maize_Cordoba_Crop.csv') 

# Print the data:
print(crop_data)

# Nicer print:
crop_data = tibble(crop_data)
print(crop_data)

# Tranposed version (see all collumns):
glimpse(crop_data)


# Ayuda da funcion filter:
?filter
?dplyr::filter

# Filter based on condition:
filter(crop_data, Yield > 8)

# Filter based on two conditions:
filter(crop_data, Yield > 8, Sowing_Method == 'Mecanizado')
filter(crop_data, Yield > 8 & Sowing_Method == 'Mecanizado')

# Sort the data based on a column:
arrange(crop_data, Yield)
arrange(crop_data, desc(Yield))
arrange(crop_data, Sowing_Method, desc(Yield))


# Ayuda da funcion select:
?select

# Select only the columns:
select(crop_data, Cultivar, Yield)

# Select the range of columns:
select(crop_data, Cultivar:Yield)

# Select except the columns:
select(crop_data, -Former_Crop)

# Reorder the columns:
select(crop_data, Soil_ID, Former_Crop, everything())

# Reorder and rename the columns:
select(crop_data, Soil_ID, Cultivo_Anterior = Former_Crop, everything())

# Rename the columns:
rename(crop_data, Cultivo_Anterior = Former_Crop)


# Create a new column with a constant value:
mutate(crop_data, Dataset = 'Test')

# Create a new column as a function of a existing one:
mutate(crop_data, Yieldkg = Yield * 1000)

# Create a new column as a summary of a existing one:
mutate(crop_data, YieldAvg = mean(Yield))

# Create a summary using a function:
summarise(crop_data, Yield = mean(Yield))

# Create a summary using a function:
summarise(crop_data, Yield_avg = mean(Yield),
          Yield_sd = sd(Yield),
          Yield_max = max(Yield),
          Yield_min = min(Yield)
          )

# Show the Cultivars used and the frequency:
table(crop_data$Cultivar)

# Create a grouped dataset:
crop_data_grouped = group_by(crop_data, Cultivar)

# Create a summary using a function:
summarise(crop_data_grouped, Yield = mean(Yield))

# Create a new column as a summary of a existing one:
mutate(crop_data_grouped, YieldAvg = mean(Yield))

# Create a new column as a function of a existing one:
mutate(crop_data_grouped, YieldAvg = Yield - mean(Yield))

