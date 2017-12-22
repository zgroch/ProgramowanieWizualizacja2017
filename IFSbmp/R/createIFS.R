#' Function combining functions (contractions) given as parameters into a list of class IFS.
#'
#' @param f First function on a list.
#' @param ... Remaining functions on a list.
#' @return A list of class IFS.
#' @export
#' @examples
#' lin3 <- function(a,b) {function(x,y){c(1/3*x+a/3,1/3*y+b/3)}}
#' createIFS(lin3(0,0),lin3(0,1),lin3(0,2),lin3(1,0),lin3(1,2),lin3(2,0),lin3(2,1),lin3(2,2))
#' @rdname createIFS

### Defining an IFS class object

createIFS <- function(f=NULL, ...) {

  ## Get the list of parameters and its length
  Functions <- list(f, ...)
  Number_Of_Functions <- length(Functions)

  ## Check whether parameters are functions
  for(n in 1:Number_Of_Functions) {
    if(class(Functions[[n]])!="function") {
      stop("All parameters should be functions!")
    }
  }

  ## Append a class to the list
  class(Functions) <- append(class(Functions),"IFS")

  ## Return a list of class IFS
  return(Functions)

}
