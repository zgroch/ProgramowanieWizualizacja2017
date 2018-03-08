#' Cretaes IFS object of class S3
#'
#'
#' @import plyr
#' @import dplyr
#' @import ggplot2
#'
#' @export
#' @param  ... contraction functions.
#' @param porb_vec vector of probabilities
#'
#' @return Creates object of class S3
#'
#' @examples
#' #Define contraction functions
#'f1 <- function(x,y) {
#' x<-0.5*x - 0.5
#' y<-0.5*y + 0.5
#' return(c(x,y))
#' }
#'
#' f2<-function(x,y){
#'   x<-0.5*x - 0.5
#'   y<-0.5*y - 0.5
#'   return(c(x,y))
#' }
#'
#' f3<-function(x,y){
#'   x<-0.5*x + 0.5
#'   y<-0.5*y - 0.5
#'   return(c(x,y))
#' }
#' #Define probability  vector
#' p <- c(0.3333, 0.3333, 0.3334)
#'
#' sierpinski_points <-createIFS(f1, f2, f3, prob_vec=p)
#'

createIFS <- function(..., prob_vec) {

  bunch_of_contration <- list(...)
  if(length(bunch_of_contration)!=length(prob_vec)) {
    stop("Diffrent number of contraction functions
         and lenght of probability vector")
  }
  if(sum(prob_vec) != 1) {
    stop("Probability does not sum up to 1")
  }
  bunch_of_contration <- list(contrations=bunch_of_contration,probabilities= prob_vec)
  class(bunch_of_contration) <- "IFS_S3"

  return(bunch_of_contration)
}

#' Calculates points coordinations
#'
#'
#'
#' @import plyr
#' @import dplyr
#' @import ggplot2
#'
#'


createPoints <- function(bunch_of_contration, point = c(0,0), n){

  if(class(bunch_of_contration) != "IFS_S3"){

    stop("err")
  }

  no_func <- length( bunch_of_contration[[1]] )
  points <- data.frame(x = point[1],
                     y = point[2], col=1)


  for(i in 1:n) {

    new_points <- t(mapply(function(x, y, col) {

      prob <- runif(1)
      prob_test <- 0

      for( j in 1:length( bunch_of_contration[[2]]) ) {

        prob_test <- prob_test + bunch_of_contration[[2]][[j]]

        if(prob<=prob_test) {
          break()
        }
      }

      return(c(bunch_of_contration[[1]][[j]](x,y), j))
    },
    x = points$x, y = points$y))

    new_points <- data.frame(x = new_points[,1], y = new_points[,2], col = new_points[,3])

    points <- rbind(points, new_points)

  }
  points$col <- as.factor(points$col)
  colnames(points)[3] <- 'contraction_number'
  return(points)
}


#'  Plot fractal calculated by IFS method
#'
#'
#'
#' @import plyr
#' @import dplyr
#' @import ggplot2
#' @export
#'
#'
#' @param  IFS object of class IFS_FS
#' @param point starting point
#' @param n number of iteration
#'
#' @return Creates plot of fractal
#'
#' @examples
#' # Example sierpinski_triangle from createIFS
#' plot(sierpinski_triangle, n = 10)

plot.IFS_S3 <- function(IFS,point=c(0,0), n) {

  data <- createPoints(IFS,point,n)

  p <- ggplot(data, aes(x,y, color=contraction_number, group=contraction_number)) + geom_point(size=0.25) +
    theme(
      panel.background = element_rect(fill='white'),
      panel.grid.major.x = element_blank(),
      panel.grid.major.y = element_blank(),
      panel.grid.minor.x = element_blank(),
      panel.grid.minor.y = element_blank(),
      axis.text.x=element_blank(),
      axis.text.y=element_blank(),
      axis.line=element_blank(),
      axis.ticks=element_blank(),
      axis.title.x=element_blank(),
      axis.title.y=element_blank()
    )
  return(p)

}



