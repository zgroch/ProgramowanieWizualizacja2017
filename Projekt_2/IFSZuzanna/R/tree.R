tree_f1 <- function(point) {
  x<- point[1]
  y<- point[2]
  c(0.05 * x - 0.06, 0.4 * y - 0.47)
}
tree_f2<- function(point) {
  x<- point[1]
  y<- point[2]
  c(-0.05 * x - 0.06, -0.4 * y - 0.47)
}
tree_f3<- function(point) {
  x<- point[1]
  y<- point[2]
  c(0.03 * x - 0.14 * y - 0.16, 0.26 * y - 0.01)
}
tree_f4<- function(point) {
  x<- point[1]
  y<- point[2]
  c(-0.03 * x + 0.14 * y - 0.16, -0.26 * y - 0.01)
}
tree_f5<- function(point) {
  x<- point[1]
  y<- point[2]
  c(0.56 * x + 0.44 * y + 0.3, -0.37 * x + 0.51 * y + 0.15)
}
tree_f6<- function(point) {
  x<- point[1]
  y<- point[2]
  c(0.19 * x + 0.07 * y - 0.2, -0.1 * x + 0.15 * y + 0.28)
}
tree_f7<- function(point) {
  x<- point[1]
  y<- point[2]
  c(-0.33 * x - 0.34 * y - 0.54, -0.33 * x + 0.34 * y + 0.39)
}
#' tree fractal
#'
#' Specification of tree fractal which can be plotted using plot function.
#' \href{https://en.wikipedia.org/wiki/Koch_snowflake}{Wikipedia}
#'
#' @docType data
#' @keywords datasets
#' @name tree
#'
NULL

tree <- createIFS(list(tree_f1, tree_f2, tree_f3, tree_f4, tree_f5, tree_f6, tree_f7))

