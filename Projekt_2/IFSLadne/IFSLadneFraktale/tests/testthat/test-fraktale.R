library(testthat)
library(IFSLadneFraktale)

Smok<- function(vec){
  x<-vec[1]
  y<-vec[2]
  r=runif(1)
  if (r < 0.5){
    x=-0.4*x-1
    y=-0.4*y+0.1
  }
  if (r >= 0.5){
    x=0.76*x-0.4*y
    y=0.4*x+0.76*y
  }
  return(c(x,y))
}

s1<-function(vec){
  x<-vec[1]
  y<-vec[2]
  x<-1/2*x
  y<-1/2*y
  return(c(x,y))
}

s2<-function(vec){
  x<-vec[1]
  y<-vec[2]
  x<-1/2*x+1/2
  y<-1/2*y
  return(c(x,y))
}
s3<-function(vec){
  x<-vec[1]
  y<-vec[2]
  x<-1/2*x+1/4
  y<-1/2*y+3**(1/2)/4
  return(c(x,y))
}

triangle<-createIFS(s1,s2,s3)

test_that("class_of_IFS_object", {
  a<-createIFS(Smok)
  expect_that(class(a), equals("IFS"))
})

test_that("class_of_plot_object", {
  a<-createIFS(Smok)
  b<-plot(a, c(0,0), 100)
  expect_that(class(b), equals("NULL"))
})

test_that("length_of_IFS_object", {
  a<-createIFS(Smok)
  expect_that(length(a), equals(1))
})

test_that("length_of_returned_vector", {
  a<-Smok(c(1,2))
  expect_that(length(a), equals(2))
})

test_that("class_of_a_plot", {
  a<-animate(triangle,9,3,3)
  expect_that(length(class(a)), equals(2))
})
