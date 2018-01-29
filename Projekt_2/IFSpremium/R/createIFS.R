#' @title Creating object of the IFS class.
#' @description The IFS class is dedicated to create and plot fractals
#' that can be generated from systems of contractions (IFS - Iterated Functions System).
#' @param contractions List of contractions for fractal generation.
#' @return Object of IFS class.
#' @export
#' @examples
#' myFractal <- createIFS(SierpinskiTriangle)

createIFS <- function(contractions) {
    if (length(contractions) < 3)
        stop("Number of contractions has to be at least 3")
    IFS <- list(contractions = contractions)
    class(IFS) <- "IFS"
    IFS
}
