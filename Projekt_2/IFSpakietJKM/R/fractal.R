#' Fractal as a set of points
#'
#' Function returns a matrix, where each column is a point on a plane. The matrix represents a fractal of a given density d.
#'
#' @param f list of functions.
#' @param d integer, gives the density of a fractal.
#'
#' @import stats
#'
#' @export

fractal <- function(f,d){
  p <- runif(2)
  A <- NULL
  A <- cbind(A,p)
  for (k in 1:d){
    A <- iterate(f,A)
  }
  return(A)
}
