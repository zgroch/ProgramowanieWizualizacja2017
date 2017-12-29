#' Linear transformation
#'
#' Transforms two-element vector with a linear function of a form:
#' f(x, y) = (ax + by + e, cx + dy + f)
#'
#' @param x two-element vector to transform
#' @param a,b,c,d,e,f coefficients of the transformation
#'
#' @export

transformation <- function(x, a, b, c, d, e=0, f=0) {
  c(a*x[1] + b*x[2] + e, c*x[1] + d*x[2] + f)
}
