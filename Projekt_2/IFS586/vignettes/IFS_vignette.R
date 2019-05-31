## ----setup, include = FALSE----------------------------------------------
knitr::opts_chunk$set(
  collapse = TRUE,
  comment = "#>"
) 

## ---- include=FALSE------------------------------------------------------
library(IFS586)

## ------------------------------------------------------------------------


trian1 <- function(x,y) {
  x<-0.5*x - 0.5
  y<-0.5*y + 0.5
  return(c(x,y))
}

trian2 <- function(x,y) {
  x<-0.5*x - 0.5
  y<-0.5*y - 0.5
  return(c(x,y))
}

trian3 <- function(x,y) {
  x<-0.5*x + 0.5
  y<-0.5*y - 0.5
  return(c(x,y))
}

trianp <- c(0.3333, 0.3333, 0.3334)
sierpinski_triangle <- createIFS(trian1, trian2, trian3, prob_vec=trianp)

## ----sierpisnki, fig.height=4.75, fig.width=5.75-------------------------
plot(sierpinski_triangle, n=15)


## ----sierpinski_nl, fig.height=4.75, fig.width=5.75----------------------
plot(sierpinski_triangle_nonlinear, n=15)

## ----dragon, fig.height=4.75, fig.width=5.75-----------------------------
plot(dragon, n=18)


## ----fem, fig.height=4.75, fig.width=5.75--------------------------------
plot(fem, n=18)


## ----pentagon, fig.height=4.75, fig.width=5.75---------------------------
plot(pentagon, n = 15)

## ----christmas_tree, fig.height=4.75, fig.width=5.75---------------------
plot(christmas_tree, n = 15)

