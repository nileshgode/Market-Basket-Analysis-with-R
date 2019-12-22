# Importing the data set from arules Library
#install.packages('arules')
library(arules)
data("Groceries")
Groceries
dim(Groceries)

#install.packages("arulesViz")
library(arulesViz)
arulesViz::plotly_arules(Groceries)
arulesViz::inspectDT(Groceries)

#install.packages("dplyr")
library(dplyr)
cbind(retail,TransTime)
glimpse(Groceries)
image(Groceries[1:10])
summary(Groceries)
itemFrequency(Groceries[,,1:3])

# install color package of R
# install.packages("RColorBrewer")
library(RColorBrewer)
itemFrequencyPlot(Groceries,support=0.1,col=rainbow(7), main="Absolute Item Frequency Plot")

# Explore some other commands from "arulesViz" Library
itemInfo(Groceries)
itemIntersect(Groceries)
itemUnion(detergent,perfumery)
itemInfo(Groceries)

# Item Frequency plot 
itemFrequencyPlot(Groceries,topN=20,col=rainbow(7), main="Absolute Item Frequency Plot")
itemFrequencyPlot(Groceries,top_n=20,col=rainbow(7), main="Whole Absolute Item Frequency Plot")
itemFrequencyPlot(Groceries,support=0.1,col=rainbow(7), main="Absolute Item Frequency Plot")
apriori(Groceries)
groceryrules <- apriori(Groceries,parameter = list(support =0.006, confidence = 0.25, minlen=2))

groceryrules1 <- apriori(Groceries,parameter = list(support =0.005, confidence = 0.35, minlen=2))


groceryrules1 <- apriori(Groceries,parameter = list(support =0.05, confidence = 0.35, minlen=10))


inspect(groceryrules[1:10])


# Parameter Specification , Total number of rules, Distribution of rule length
# Summary of Quality measures: Min and max values for Support, Confidence and, Lift.
# Information used for creating rules: The data, support, and confidence we provided to the algorithm.
summary(groceryrules)


# Filter rules with confidence greater than 0.2 or 25%
# The above plot shows that rules with high lift have low support
plot(groceryrules)

# Filter rules with confidence greater than 0.35 or 35%
# The above plot shows that rules with high lift have low support
plot(groceryrules1)

# The two-key plot uses support and confidence on x and y-axis respectively
plot(groceryrules,method="two-key plot")


# select 10 rules from subRules having the highest confidence
plot(groceryrules, method = "graph",  engine = "htmlwidget")


# select 20 rules from subRules having the highest confidence
# This representation is also called as Parallel Coordinates Plot
subRules2<-head(groceryrules, n=20, by="lift")
plot(subRules2, method="paracoord")


# Making a report for Indusry purpose
write( groceryrules, file = 'groceryrules.csv',
      sep ="," , quote = TRUE , row.names=FALSE)

groceryrules_df <- as(groceryrules,"data.frame")

str(groceryrules_df)

# have learned all about Association Rule Mining, its applications, and its applications in 
# retailing called as Market Basket Analysis. You are also now capable of implementing Market 
# Basket Analysis in R and presenting your association rules with some great plots 
