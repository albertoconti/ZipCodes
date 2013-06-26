library(maps)
library(maptools)
library(zipcode)
#load the zipcode dataset
data(zipcode)
names(zipcode)
lat <- zipcode$latitude
lon <- zipcode$longitude
longitudeLimits <- c(-130, -63)
latitudeLimits <- c(23, 55)
ggplot(zipcode, aes(lon,lat)) + geom_point() + xlim(longitudeLimits) + ylim(latitudeLimits)


# Create Nice Looking PNG
png(filename="pointsmap.png", type="quartz", bg="white", width=10.*960, height=10.*960, pointsize=1)
map("state", col="#000000", fill=TRUE, bg="#FFFFFF", lwd=1.0, xlim=longitudeLimits, ylim=latitudeLimits)
points(lon,lat, col="#FA9C58", pch=19, cex=0.01)
map("state", col="white", lwd=1.0, xlim=longitudeLimits, ylim=latitudeLimits, add=TRUE)
dev.off()
