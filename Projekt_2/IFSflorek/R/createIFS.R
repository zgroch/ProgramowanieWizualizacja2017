#' Creates class "IFS" from list of functions.
#'
#' @param f1 function (contraction) used to create an IFS
#' @param ... possibly more functions (contractions)
#'
#' @return An object of class \code{IFS} with a list of functions.
#'
#' @export

createIFS <- function(f1, ...) {
  structure(list(f1, ...), class = "IFS")
}
