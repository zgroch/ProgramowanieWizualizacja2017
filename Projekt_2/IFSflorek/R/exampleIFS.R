#' This function can draw some fractals.
#'
#' @param fractal_name Name of a fractal
#' @param depth depth to which the fractal should be drawn. Defaults to 8.
#'
#' @details
#' Currently available are following fractals:
#' \itemize{
#'   \item sierpinski_gasket (or sierpinski_triangle, or sierpinski)
#'   \item fractal_tree
#'   \item koch (or koch_curve)
#'   \item heighway_dragon
#'   \item barnsley_fern
#' }
#'
#' @export

exampleIFS <- function(fractal_name, depth = 8) {
  if (fractal_name %in% c("sierpinski", "sierpinski_gasket", "sierpinski_triangle")) {
    plot(sierpinski_gasket, depth = depth)
  } else if (fractal_name == "fractal_tree") {
    plot(fractal_tree,  depth = depth)
  } else if (fractal_name %in% c("koch", "koch_curve")) {
    plot(koch,  depth = depth)
  } else if (fractal_name == "heighway_dragon") {
    plot(heighway_dragon,  depth = depth)
  } else if (fractal_name == "barnsley_fern") {
    plot(barnsley_fern,  depth = depth)
  }
}

