#Sierpinski triangle
sierpinski_triangle_f1 <- function(point) {
  x<- point[1]
  y<- point[2]
  c(0.5 * x, 0.5 * y)
}

sierpinski_triangle_f2 <- function(point) {
  x<- point[1]
  y<- point[2]
  c(0.5 * x +0.5, 0.5 * y)
}

sierpinski_triangle_f3 <- function(point) {
  x<- point[1]
  y<- point[2]
  c(0.5 * x + 0.25, 0.5 * y + sqrt(3)/4)
}

#' Sierpinski triangle fractal
#'
#' Specification of Sierpinski triangle fractal with can be plotted using plot function.
#' \href{https://en.wikipedia.org/wiki/Sierpinski_triangle}{Wikipedia}
#' @docType data
#' @keywords datasets
#' @name sierpinskiTriangle
#'
NULL

sierpinskiTriangle <- createIFS(list(sierpinski_triangle_f1, sierpinski_triangle_f2, sierpinski_triangle_f3))
