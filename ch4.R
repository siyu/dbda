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
