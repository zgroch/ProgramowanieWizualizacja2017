#'@title Coloring fractal points.
#'@description Creating list of colors for the \code{plot.IFS()} function such that one color corresponds to one contraction.
#'@param iter Number of iterations that should be performed in the \code{plot.IFS()} function.
#'@param lenContr Number of contractions used in given IFS.
#'@param lenStartPts Length of starting points list.
#'@return List of colors that corresponds to contractions.
#'@importFrom grDevices rainbow

colorPoints <- function(iter, lenContr, lenStartPts = 1) {
    fractalColors <- rainbow(lenContr)
    colorPts <- c()
    colorPts <- rep(("black"), each = lenStartPts)
    for (i in seq_along(1:iter)) {
        colorPts <- c(colorPts, fractalColors[rep(1:lenContr, each = lenStartPts * lenContr^(i - 1))])
    }
    colorPts
}
