library(tidyr)
library(dplyr)
library(readr)

dfn = read.csv('data/Dataset_Maize_Cordoba.csv')

svars = c("Soil_Structure", "Runoff", "Soil_Texture", "Organic_Matter_Content")

df_soil = dfn %>% select(all_of(svars)) %>% distinct() %>% 
  mutate(Soil_ID = 1:n()) %>% select(Soil_ID, everything())

dfn = left_join(dfn, df_soil, by = svars)

cvars = c('Planting_Date', 'Harvest_Date', 'Cultivar', 'Former_Crop',
          'Sowing_Method', 'Soil_ID', 'Yield')
df_crop = dfn %>% select(all_of(cvars)) 

write.csv(df_crop, 'data/Maize_Cordoba_Crop.csv', row.names = FALSE)
write.csv(df_soil, 'data/Maize_Cordoba_Soil.csv', row.names = FALSE)

