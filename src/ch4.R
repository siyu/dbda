# Exercise 4.1. [Purpose: To gain experience with the apply function in R, while
#               dealing with a concrete example of computing conditional probabilities.]
# The eye-color hair-color data from Table 4.1 are built into R as the array named
# HairEyeColor. The array is frequencies of eye and hair color for males and females.
# Run the following code in R:

# In your write-up, include each line above and its results. Explain what each line does
# (in a bit more detail than the inline comments). Extend the above commands by also
# computing the probabilities of the hair colors given Brown eyes, and the probabilities of
# the eye colors given Brown hair.

show( HairEyeColor ) # Show data
EyeHairFreq = apply( HairEyeColor, c("Eye","Hair"), sum ) # Sum across sex
EyeHairProp = EyeHairFreq / sum( EyeHairFreq ) # joint proportions, Table 4.1
show( round( EyeHairProp , 2 ) )
HairFreq = apply( HairEyeColor , c("Hair") , sum ) # Sum across sex and eye
HairProp = HairFreq / sum( HairFreq ) # marginal proportions, Table 4.1
show( round( HairProp , 2 ) )
EyeFreq = apply( HairEyeColor , c("Eye") , sum ) # Sum across sex and eye
EyeProp = EyeFreq / sum( EyeFreq ) # marginal proportions, Table 4.1
show( round( EyeProp , 2 ) )
EyeHairProp["Blue",] / EyeProp["Blue"] # conditional prob, Table 4.2

# solution:
HairFreqGivenBrownEye = EyeHairProp[,'Brown']/sum(EyeHairProp[,'Brown'])
EyeFreqGivenBrownHair = EyeHairProp['Brown',]/sum(EyeHairProp['Brown',])



# Exercise 4.3. [Purpose: To have you work through an example of the logic
#                presented in Section 4.2.1.2.] Determine the exact probability of drawing a 10 from
# a shuffled pinochle deck. (In a pinochle deck, there are 48 cards. There are six values: 9,
#                            10, Jack, Queen, King, Ace. There are two copies of each value in each of the standard
#                            four suits: hearts, diamonds, clubs, spades.)
#
# (A) What is the probability of getting a 10?  8/48
# (B) What is the probability of getting a 10 or Jack?  16/48




# Exercise 4.4
source("DBDA2E-utilities.R")
dx = 0.01             # Specify interval width on x-axis
# Specify comb of points along the x axis:
x = seq( from = 0 , to = 1 , by = dx )
# Compute y values, i.e., probability density at each value of x:
y = 6 * x * (1 - x) 
# Plot the function. "plot" draws the intervals. "lines" draws the bell curve.
openGraph(width=7,height=5)
plot( x , y , type="h" , lwd=1 , cex.axis=1.5
      , xlab="x" , ylab="p(x)" , cex.lab=1.5 ,
      , main="Normal Probability Density" , cex.main=1.5 )
lines( x , y , lwd=3 ,  col="skyblue" )
# Approximate the integral as the sum of width * height for each interval.
area = sum( dx * y )
# Display info in the graph.
text( meanval-sdval , .9*max(y) , bquote( paste(mu ," = " ,.(meanval)) )
      , adj=c(1,.5) , cex=1.5 )
text( meanval-sdval , .75*max(y) , bquote( paste(sigma ," = " ,.(sdval)) )
      , adj=c(1,.5) , cex=1.5 )
text( meanval+sdval , .9*max(y) , bquote( paste(Delta , "x = " ,.(dx)) )
      , adj=c(0,.5) , cex=1.5 )
text( meanval+sdval , .75*max(y) ,
      bquote(
        paste( sum(,x,) , " " , Delta , "x p(x) = " , .(signif(area,3)) )
      ) , adj=c(0,.5) , cex=1.5 )
# Save the plot to an EPS file.
saveGraph( file = "IntegralOfDensity" , type="eps" )


# Exercise 4.5 (A)
source("DBDA2E-utilities.R")
# Graph of normal probability density function, with comb of intervals.
meanval = 0.0               # Specify mean of distribution.
sdval = 0.2                 # Specify standard deviation of distribution.
xlow  = meanval - 1*sdval # Specify low end of x-axis.
xhigh = meanval + 1*sdval # Specify high end of x-axis.
dx = sdval/40               # Specify interval width on x-axis
# Specify comb of points along the x axis:
x = seq( from = xlow , to = xhigh , by = dx )
# Compute y values, i.e., probability density at each value of x:
y = ( 1/(sdval*sqrt(2*pi)) ) * exp( -.5 * ((x-meanval)/sdval)^2 )
# Plot the function. "plot" draws the intervals. "lines" draws the bell curve.
openGraph(width=7,height=5)
plot( x , y , type="h" , lwd=1 , cex.axis=1.5
      , xlab="x" , ylab="p(x)" , cex.lab=1.5 ,
      , main="Normal Probability Density" , cex.main=1.5 )
lines( x , y , lwd=3 ,  col="skyblue" )
# Approximate the integral as the sum of width * height for each interval.
area = sum( dx * y )
# Display info in the graph.
text( meanval-sdval , .9*max(y) , bquote( paste(mu ," = " ,.(meanval)) )
      , adj=c(1,.5) , cex=1.5 )
text( meanval-sdval , .75*max(y) , bquote( paste(sigma ," = " ,.(sdval)) )
      , adj=c(1,.5) , cex=1.5 )
text( meanval+sdval , .9*max(y) , bquote( paste(Delta , "x = " ,.(dx)) )
      , adj=c(0,.5) , cex=1.5 )
text( meanval-sdval , .75*max(y) ,
      bquote(
        paste( sum(,x,) , " " , Delta , "x p(x) = " , .(signif(area,3)) )
      ) , adj=c(0,.5) , cex=1.5 )
# Save the plot to an EPS file.
saveGraph( file = "IntegralOfDensity" , type="eps" )


