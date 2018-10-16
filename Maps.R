
library("ggplot")
library("ggmap")

#STEPB3
#once ggmap is installed, can get the map of the USA
us <- map_data("state")
#ggplot expects state names to be lowercase so function tolower will make everything lower case letters credit: "An Introduction to Data Science" pg 160
USArrestsDF$stateName <- tolower(USArrestsDF$stateName)
#named map mapcolor
mapcolor <- ggplot(USArrestsDF, aes(map_id = USArrestsDF$stateName))
#fill it with state area
mapcolor <- mapcolor + geom_map(map= us, fill= USArrestsDF$state.area)
#make limits the x and y coordinates (longitude and latitude)
mapcolor <- mapcolor + expand_limits(x= USArrestsDF$x, y= USArrestsDF$y)
#named the map Area of States
mapcolor <- mapcolor + coord_map() + ggtitle ("Area of States")
