#Author : Lovenish

#Data Visualization

#*********************************************************************************
#Base Package
#GGPLOT2 Package
#Grid Graphics
#Lattice Graphics

#*********************************************************************************
#Types of Graphs
#Basic Visualization
#Scatter Plot
#Line Chart
#Bar Plot
#Pie Chart
#Histogram
#Density Plot
#Box Plot

#Advanced Visualization
#Mosiac Plot
#Heat Map
#3D Graph
#CorrelationPlot
#Word Cloud
#*********************************************************************************
#Installing the package and data set to be analysed
install.packages("mtcars")
mtcars <- datasets::mtcars
#*********************************************************************************
#Scatter Plot :
#Type : type
#"p" for points,
#"l" for lines,
#"b" for both,
#"c" for the lines part alone of "b",
#"o" for both ‘over plotted’,
#"h" for ‘histogram’ like (or ‘high-density’) vertical lines,
#"s" for stair steps,
#"S" for other steps, see ‘Details’ below,
#"n" for no plotting.

#xlim : Limit of x axis
#ylim : Limit of y axis

#xlab : Label on x axis
#ylab : Label on y axis
#main : Label of complete graph

max_hp <- max(mtcars$hp) # Maximum of hp
max_mpg <- max(mtcars$mpg) #maximum of mpg
plot(mtcars$hp, mtcars$mpg, type = "p",
     xlim = c(0, max_hp),
     ylim = c(0, max_mpg),
     ylab = "Miles Per Galon", xlab = "Hourse Power",
     main = "Hourse Power Vs Mileage"
     )

#*********************************************************************************

    