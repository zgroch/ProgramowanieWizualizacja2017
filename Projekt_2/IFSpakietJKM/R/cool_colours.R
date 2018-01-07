#' Rainbow-coloured fractals
#'
#' Function cool_colours creates a vector of colours of length n^d to put as
#' a col parameter in plot.IFS
#'
#' @param n number of functions making a fractal
#' @param d density of a fractal
#' @param ... other parameters for rainbow function (see ? rainbow)
#'
#'@import grDevices
#'
#' @export

cool_colours <- function(n,d,...){
  colours <- NULL
  col <- rainbow(n^(d-1),...)
  for (k in 1:n^(d-1)){
    for (i in 1:n){
      colours <- append(colours, col[k])
    }
  }
  return(colours)
}
