

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

#STEPA2
#copied USArrests into local variable called arrests
arrests <- USArrests
arrests <- data.frame(USArrests)
#created a new column for state names
arrests$stateName <- row.names(arrests)
arrests


#STEPA3
#merge the two datasets with matching stateName column
USArrestsdf <- merge(dfStates, arrests, by="stateName")

head(USArrestsdf)

library("ggplot2")

DF <- data.frame(state.name, )

