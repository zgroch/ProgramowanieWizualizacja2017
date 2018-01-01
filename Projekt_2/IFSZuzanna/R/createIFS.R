#' CreateIFS is creating object which represents fractal to draw
#'
#' Function CreateIFS takes list of functions and creates fractal object
#' which can be later drawed with `plot` function
#'
#' @param func_list list of functions to use
#' @return fractal object
#' @examples
#' func_list <- list(f1,f2)
#' createIFS(func_list)
#' @export
createIFS <- function(func_list) {
  if (!is.list(func_list) && !is.vector(func_list)) {
    stop("func_list is not a list or vector")
  }

  if (length(func_list) == 0) {
    stop("Cannot pass empty list")
  }

  for (f in func_list) {
    if (!is.function(f)) {
      stop("Not function passed")
    }
    func_output <- f(c(0, 0))
    if (!is.vector(func_output) || length(func_output) != 2) {
      stop("Function not returning vector")
    }
    if (!is.numeric(func_output[0]) || !is.numeric(func_output[1])) {
      stop("Function not returning numeric data")
    }
  }

  fractal <- new("IFS", func_list)
}
