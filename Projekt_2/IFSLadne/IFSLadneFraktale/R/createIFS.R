#' Create an S3 object of class IFS
#' @param ... 3 or more functions genereting a vector of length2, such as from example: s1, s2, s3, t1, t2, t3 or t4.
#' @return Object of class IFS
#' @importFrom stats runif
#' @export
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
#'  s3<-function(vec){
#' x<-vec[1]
#' y<-vec[2]
#' x<-1/2*x+1/4
#' y<-1/2*y+3**(1/2)/4
#' return(c(x,y)) }
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
#'   r=sample(1:p, 1, replace=T)
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
#'
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
#' a <- createIFS(s1,s2,s3)
#'
#' b <- createIFS(t1,t2,t3,t4)
#'
#' c <- createIFS(Paproc)
#'
#' d <- createIFS(Smok)
createIFS <- function(...) {
  I<-c(list(...))
  class(I)<-"IFS"
  return(I)
}
