#'@title Creating the list of points to corresponding given fractal.
#'@description
#'Each points is represented via its standard Cartesian coordinates.
#'@param contractions List of contractions that generate given fractal.
#'@param iter Number of iterations that should be executed.
#'@param startPts List of starting points.
#'@return List of points that shapes given fractal.

createPoints <- function(contractions, iter, startPts = list(c(0, 0))) {
    lastIterPoints <- startPts
    setOfPoints <- lastIterPoints
    for (i in seq_along(1:iter)) {
        imageContr <- list()
        for (num_contr in seq_along(1:length(contractions))) {
            # Adding to the 'imageContr' list of contractions image of the 'lastIterPoints' points.
            imageContr <- append(imageContr, lapply(lastIterPoints, contractions[[num_contr]]))
        }
        lastIterPoints <- imageContr
        # Adding newly generated points to the list of already generated points.
        setOfPoints <- append(setOfPoints, lastIterPoints)
    }
    setOfPoints
}





