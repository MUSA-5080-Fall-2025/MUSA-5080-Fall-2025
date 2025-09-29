#Load some spatial data 3 different ways & examine differences in file structure

library(sf)
library(tidyverse)
library(ggplot2)
library(tigris)
library(tidycensus)
census_api_key("Your Code Here")
# Read a shapefile
pa_counties <- st_read("data/Pennsylvania_County_Boundaries.shp")

# Read GeoJSON
districts <- st_read("data/districts.geojson")
hospitals <- st_read("data/hospitals.geojson")
#make crs the same (will go over later!)
hospitals <- hospitals %>%
  st_transform(st_crs(pa_counties))


# From a URL
#https://data-pennshare.opendata.arcgis.com/datasets/pennsylvania-state-boundary/explore
#click on "I want to use this (bottom)"

state_bounds <- st_read("https://gis.penndot.pa.gov/gis/rest/services/opendata/stateboundary/MapServer/0/query?outFields=*&where=1%3D1&f=geojson")

#get census tracts (boundaries only) using the tigris package
census_tracts <- tracts(state = "PA", cb = TRUE)
#make crs match I'll review this later!
census_tracts <- census_tracts %>%
  st_transform(st_crs(pa_counties))

# Get urban areas (Census Bureau definition)
# These are areas with 2,500+ people
metro_areas <- core_based_statistical_areas(cb = TRUE)
metro_areas <- metro_areas %>%
  st_transform(st_crs(pa_counties))

#check out the magic of the geometry column.
st_geometry(pa_counties)
# Basic inspection
glimpse(pa_counties)

# Check coordinate reference system
st_crs(pa_counties)

# Get just the geometry
county_shapes <- st_geometry(pa_counties)

# Get just the data (no geometry)
county_data <- st_drop_geometry(pa_counties)

# Simple plot
plot(pa_counties)

# Just the geometry
plot(st_geometry(pa_counties))

# With ggplot2
ggplot(pa_counties) +
  geom_sf() +
  theme_void()

##Spatial Subsetting
# Get counties that intersect with a specific region
allegheny <- pa_counties %>%
  filter(COUNTY_NAM == "ALLEGHENY")

# Find counties that touch Allegheny
neighbors <- pa_counties %>%
  st_filter(allegheny, .predicate = st_touches)

# Map them
ggplot(neighbors) +
  geom_sf() +
  theme_void()

# Counties within 50km of Allegheny centroid
allegheny_center <- st_centroid(allegheny)
nearby <- pa_counties %>%
  st_filter(st_buffer(allegheny_center, dist = 50000))

# Map them
ggplot(nearby) +
  geom_sf() +
  theme_void()

# Find census tracts within Allegheny County
tracts_in_allegheny <- census_tracts %>%
  st_filter(allegheny, .predicate = st_within)

# With ggplot2
ggplot(tracts_in_allegheny) +
  geom_sf() +
  theme_void()


# Find counties that core based statistical areas (any overlap)
ggplot(metro_areas) +
  geom_sf() +
  theme_void()

metro_tracts<- census_tracts %>%
  st_filter(metro_areas, .predicate = st_intersects)

ggplot(metro_tracts) +
  geom_sf() +
  theme_void()

ggplot(rural_tracts) +
  geom_sf() +
  theme_void()

##spatial joins
# Get census tract data
pa_tracts <- tracts(state = "PA", county = "Allegheny", cb = TRUE)

# Join tract data to county boundaries
# Each tract gets county attributes
tracts_with_counties <- census_tracts %>%
  st_join(pa_counties)

# Aggregate tracts up to counties
# Summarize tract data by county
county_summaries <- tracts_with_counties %>%
  st_drop_geometry() %>%
  group_by(COUNTY_NAM) %>%
  summarize(
    n_tracts = n(),
    avg_area = mean(AREA_SQ_MI)
  )

county_summaries 

##Distances
# Distance between county centroids
county_centers <- st_centroid(pa_counties)
ggplot(county_centers)+
  geom_sf()+
  theme_void()

distance_matrix <- st_distance(county_centers)
head(distance_matrix)


# Calculate county areas
pa_counties <- pa_counties %>%
  mutate(
    area_sqkm = as.numeric(st_area(.)) / 1000000  # Convert to sq km
  )

# Population density (need to join census data)
pa_counties <- pa_counties %>%
  left_join(county_population_data, by = "GEOID") %>%
  mutate(
    pop_density = population / area_sqkm
  )

# Distance from each county to a specific point
philadelphia <- pa_counties %>%
  filter(NAME == "Philadelphia")
philly_center <- st_centroid(philadelphia)

pa_counties <- pa_counties %>%
  mutate(
    dist_to_philly = as.numeric(st_distance(
      st_centroid(.), philly_center
    )) / 1000  # Convert to kilometers
  )

# 10km buffer around all hospitals
hospitals_projected <- hospitals %>%
  st_transform(crs = 3365)
st_crs(hospitals_projected)

hospital_buffers <- hospitals_projected %>%
  st_buffer(dist = 32808.4)  # 10,000 meters = 32808.4 feet

ggplot(hospital_buffers)+
  geom_sf()+
  theme_void()

# Different buffer sizes by hospital type (this is hypothetical, we don't have that column!)
hospital_buffers <- hospitals %>%
  mutate(
    buffer_size = case_when(
      type == "Major Medical Center" ~ 15000,
      type == "Community Hospital" ~ 10000,
      type == "Clinic" ~ 5000
    )
  ) %>%
  st_buffer(dist = .$buffer_size)

# Get demographic data for census tracts
pa_tracts_data <- get_acs(
  geography = "tract",
  variables = c(
    median_income = "B19013_001",
    total_pop = "B01003_001",
    over_65 = "B01001_020"  # Population 65 years and over
  ),
  state = "PA",
  year = 2022,
  output = "wide"
)

# Join demographic data to tract boundaries
tracts <- tracts %>%
  left_join(pa_tracts_data, by = "GEOID")

# Identify vulnerable populations (low-income tracts)
low_income_tracts <- tracts %>%
  filter(median_incomeE < 40000)

low_income_tracts  <- low_income_tracts  %>%
  st_transform(crs = 3365)

# Find low-income areas with good healthcare access
healthcare_accessible <- low_income_tracts %>%
  st_intersection(st_union(hospital_buffers))


ggplot(healthcare_accessible)+
  geom_sf()+
  theme_void()

# Calculate what percentage of low-income tracts have access
access_summary <- low_income_tracts %>%
  mutate(
    has_access = st_intersects(., st_union(hospital_buffers), sparse = FALSE)
  ) %>%
  st_drop_geometry() %>%
  summarize(
    total_tracts = n(),
    tracts_with_access = sum(has_access),
    pct_with_access = (tracts_with_access / total_tracts) * 100
  )

print(access_summary)


# st_union Example: Combine all tracts in a county into county boundary
allegheny_boundary<- tracts_in_allegheny %>%
  st_union() 

# Visualize the difference
library(patchwork)

p1 <- ggplot(tracts_in_allegheny) +
  geom_sf(fill = "lightblue", color = "white") +
  labs(title = "Individual Census Tracts") +
  theme_void()

p2 <- ggplot() +
  geom_sf(data = allegheny_boundary, fill = "darkblue") +
  labs(title = "Unioned County Boundary") +
  theme_void()

p1 | p2

districts <- districts %>%
  st_transform(st_crs(tracts))

# Average income by congressional district
tracts_by_district <- tracts %>%
  st_join(districts) %>%
  st_drop_geometry() %>%
  group_by(OBJECTID) %>%
  summarize(
    total_population = sum(total_popE),
    avg_income = weighted.mean(median_incomeE, total_popE),
    n_tracts = n()
  )

# Join back to district boundaries
districts_with_data <- districts %>%
  left_join(tracts_by_district, by = "OBJECTID")

ggplot(districts_with_data) +
  geom_sf(aes(fill = total_population), color = "white") +
  labs(title = "Population by District") +
  theme_void()

#enhanced map!
library(scales)
ggplot(districts_with_data) +
  geom_sf(aes(fill = total_population), color = "white", size = 0.5) +
  scale_fill_viridis_c(
    name = "Population",
    labels = comma,  # Format with commas
    option = "plasma"  # Color scheme
  ) +
  labs(
    title = "Population by District",
    subtitle = "Total population from census tracts",
    caption = "Source: ACS 2018-2022"
  ) +
  theme_void()

areas<- pa_counties %>%
  st_transform(4326) %>%  # Geographic
  mutate(area_geographic = as.numeric(st_area(.))) %>%
  st_transform(5070) %>%  # Albers
  mutate(area_albers = as.numeric(st_area(.))) %>%
  st_drop_geometry() %>%
  select(COUNTY_NAM, area_geographic, area_albers) %>%
  mutate(
    ratio = area_albers / area_geographic,
    difference_pct = (abs(area_albers - area_geographic) / area_albers) * 100
  )
