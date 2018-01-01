## ---- fig.show='hold', results='hide'------------------------------------
koch_f1 <- function(point) {
  x<- point[1]
  y<- point[2]
  c(1/2 * x - sqrt(3)/6 * y, sqrt(3)/6 * x + 1/2 * y)
}

koch_f2 <- function(point) {
  x<- point[1]
  y<- point[2]
  c(1/3 * x + 1/sqrt(3), 1/3 * y + 1/3)
}

koch_f3 <- function(point) {
  x<- point[1]
  y<- point[2]
  c(1/3 * x, 1/3 * y + 2/3)
}

koch_f4 <- function(point) {
  x<- point[1]
  y<- point[2]
  c(1/3 * x - 1/sqrt(3), 1/3 * y + 1/3)
}

koch_f5 <- function(point) {
  x<- point[1]
  y<- point[2]
  c(1/3 * x - 1/sqrt(3), 1/3 * y - 1/3)
}

koch_f6 <- function(point) {
  x<- point[1]
  y<- point[2]
  c(1/3 * x, 1/3 * y - 2/3)
}

koch_f7 <- function(point) {
  x<- point[1]
  y<- point[2]
  c(1/3 * x + 1/sqrt(3), 1/3 * y - 1/3)
}

## ---- fig.show='hold', results='hide', message = FALSE, warning = FALSE----
library(IFSZuzanna)

kochSnowflake <- createIFS(list(koch_f1, koch_f2, koch_f3, koch_f4, koch_f5, koch_f6, koch_f7))

## ---- fig.show='hold'----------------------------------------------------
plot(kochSnowflake, 3, 'blue')
plot(kochSnowflake, 4, 'red')
plot(kochSnowflake, 5, 'black')
plot(kochSnowflake,6, 'grey')


