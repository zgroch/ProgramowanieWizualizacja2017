#' Create IFS object
#' 
#' Function creates an object of IFS class from a list of functions.
#' 
#' @param f the list of maps (contractions) of a plane.
#' 
#' @export

createIFS <- function(f){
  check_if_f(f)
  class(f) <- "IFS"
  return(f)
}