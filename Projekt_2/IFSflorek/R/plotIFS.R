#' Plot a fractal from IFS Object
#'
#' plot.IFS is an overloaded plotting function for \code{IFS} objects.
#'
#' @param x object of a class \code{IFS}
#' @param depth depth to which the fractal should be plotted. Defaults to 8.
#' @param starting_point starting point to which the functions of \code{x} should be applied
#' @param colour_palette function defining colours to be used for each iteration or a list of colours; defaults to rainbow
#' @param reverse wheter the iterations should be plotted and coloured in reversed order; default: TRUE
#' @param ... other parameters to be passed through to plotting functions.
#'
#' @examples
#' fractal <- createIFS( function(x) { c(0.5*x[1], 0.5*x[2]) },
#' function(x) { c(0.5*x[1] + 0.5, 0.5*x[2]) },
#' function(x) { c(0.5*x[1] + 0.25, 0.5*x[2] + sqrt(3)/4) } )
#' plot(fractal, depth = 9)
#'
#' @import ggplot2
#' @importFrom grDevices rainbow
#' @importFrom graphics plot
#'
#' @export


plot.IFS <- function(x, depth = 8, starting_point = c(0,0),
                     colour_palette = rainbow,
                     reverse = TRUE, ...) {

  IFS <- x

  ### Defining data.frame points containing points of future plot.
  points <- NULL
  points[[1]] <- data.frame(starting_point[1],starting_point[2])
  names(points[[1]]) <- c("x", "y")

  for (iteration in 2:(depth+1)){
    points[[iteration]] <- data.frame(0,0)
    colnames(points[[iteration]]) <- c("x", "y")
    for (function_number in 1:length(IFS)) {
      new_points <- t(apply(points[[iteration-1]], 1, IFS[[function_number]]))
      start_of_iteration <- (function_number - 1) * nrow(points[[iteration - 1]]) + 1
      end_of_iteration <- function_number * nrow(points[[iteration - 1]])
      points[[iteration]][start_of_iteration:end_of_iteration,] <- new_points
    }
  }

  ### Setting colours of iterations.
  if (typeof(colour_palette) == "closure") {
    colours_of_iterations <- colour_palette(depth+1)
  } else {
    colours_of_iterations <- rep(colour_palette, length = depth+1)
  }
  if (!reverse) {
    colours_of_iterations <- rev(colours_of_iterations)
  }

  IFSplot <- ggplot(points[[1]], aes_string("x", "y"), ...) +
    theme_classic() +
    geom_point(size = .75, colour = colours_of_iterations[1]) +
    theme(legend.position = "none",
          axis.ticks.y = element_blank(), axis.text.y = element_blank(),
          axis.ticks.x = element_blank(), axis.text.x = element_blank(),
          axis.line = element_blank()) +
    labs(title = NULL, y = NULL, x = NULL) +
    coord_cartesian()

  for (iteration in (depth+1):2) {
    IFSplot <- IFSplot +
      geom_point(data = points[[iteration]],
                 mapping = aes_string("x", "y"),
                 size = .75, colour = colours_of_iterations[iteration])
  }

  IFSplot
}
