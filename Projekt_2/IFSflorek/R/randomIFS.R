#' Generate random fractal
#'
#' Function generates random coefficients for given number of linear mappings,
#' so that the mappings will be contractive. Then it generates \code{IFS} object
#' using the list of mappings.
#'
#' @param nr_of_functions number of functions to generate. Defaults to 4
#'
#' @references http://paulbourke.net/fractals/ifs/
#'
#' @importFrom stats runif
#'
#' @export

randomIFS <- function(nr_of_functions = 4) {
  matrix_of_coefficients <- matrix(0, ncol = 6, nrow = nr_of_functions)
  for (nr_of_function in 1:nr_of_functions){
    condition <- FALSE
    while (!condition) {
      a <- runif(1, -1, 1)
      limit <- sqrt(1 - a ^ 2)
      c <- runif(1, min = -limit, max = limit)
      b <- runif(1, -1, 1)
      limit <- sqrt(1 - b ^ 2)
      d <- runif(1, min = -limit, max = limit)
      e <- runif(1)
      f <- runif(1)
      condition <- (a^2 +  b^2 + c^2 + d^2 < 1 + (a*d - b*c)^2)
    }
    matrix_of_coefficients[nr_of_function,] <- c(a, b, c, d, e, f)
  }
  createIFS_from_coefficients(matrix_of_coefficients)
}
