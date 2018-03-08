#' @title Plotting an IFS object.
#' @description
#' Plotting fractal via polymorphic version of the generic \code{plot()} function for IFS class.
#' @param x An IFS object describing given fractal.
#' @param iter Number of iterations, i.e. the depth of plotting.
#' @param startPts List of starting points.
#' @param ... Arguments to be passed to subsequent methods.
#' @export
#' @importFrom graphics plot
#' @examples
#' myFractal <- createIFS(SierpinskiTriangle)
#' plot(myFractal, 5)

plot.IFS <- function(x, iter, startPts = list(c(0, 0)), ...) {
    # Defining list of contractions and its length.
    contractions <- x$contractions
    lenContr <- length(contractions)
    # Creating the list of points and colors with which the points should be coloured.
    points <- createPoints(contractions, iter, startPts)
    coloredPts <- colorPoints(iter, lenContr, length(startPts))

    xPts <- unlist(lapply(points, "[[", 1))
    yPts <- unlist(lapply(points, "[[", 2))

    plot(xPts, yPts, xlim = range(min(xPts) - 1/9, max(xPts) + 1/9), ylim = range(min(yPts) - 1/9, max(yPts) + 1/9), axes = FALSE, ann = FALSE,
        frame.plot = FALSE, pch = ".", col = coloredPts)
}






