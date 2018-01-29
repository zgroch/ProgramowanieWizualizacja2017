#' IFS S3 constructor
#'
#' This creates a new IFS object that we can plot
#' @param X Vector or list of functions of type function(twoDimVector){ ...; return( c(x1, y1) ); } (which we hope are also contractions on R^2)
#' @return IFS object or NULL if argument doesn't consist of functions or some other error occured
#' @usage This object can then be plotted, see: plot.IFS
#' @export
#' @examples createIFS(IFSkoolnamr::sierpinski)

createIFS <- function(X) {
  if (!is.vector(X) && !is.list(X)) {
    warning("argument is not a list or vector")
    return(NULL)
  }

  if (length(X) == 0) {
    warning("input empty")
    return(NULL)
  }

  options(warn=-1) # why a HIGH-LEVEL language such as R would warn about that
  input_correct <- all(lapply(X, FUN=is.function))
  options(warn=0)
  if (!input_correct) {
    warning("not all arguments are functions")
    return(NULL)
  }

  # check if x consists of CONTRACTIONS
  options(warn=-1) # why a HIGH-LEVEL language such as R would warn about that
  input_correct <- all(lapply(X, FUN=is.contraction))
  options(warn=0)
  if (!input_correct) {
    warning("not all arguments are valid functions")
    return(NULL)
  }

  this <- list(X)
  class(this) <- "IFS"

  return(this)
}

#' @keywords internal

is.contraction <- function(fn) {
  # is function
  if (!is.function(fn)) {
    #warning("is not a function")
    return(FALSE)
  }

  # result is a 2 dimensional numeric vector
  should_be_2_dim_numeric_vector = fn(c(1,1))
  if (!is.vector(should_be_2_dim_numeric_vector)) {
    return(FALSE)
  }
  if (length(should_be_2_dim_numeric_vector) != 2) {
    return(FALSE)
  }
  if (!is.numeric(should_be_2_dim_numeric_vector)) {
    return(FALSE)
  }

  return(TRUE)

}
