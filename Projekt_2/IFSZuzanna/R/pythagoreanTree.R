
#Pythagorean Tree
pythagoreanTreef1 <- function(point) {
  x<- point[1]
  y<- point[2]
  c((cos(pi/4))^2 * x - cos(pi/4) * sin(pi/4) * y, cos(pi/4) * sin(pi/4) * x + (cos(pi/4))^2 * y + 1)
}


pythagoreanTreef2 <- function(point) {
  x<- point[1]
  y<- point[2]
  c((sin(pi/4))^2 * x + cos(pi/4) * sin(pi/4) * y + (cos(pi/4))^2 , -cos(pi/4) * sin(pi/4) * x + (sin(pi/4))^2 * y + 1 + cos(pi/4) * sin(pi/4))
}

pythagoreanTreef3 <- function(point) {
  x<- point[1]
  y<- point[2]
  c(x, y)
}

#' pythagoreanTree fractal
#'
#' Specification of pythagorean tree fractal which can be plotted using plot function.
#' \href{https://en.wikipedia.org/wiki/Pythagoras_tree_(fractal)}{Wikipedia}
#' 
#' @docType data
#' @keywords datasets
#' @name pythagoreanTree
#'
NULL
pythagoreanTree <- createIFS(list(pythagoreanTreef1, pythagoreanTreef2, pythagoreanTreef3))
