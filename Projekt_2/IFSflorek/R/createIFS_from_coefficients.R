#' Creates class "IFS" from a matrix of coefficients.
#'
#' @param params matrix of parameters for contraction mappings
#'
#' @return An object of class \code{IFS} with a list of functions.
#'
#' @export


createIFS_from_coefficients <- function(params) {
  functions <- ""
  if (nrow(params) > 1) {
    for (row in 1:(nrow(params)-1)) {
      string_with_params <- paste(params[row,], collapse = ", ")
      functions <- paste(functions, "function(x) {transformation(x,", string_with_params, ")},", sep="")
    }
  }
  string_with_params <- paste(params[nrow(params),], collapse = ", ")
  functions <- paste(functions, "function(x) {transformation(x, ", string_with_params, ")}", sep="")
  eval(parse(text = paste("createIFS(", functions, ")", sep="")))
}

