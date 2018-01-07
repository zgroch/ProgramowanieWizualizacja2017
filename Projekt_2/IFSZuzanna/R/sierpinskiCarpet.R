sierpinski_carpet_f1 <- function(point) {
  x<- point[1]
  y<- point[2]
  c(1/3 * x, 1/3 * y)
}

sierpinski_carpet_f2 <- function(point) {
  x<- point[1]
  y<- point[2]
  c(1/3 * x, 1/3 * y + 1/3)
}

sierpinski_carpet_f3 <- function(point) {
  x<- point[1]
  y<- point[2]
  c(1/3 * x, 1/3 * y + 2/3)
}

sierpinski_carpet_f4 <- function(point) {
  x<- point[1]
  y<- point[2]
  c(1/3 * x + 1/3, 1/3 * y)
}

sierpinski_carpet_f5 <- function(point) {
  x<- point[1]
  y<- point[2]
  c(1/3 * x + 1/3, 1/3 * y + 2/3)
}

sierpinski_carpet_f6 <- function(point) {
  x<- point[1]
  y<- point[2]
  c(1/3 * x + 2/3, 1/3 * y)
}

sierpinski_carpet_f7 <- function(point) {
  x<- point[1]
  y<- point[2]
  c(1/3 * x + 2/3, 1/3 * y + 1/3)
}
sierpinski_carpet_f8 <- function(point) {
  x<- point[1]
  y<- point[2]
  c(1/3 * x + 2/3, 1/3 * y + 2/3)
}

#' Sierpinski carpet fractal
#'
#' Specification of sierpinski carpet fractal which can be plotted using plot function.
#' \href{https://en.wikipedia.org/wiki/Sierpinski_carpet}{Wikipedia}
#'
#' @docType data
#' @keywords datasets
#' @name sierpinskiCarpet
#'
NULL

sierpinskiCarpet <- createIFS(list(sierpinski_carpet_f1, sierpinski_carpet_f2, sierpinski_carpet_f3, sierpinski_carpet_f4, sierpinski_carpet_f5, sierpinski_carpet_f6, sierpinski_carpet_f7, sierpinski_carpet_f8))