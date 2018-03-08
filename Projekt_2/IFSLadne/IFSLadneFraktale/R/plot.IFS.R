#' Plot the S3 object of class IFS
#' @param x object of class IFS
#' @param wektorpocz vector of length 2
#' @param glebokosc depth of fractal
#' @param ... Arguments to be passed to methods, such as graphical parameters present in the default in plot() function
#' @return plot
#' @export
#' @importFrom graphics plot
#' @examples
#' s1<-function(vec){
#' x<-vec[1]
#' y<-vec[2]
#' x<-1/2*x
#' y<-1/2*y
#' return(c(x,y)) }
#'
#' s2<-function(vec){
#' x<-vec[1]
#' y<-vec[2]
#' x<-1/2*x+1/2
#' y<-1/2*y
#' return(c(x,y)) }
#'
#' s3<-function(vec){
#' x<-vec[1]
#' y<-vec[2]
#' x<-1/2*x+1/4
#' y<-1/2*y+3**(1/2)/4
#' return(c(x,y)) }
#'
#'
#' t1<-function(vec){
#'   x<-vec[1]
#'   y<-vec[2]
#'   x<-0.01*x
#'   y<-0.45*y
#'   return(c(x,y)) }
#'
#' t2<-function(vec){
#'   x<-vec[1]
#'   y<-vec[2]
#'   x<-(-0.01)*x
#'   y<-(-0.45)*y+0.4
#'   return(c(x,y)) }
#'
#' t3<-function(vec){
#'   x<-vec[1]
#'   y<-vec[2]
#'   x<-0.42*x-0.42*y
#'   y<-0.42*x+0.42*y+0.4
#'   return(c(x,y)) }
#'
#'
#' t4<-function(vec){
#'   x<-vec[1]
#'   y<-vec[2]
#'   x<-0.42*x+0.42*y
#'   y<-(-0.42)*x+0.42*y+0.4
#'   return(c(x,y)) }
#'
#' Paproc<- function(vec){
#'   x<-vec[1]
#'   y<-vec[2]
#'   p<-85+7+7+1
#'   r=sample(1:p, 1, replace=TRUE)
#'   if (r >= 16 & r <= 100 ){
#'     x=0.85*x+0.04*y
#'     y=-0.04*x+0.85*y+1.6
#'   }
#'   if (r >= 9 & r <= 15 ){
#'     x=-0.15*x+0.28*y
#'     y=0.26*x+0.24*y+0.44
#'   }
#'   if (r >= 2 & r <= 8 ){
#'     x=0.20*x-0.26*y
#'     y=0.23*x+0.22*y+1.6
#'   }
#'   if (r == 1){
#'     x=0.0
#'     y=0.16*y
#'   }
#'  return(c(x,y))
#' }
#' Smok<- function(vec){
#'   x<-vec[1]
#'   y<-vec[2]
#'   r=runif(1)
#'   if (r < 0.5){
#'     x=-0.4*x-1
#'     y=-0.4*y+0.1
#'   }
#'   if (r >= 0.5){
#'     x=0.76*x-0.4*y
#'     y=0.4*x+0.76*y
#'   }
#'   return(c(x,y))
#' }
#'
#' a <- createIFS(s1,s2,s3)
#' plot(a, c(0,0), 8)
#'
#' b <- createIFS(t1,t2,t3,t4)
#' plot(b,c(0,0), 8)
#'
#' c <- createIFS(Paproc)
#' plot(c, c(0,0), 10000)
#'
#' d <- createIFS(Smok)
#' plot(d,c(0,0),10000)

plot.IFS <- function(x, wektorpocz, glebokosc, ...) {
  IFS<-x
  class(IFS)<- "list"
  x<-wektorpocz[1]
  y<-wektorpocz[2]
  listapunktow <- list()
  listapunktowglebokosc<-list()
  listapunktowglebokosc[[1]]<-list(x,y)
  listapunktow[[1]]<-listapunktowglebokosc
  for (i in 2:glebokosc){
    listapunktowglebokosc <- list()
    it<-1
    for (j in 1:length(listapunktow[[i-1]])){
      for (f in IFS){
        listapunktowglebokosc[[it]]<-(f(c(listapunktow[[i-1]][[j]][[1]],listapunktow[[i-1]][[j]][[2]])))
        it<-it+1
      }
    }
    listapunktow[[i]]<-listapunktowglebokosc
  }
  for (j in listapunktow){
    for (i in j){
      x<-c(x,i[[1]])
      y<-c(y,i[[2]])
    }
  }
  plot(x,y, type="p")
}
