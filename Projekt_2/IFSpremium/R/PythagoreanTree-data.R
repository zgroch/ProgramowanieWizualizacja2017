#' Pythagorean tree fractal.
#'
#' List of contractions for Pythagorean tree.
#' Note: to get desired result use square as starting points.
#'
#' @docType data
#' @keywords datasets
#' @name PythagoreanTree
#' @format An object of class \code{'list'} of length 3.
#' @examples
#' points <- seq(0, 1, 1/10)
#' square <- list()
#' for (i in seq_along(1:11))
#'   for (j in seq_along(1:11))
#'     square <- append(square, list(c(points[i], points[j])))
#' plot(createIFS(PythagoreanTree), 5, square)

"PythagoreanTree"
