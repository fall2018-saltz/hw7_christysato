
#named rawdata dataset as dfStates
dfStates <- rawdata

#STEPA1
#created function to clean the dataframe
MyMode <- function(dfStates)
{
  #removes first row because it is total for US, we do not need
  dfStates <- dfStates[-1,]
  #last row is Puerto Rico and should be removed
  num.row <- nrow(dfStates)
  dfStates <- dfStates[-num.row,]
  #removes first 4 columns
  dfStates <- dfStates[,-1:-4]
  #changes the name of remaining columns
  colnames(dfStates) <- c("stateName", "population", "popOver18","percentOver18")
  return(dfStates)
}
dfStates <- MyMode(dfStates)
#provides clean dataset
str(dfStates)

#copied USArrests into local variable called arrests
arrests <- USArrests
arrests <- data.frame(USArrests)
#created a new column for state names
arrests$stateName <- row.names(arrests)
arrests

#merge the two datasets with matching stateName column
USArrestsdf <- merge(dfStates, arrests, by="stateName")

head(USArrestsdf)

#STEPA2
library("ggplot2")
library("ggmap")

#created a dataframe DF which holds state names, center of each state, and area center
DF <- data.frame(state.name, state.center, stringsAsFactors=False)
DF <- data.frame(state.name, state.center,state.area)
#rename state.name to stateName so I can merge it into one dataframe
colnames(DF)[colnames(DF) == 'state.name'] <- 'stateName'
DF

#merge the two datasets with matching stateName column
USArrestsDF <- merge(USArrestsdf,DF, by="stateName")


