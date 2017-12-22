library(graphics)

setClass("IFS", representation(func_list="list", points="list"))


#' Plots given IFS object
#'
#' Plots IFS object with given depth and color
#'
#' @param .Object IFS object
#' @param depth depth to which we want to call functions
#' @param color optional color for fractal, default color is black
#' @examples
#' func_list <- list(f1,f2)
#' fractal <- createIFS(func_list)
#' plot(fractal, 6, 'red')
#'
#' @export
#'

setGeneric(
  name="plot",
  def=function(.Object, depth, color){
    standardGeneric("plot")
  }
)

#' GetPoints for fractal
#'
#' It makes data frame from points which we want to draw.
#'
#' @param .Object IFS object
#' @param point starting point for drawing fractal
#' @param depth depth to which we want to call functions
#'
#' @examples
#' func_list <- list(f1,f2)
#' fractal <- createIFS(func_list)
#' getPoints(fractal, c(0,0), 7)
#'
#' @export
#'
#'
setGeneric(
  name="getPoints",
  def=function(.Object, point, depth){
    standardGeneric("getPoints")
  }
)


setMethod("initialize", "IFS",
  function(.Object, func_list=list(), points=list()) {
    .Object@func_list <- func_list
    .Object
  }
)

setMethod("getPoints", "IFS",
  function(.Object, point, depth) {
    result <- do.call(rbind.data.frame, list(point))
    colnames(result) <- c('X', 'Y')

    if (depth > 0) {
      for(f in .Object@func_list) {
        next_point <- f(point)
        if (!is.null(next_point)) {
          n <- getPoints(.Object, next_point, depth - 1)
          result <- rbind(result, n)
        }
      }
    }
    result
  }
)

setMethod("plot", "IFS",
  function(.Object, depth, color) {
    if(missing(color)) {
      color <- 'black'
    }
    my_points <- getPoints(.Object, c(0, 0), depth)
    graphics::plot(my_points$X, my_points$Y, cex=0.2, pch=20, col=color, xaxt='n', ann=FALSE, yaxt='n')
  }
)
