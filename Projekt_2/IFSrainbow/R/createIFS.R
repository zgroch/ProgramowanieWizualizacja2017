#' Create a fractal
#'
#' \code{createIFS} returns an IFS fractal defined by the given functions
#'
#' IFS fractal is an invariant set of the \emph{Hutchinson operator},
#' which is the sum of all finite compositions of given functions.
#' See \url{https://en.wikipedia.org/wiki/Iterated_function_system}
#' for details.
#'
#' @param ... functions or a list of functions
#'
#' @return The output is an S3 object of class `IFS'. Basically it is
#' just a list of provided functions (or the provided list of funtions),
#' but some
#' additional methods like \code{\link{plot.IFS}} are defined for it.
#'
#' @examples
#' f1 <- function(p) c(p,1) %*% matrix( c(.5, .5, -1, -.5, .5, 0), 3, 2)
#' f2 <- function(p) c(p,1) %*% matrix( c(-.5, .5, 0, -.5, -.5, 1), 3, 2)
#' my_heighway_1 <- createIFS( f1, f2 )
#' my_heighway_2 <- createIFS( list(f1, f2) )
#'
#' identical(my_heighway_1, my_heighway_2)
createIFS <- function(...){
    ifs <- list(...)
    if( class(ifs[[1]])=="list" ) ifs <- ifs[[1]]
    n <- length(ifs)
    names(ifs) <- paste0("f", 1:n)
    class(ifs) <- "IFS"
    return( ifs )
}
