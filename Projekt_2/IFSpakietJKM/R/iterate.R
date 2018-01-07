#' Iterating a list of functions
#'
#' Function creates a matrix, where each column is an image of a point from a given set (represented as a matrix) under a function from the given list of functions.
#'
#' @param f the list of functions
#' @param A the matrix, where each column is an iterated point.
#'
#' @export

iterate <- function(f,A){
  B <- NULL
  for (i in 1:length(f)){
    for (k in 1:ncol(A)){
      B <- cbind(B,f[[i]](A[,k]))
    }
  }
  return(B)
}
