#' Addition of fractals
#'
#' \code{+.IFS} is an overloaded operator that allows to add two fractals
#'
#' Adding two IFS fractals is just a fractal defined by the
#' union of functions defining the summands.
#'
#' @param x S3 objects of class \code{IFS}, as returned by
#' @param y S3 objects of class \code{IFS}, as returned by
#' \code{\link{createIFS}}
#'
#' @examples
#' newfractal <- heighway + koch
#' plot(newfractal, 100, 10)
`+.IFS` <- function(x, y) createIFS( c(x, y) )
