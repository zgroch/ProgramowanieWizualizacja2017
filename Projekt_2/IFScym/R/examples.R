#'Sierpinski's triangle
#' @usage Recommended k > 10
#' @export
sierpinski <- c(
  function(p) c(0.5 * p[1], 0.5 * p[2]),

  function(p) c(0.5 * p[1] + 0.5, 0.5 * p[2]),

  function(p) c(0.5 * p[1] + 0.25, 0.5 * p[2] + sqrt(3)/4)
)

#' Koch's snowflake
#' @usage Recommended k > 6
#' @export
koch <- c(
  function(p) c(1/3 * p[1], 1/3 * p[2]),

  function(p) c(1/6 * p[1] + 1/3 - p[2] * sqrt(3)/6, sqrt(3)/6 * p[1] + p[2] * 1/6),

  function(p) c(1/6 * p[1] + 1/2 + p[2] * sqrt(3)/6, -sqrt(3)/6 * p[1] + p[2] * 1/6 + sqrt(3)/6),

  function(p) c(1/3 * p[1] + 2/3, 1/3 * p[2])
)

#' Spiral
#' @usage Recommended k > 10
#' @export
spiral <- c(
  function(p) c(0.787879*p[1] - 0.424242*p[2] + 1.758647, 0.242424*p[1] + 0.859848*p[2] + 1.408065),
  function(p) c(-0.121212*p[1] + 0.257576*p[2] - 6.721654, 0.151515*p[1] + 0.053030*p[2] + 1.377236),
  function(p) c(0.181818*p[1] - 0.136364*p[2] + 6.086107, 0.090909*p[1] + 0.181818*p[2] + 1.568035)
)

#' Tree
#' @usage Recommended 9 > k > 6
#' @export
tree <- c(
  function(p) c(0.05*p[1] + 0.0*p[2] - 0.06, 0.0*p[1] + 0.4*p[2] - 0.47),
  function(p) c(-0.05*p[1] + 0.0*p[2] - 0.06, 0.0*p[1] - 0.4*p[2] - 0.47),
  function(p) c(0.03*p[1] - 0.14*p[2] - 0.16, 0.0*p[1] + 0.26*p[2] -0.01),
  function(p) c(-0.03*p[1] + 0.14*p[2] - 0.16, 0.0*p[1] - 0.26*p[2] -0.01),
  function(p) c(0.56*p[1] + 0.44*p[2] + 0.3, -0.37*p[1] + 0.51*p[2] + 0.15),
  function(p) c(0.19*p[1] + 0.07*p[2] - 0.2, -0.1*p[1] + 0.15*p[2] + 0.28),
  function(p) c(-0.33*p[1] - 0.34*p[2] - 0.54, -0.33*p[1] + 0.34*p[2] + 0.39)
)

#' Dragon-like curve
#' @usage Recommended k > 15
#' @export
dragon <- c(
  function(p) c(0.824074*p[1] + 0.281428*p[2] - 1.882290, -0.212346*p[1] + 0.864198*p[2] - 0.110607),
  function(p) c(0.088272*p[1] + 0.520988*p[2] + 0.785360, -0.463889*p[1] - 0.377778*p[2] + 8.095795)
)

#' Fern leaf
#' @usage Recommended 12 > k > 7
#' @export
fern <- c(
  function(p) c(0.0*p[1] + 0.0*p[2] + 0.0, 0.0*p[1] + 0.16*p[2] + 0.0),
  function(p) c(0.85*p[1] + 0.04*p[2] + 0.0, -0.04*p[1] + 0.85*p[2] + 1.6),
  function(p) c(0.2*p[1] - 0.26*p[2] + 0.0, 0.23*p[1] + 0.22*p[2] + 1.6),
  function(p) c(-0.15*p[1] + 0.28*p[2] + 0.0, 0.26*p[1] + 0.24*p[2] + 0.44)
)

#' Maple leaf
#' @usage Recommended k > 9
#' @export
maple <- c(
  function(p) c(0.14*p[1] + 0.01*p[2] - 1.31, 0.0*p[1] + 0.51*p[2] + 0.1),
  function(p) c(0.43*p[1] + 0.52*p[2] + 1.49, -0.45*p[1] + 0.5*p[2] - 0.75),
  function(p) c(0.45*p[1] - 0.49*p[2] - 1.62, 0.47*p[1] + 0.47*p[2] - 0.74),
  function(p) c(0.49*p[1] + 0.0*p[2] + 0.02, 0.0*p[1] + 0.51*p[2] + 1.62)
)
