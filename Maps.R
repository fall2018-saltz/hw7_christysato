
library("ggmap")

#STEPB3
#once ggmap is installed, can get the map of the USA
us <- map_data("state")
#ggplot expects state names to be lowercase so function tolower will make everything lower case letters credit: "An Introduction to Data Science" pg 160
USArrestsDF$stateName <- tolower(USArrestsDF$stateName)
