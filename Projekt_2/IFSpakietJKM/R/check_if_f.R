#' Check if objects are functions mapping a plane
#' 
#' Functions checks if its argument is a list of maps of a plane. Returns error otherwise.
#' 
#' @param f argument to check
#' 
#' @export

check_if_f <- function(f){
  for (i in length(f)){
    stopifnot(class(f[[i]])=="function")
    stopifnot(length(f[[i]](c(1,1)))==2)
  }
}