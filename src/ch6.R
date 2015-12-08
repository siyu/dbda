source('DBDA2E-utilities.R')
source('BernBeta.R')

# Exercise 6.1 (A)
a = 4
b = 4
prior = c(a,b)
N = 1
z = 1
data = 1
openGraph(width=5, height=7)
posterior = BernBeta(priorBetaAB=prior, Data=data, plotType="Bars", showCentTend="Mode", showHDI=TRUE, showpD=FALSE)

# Exercise 6.1 (B)
posterior = BernBeta(priorBetaAB=posterior, Data=data, plotType="Bars", showCentTend="Mode", showHDI=TRUE, showpD=FALSE)

# Exercise 6.1 (C)
data = 0
posterior = BernBeta(priorBetaAB=posterior, Data=data, plotType="Bars", showCentTend="Mode", showHDI=TRUE, showpD=FALSE)

# Exercise 6.1 (D): same, so order does not matter here
a = 4
b = 4
prior = c(a,b)
N = 1
z = 0
data = 0
openGraph(width=5, height=7)
posterior = BernBeta(priorBetaAB=prior, Data=data, plotType="Bars", showCentTend="Mode", showHDI=TRUE, showpD=FALSE)
data = 1
posterior = BernBeta(priorBetaAB=posterior, Data=data, plotType="Bars", showCentTend="Mode", showHDI=TRUE, showpD=FALSE)
posterior = BernBeta(priorBetaAB=posterior, Data=data, plotType="Bars", showCentTend="Mode", showHDI=TRUE, showpD=FALSE)


# Exercise 6.2 (A)
openGraph()
post = BernBeta(priorBetaAB = c(1,1), Data=c(rep(1,58), rep(0,100-58)), showHDI = TRUE, showCentTend = "Mode")

# Exercise 6.2 (B)
post = BernBeta(priorBetaAB = post, Data=c(rep(1,57), rep(0,100-57)), showHDI = TRUE, showCentTend = "Mode")


# Exercise 6.3
# Radio
openGraph()
prior = c(1,1)
post = BernBeta(priorBetaAB = prior, Data=c(rep(1,40), rep(0,10)), showHDI = TRUE, showCentTend = "Mode")
# Ocean + Mountain
openGraph()
prior = c(1,1)
post = BernBeta(priorBetaAB = prior, Data=c(rep(1,15), rep(0,35)), showHDI = TRUE, showCentTend = "Mode")


# Exercise 6.4
openGraph()
prior = c(0.1, 0.1)
data = c(rep(1,4), rep(0,1))
post = BernBeta(priorBetaAB = prior, Data=data, showHDI = TRUE, showCentTend = "Mode")


# Exercise 6.5 (A)
openGraph()
prior = c(1,1) * 500 # strong belief
data = c(rep(1,9), rep(0,1))
post = BernBeta(priorBetaAB = prior, Data=data, showHDI = TRUE, showCentTend = "Mode")

# Exercise 6.5 (B)
openGraph()
prior = c(0.1,0.1) 
data = c(rep(1,9), rep(0,1))
post = BernBeta(priorBetaAB = prior, Data=data, showHDI = TRUE, showCentTend = "Mode")