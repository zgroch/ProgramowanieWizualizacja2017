#' Plotting a fractal
#'
#' Function plots a fractal from an object of class "IFS" with a given density d.
#'
#' @param x object of class "IFS".
#' @param d integer. Determines the density to which plot a fractal.
#' @param pch specifies symbols to use when plotting points (see ? plot).
#' @param ... other parameters of a "plot" function.
#'
#'@import graphics
#'
#' @export

plot.IFS <- function(x, d=8, pch=".", ...){
  A <- fractal(x,d)
  plot(A[1,], A[2,], pch=pch, xlab="", ylab="", axes=FALSE, ...)
}
