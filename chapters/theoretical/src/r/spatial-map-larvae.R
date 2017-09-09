library("ggmap")
library("rgdal")
library("sp")
library("oz")
library("ggplot2")

paths <- readOGR(".","larvae-dispersal")
#paths <- spTransform(paths, CRS("+proj=longlat +datum=WGS84"))
paths <- fortify(paths)
centre <- geocode("Brisbane, AU")
#centre <- geocode("-30.2986,153.1094") # coffs harbour
map <- get_map(c(lon=centre$lon, lat=centre$lat), zoom = 5, maptype = "terrain", source = "google")
map <- ggmap(map)
plot1 <- map + geom_point(aes(x=long, y=lat, group=group),size=0.1,color='red', data=paths)
plot1

library(rgdal)
library(ggplot2)
library(sp)
library(maps)
library(mapdata)
library(maptools)  #for shapefiles
library(scales)  #for transparency
#paths <- readShapeLines("larvae_paths.shp")
paths <- readOGR(".","P-NSW02-dispersal") 
library(raster)
s <- shapefile("P-NSW02-dispersal.shp")#layer of data for species range
#reefs <- readOGR(".","ALLpatches")
#samps <- read.csv("FieldSamples.csv")   #my data for sampling sites, contains a column of "lat" and a column of "lon" with GPS points in decimal degrees
#map("world2Hires","Australia", col="gray90", fill=TRUE)  #plot the region of Canada I want
#oz()
#w2hr <- map_data("world2Hires")
#plot(paths, add=TRUE, xlim=c(140,160),ylim=c(-40,-20), col=alpha("darkgreen", 0.6), border=TRUE)  #plot the species range
#usa <- map_data("usa")
oz <- map_data("world2Hires","Australia")
#nsw <- subset(oz, subregion == "Prince of Wales Island")
#points(samps$lon, samps$lat, pch=19, col="red", cex=0.5)  #plot my sample sites
map <- ggplot() + geom_polygon(data = oz, aes(x=long, y = lat, group = group)) + 
  coord_fixed(xlim = c(152.2, 160),  ylim = c(-38.0, -23.0), ratio = 1.3) + geom_path(aes(x=long, y=lat, group=group),size=0.3,color='red', data=paths)
ggsave("map.pdf",plot=map)


