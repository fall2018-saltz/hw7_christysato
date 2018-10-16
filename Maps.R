
library("ggplot2")
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

#STEPC4
#created a map color coded by the murder rate of each state
mapMurder <- ggplot(USArrestsDF, aes(map_id = USArrestsDF$stateName))
#fills state area with color by murder rate
mapMurder <- mapMurder + geom_map(map= us, fill= USArrestsDF$Murder)
#makes limits with the center of each state
mapMurder <- mapMurder + expand_limits(x=USArrestsDF$x, y=USArrestsDF$y)
#names map Murder Rate/State
mapMurder <- mapMurder + coord_map() + ggtitle ("Murder Rate/State")


#STEPC5
#want to show population as a cirlce per state
mapPop <- ggplot(USArrestsDF, aes(map_id=USArrestsDF$stateName))
#use a basic map diagram just white and black
mapPop <- mapPop + geom_map(map=us, fill= USArrestsDF$Murder)
#size of circles will vary depending on population, and the circles are placed in the center of each state
mapPop <- mapPop + geom_point(data=USArrestsDF, aes(size= USArrestsDF$population, x=USArrestsDF$x, y=USArrestsDF$y),shape=1)
#coord_map ensures the map is not distorted and adds title to map
mapPop <- mapPop + coord_map() + ggtitle ("Population/State")
