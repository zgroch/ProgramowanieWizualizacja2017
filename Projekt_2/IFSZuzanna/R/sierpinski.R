
sierpinski_f1 <- function(point) {
  x<- point[1]
  y<- point[2]
  c(0.5 * x, 0.5 * y)
}

sierpinski_f2 <- function(point) {
  x<- point[1]
  y<- point[2]
  c(0.5 * x +0.5, 0.5 * y)
}

sierpinski_f3 <- function(point) {
  x<- point[1]
  y<- point[2]
  c(0.5 * x + 0.25, 0.5 * y + sqrt(3)/4)
}

#' sierpinskiTriangle fractal
#'
#' Specification of sierpinskiTriangle fractal with can be plotted using plot function.
#'
#' @docType data
#' @keywords datasets
#' @name sierpinskiTriangle
#'
NULL

sierpinskiTriangle <- createIFS(list(sierpinski_f1, sierpinski_f2, sierpinski_f3))
