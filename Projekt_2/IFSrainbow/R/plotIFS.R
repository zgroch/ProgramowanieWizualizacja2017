#' Plot a fractal
#'
#' \code{plot.IFS} plots fractals obtained by \code{\link{createIFS}} function
#'
#' This function plots IFS fractals. By default it uses the method
#' called "chaos game" in which random points are transformed by a
#' random composition of the fractal defining
#' functions.
#'
#' @param x an S3 object of class \code{IFS}, as returned by
#' \code{\link{createIFS}}
#' @param n number of points in the resulting plot
#' @param depth length of compositions of functions used to obtain
#' the plotted points
#' @param probs optional argument that defines probabilities of using
#' respective functions.
#' By defalt it is a sequence of 1's (i.e. all functions are equally probable).
#' @param inits optional argument being a matrix with \code{n} rows and
#' 2 columns which defines a
#' set of \code{n} points. These points serve as arguments for the compositions of
#' length \code{depth}
#' of function given by the \code{ifs} argument. By default it is set to
#' \code{"random"},
#' which means that these points are sampled from the uniform distribution on [-1,1]
#' by [-1,1] square.
#' @param seed optional parameter that allows for setting the seed and hence makes
#' replication possible. The default
#' value is \code{FALSE} which means that the seed is not changed.
#' @param ... graphical parameters passed to \code{\link[ggplot2]{ggplot}}
#' function
#'
#' @return The output is an object of class \code{\link[ggplot2]{ggplot}},
#' which allows for some further modifications
#' of the plot, as indicated in the Examples.
#'
#' @examples
#' p1 <- plot(heighway, 2000, 10)
#' p1
#' p2 <- plot(heighway, 2000, 10, probs=c(2,1),
#'            inits=matrix(c(1,1), 1, 2), color="black")
#' p2
#' p1 + ggplot2::coord_fixed() + ggplot2::ggtitle("Heighway Dragon")
#'
plot.IFS <- function(x, n, depth, probs=replicate(length(x),1), inits="random", seed=FALSE, ...){
    id <- NULL; y <- NULL; # this line is only to prevent NOTE from appear

    ifs_sample <- generateIFS(x, n, depth, probs, inits, seed)
    paths <- ifs_sample$paths
    paths <- 1 + paths %% 3
    mycoords <- apply(paths, 1, tocolor)
    myRGB <- apply(mycoords, 2, toRGB)
    mypoints <- ifs_sample$points
    mypoints$id <- as.factor(1:n)
    p <- ggplot2::ggplot(mypoints, ggplot2::aes(x,y,label=id,color=id)) + ggplot2::geom_point(...) +
        ggplot2::scale_colour_manual(values=myRGB) + ggclean()
    return(p)
}
