library(tidyverse)
library(dplyr)

setwd("/Users/naoki_atkins/Documents/Code/Classwork/dataScience/hw7")
load("myvec.RData")

acf(myvec, lag.max = 100)


my_ts <- ts(myvec, frequency = 50)
decomp <- decompose(my_ts)

plot(decomp)


# Question 3a.

dtw <- function (A, B) {
  M <- nrow(A)
  N <- nrow(B)
  Cost <- matrix(0,M,N) # Initialize with zeros
  # compute cost and fill in the matrix
  for (i in 1:M) {
    for (j in 1:N) {
      Cost[i,j] <- as.numeric((A[i,1] - B[j,1])^2 + (A[i,2] - B[j,2])^2) # distance function
    }
  }
  C <- matrix(0,M,N) # Initialize with zeros
  C[1,1] <- Cost[1,1] # Initialize top left cell
  for (i in 2:M) { # Initialize first column
    C[i,1] <- C[i-1,1] + Cost[i,1]
  }
  for (j in 2:N) { # Initialize first row
    C[1,j] <- C[1,j-1] + Cost[1,j]
  }
  
  # Fill in everything besides the first column and first row
  # Evaluate 3 neighbors (above, left-above, left)
  # Pick the smallest
  # Add the smallest value to ...
  # Fill in the matrix with that computed value
  for(i in 2:M) {
    for(j in 2:N) {
      C[i,j] <- min(C[i-1, j], C[i, j-1], C[i-1, j-1]) + Cost[i,j]
    }
  }
  return (C[M,N])
}


# Question 3b.
A.x <- c(2, 0, 2, 4, 5)
A.y <- c(2, 4, 6, 5, 2)

A <- matrix(data = c(A.x, A.y), nrow = 5)

B.x <- c(1, 0, 4, 5)
B.y <- c(1, 6, 4, 1)

B <- matrix(data = c(B.x, B.y), nrow = 4)

dtw(A, B)

# Question 4

tsX <- read_csv("tsX.csv")
ts2 <- read_csv("ts2.csv")
ts3 <- read_csv("ts3.csv")
ts4 <- read_csv("ts4.csv")
ts5 <- read_csv("ts5.csv")

# 44116.78
dtw(tsX, ts2)
# 18583.75
dtw(tsX, ts3)
# 13293.01
dtw(tsX, ts4)
# 3192.354
dtw(tsX, ts5)



tsX %>%
  ggplot(aes(tsX$x, tsX$y)) + 
  geom_path()

ts2 %>%
  ggplot(aes(ts2$x, ts2$y)) + 
  geom_path()

ts3 %>%
  ggplot(aes(ts3$x, ts3$y)) + 
  geom_path()

ts4 %>%
  ggplot(aes(ts4$x, ts4$y)) + 
  geom_path()

ts5 %>%
  ggplot(aes(ts5$x, ts5$y)) + 
  geom_path()








