## ----setup, include=FALSE------------------------------------------------
knitr::opts_chunk$set(echo = TRUE,
                      collapse = TRUE,
                      comment = "#>")

## ----loading package, echo=FALSE, warning=FALSE, message=FALSE-----------
library(IFSpakietJKM)

## ----list of contractions------------------------------------------------
sierpinski_1 <- function(x){
  c(x[1]/2,x[2]/2)
}

sierpinski_2 <- function(x){
  c(x[1]/2+0.5, x[2]/2)
}

sierpinski_3 <- function(x){
  c(x[1]/2+0.25, x[2]/2+0.4330127)
}

sierpinski_list <- list(sierpinski_1,sierpinski_2,sierpinski_3)

## ----IFS-----------------------------------------------------------------
library(IFSpakietJKM)
sierpinski_triangle <- createIFS(sierpinski_list)


## ----draw----------------------------------------------------------------
plot(sierpinski_triangle)

## ----smok----------------------------------------------------------------
plot(createIFS(dragon), d=13)

## ------------------------------------------------------------------------
barnsley <- createIFS(fern)
plot(barnsley, d=6, col="green", pch=20)

## ----trojkat-------------------------------------------------------------
plot(createIFS(triangle), col=cool_colours(3,8))

## ----blue----------------------------------------------------------------
blue <- cool_colours(3,8, start=1/2, end=5/7)
plot(createIFS(triangle), col=blue)

