# install.packages("dplyr")
# install.packages("riem")

# install.packages("sf")
# library(sf)
# plot(stations$lon, stations$lat)

library(dplyr)
library(riem)

MX__ASOS = 'https://mesonet.agron.iastate.edu/sites/networks.php?network=MX__ASOS&format=csv&nohtml=on'
stations = read.csv(MX__ASOS)

ASOS = 'https://mesonet.agron.iastate.edu/sites/networks.php?network=_ALL_&format=csv&nohtml=on'
stations = read.csv(ASOS)



url <- "https://bmcnoldy.rsmas.miami.edu/tropics/oni/ONI_NINO34_1854-2020.txt"
df <- read.table(url, skip = 8, header = TRUE, na.strings = "-99.99")
write.csv(df, 'data/NINO34.csv', row.names = FALSE)

print(df)

str(df)

mutate(df, Date = as.Date(paste(YEAR, MON.MMM, 15, sep = "-")))

riem_networks()

filter(riem_networks(), grepl("Mexico", name))

filter(riem_networks(), grepl("Argentina", name))
stations <- riem_stations(network = "AR__ASOS")
stations %>% filter(grepl("Mendoza", name))


station_code = 'SAME'
weather <- riem_measures(station = station_code,
                         date_start = "2000-01-01",
                         date_end = "2020-12-31"
) 

plot(weather$tmpf, pch = '.')



riem_networks() %>% filter(grepl("Mexico", name))
riem_networks() %>% filter(grepl("PN__ASOS", code))

stations <- riem_stations(network = "PN__ASOS")


stations %>% filter(grepl("Obregon", name))

station_code = 'MPMG'
weather <- riem_measures(station = station_code,
                          date_start = "2000-01-01",
                          date_end = "2019-12-31"
                          ) 

station_file = paste0('data/', station_code, '.csv')
write.csv(weather, station_file, row.names = FALSE)


weather = read.csv(station_file)

print(weather)

sum(weather$p01i, na.rm = T)

stations_sf = st_as_sf(stations, coords = c('lon', 'lat'))
write_sf(stations_sf, 'data/stations.gpkg')

url = 'https://mesonet.agron.iastate.edu/cgi-bin/request/daily.py?network=PN__ASOS&stations=MPTO&year1=2010&month1=1&day1=1&year2=2020&month2=1&day2=1'
dff = read.csv(url, na.strings = 'None')

tibble(dff)
sum(dff$precip_in, na.rm = T)
