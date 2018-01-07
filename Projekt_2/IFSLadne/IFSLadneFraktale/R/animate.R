
#' Animate an S3 object of class IFS
#' @param IFS, object of class IFS
#' @param glebokosc depth of fractal
#' @param lkolorow number of colors
#' @param lfunkcji number of functions
#' @return animated plot
#' @export
#' @importFrom graphics plot
#' @importFrom plotly plot_ly
#' @importFrom plotly %>%
#' @examples
#'
#' t1<-function(vec){
#' x<-vec[1]
#' y<-vec[2]
#' x<-0.01*x
#' y<-0.45*y
#' return(c(x,y))
#' }
#'
#' t2<-function(vec){
#'   x<-vec[1]
#'   y<-vec[2]
#'   x<-(-0.01)*x
#'   y<-(-0.45)*y+0.4
#'   return(c(x,y))
#' }
#'
#' t3<-function(vec){
#'   x<-vec[1]
#'   y<-vec[2]
#'   x<-0.42*x-0.42*y
#'   y<-0.42*x+0.42*y+0.4
#'   return(c(x,y))
#' }
#'
#' t4<-function(vec){
#'   x<-vec[1]
#'   y<-vec[2]
#'   x<-0.42*x+0.42*y
#'   y<-(-0.42)*x+0.42*y+0.4
#'   return(c(x,y))
#' }
#'
#' s1<-function(vec){
#'   x<-vec[1]
#'   y<-vec[2]
#'   x<-1/2*x
#'   y<-1/2*y
#'   return(c(x,y))
#' }
#'
#' s2<-function(vec){
#'   x<-vec[1]
#'   y<-vec[2]
#'   x<-1/2*x+1/2
#'   y<-1/2*y
#'   return(c(x,y))
#' }
#' s3<-function(vec){
#'   x<-vec[1]
#'   y<-vec[2]
#'   x<-1/2*x+1/4
#'   y<-1/2*y+3**(1/2)/4
#'   return(c(x,y))
#' }
#'
#' b1<-function(vec){
#'   x<-vec[1]
#'   y<-vec[2]
#'   x<-0.85*x+0.04*y
#'   y<-(-0.04)*x+0.85*y+1.6
#'   return(c(x,y))
#' }
#'
#' b2<-function(vec){
#'   x<-vec[1]
#'   y<-vec[2]
#'   x<-(-0.15*x)+0.28*y
#'   y<-0.26*x+0.24*y+0.44
#'   return(c(x,y))
#' }
#'
#' b3<-function(vec){
#'   x<-vec[1]
#'   y<-vec[2]
#'   x<-0.2*x-0.26*y
#'   y<-0.23*x+0.22*y+1.6
#'   return(c(x,y))
#' }
#'
#' b4<-function(vec){
#'   x<-vec[1]
#'   y<-vec[2]
#'   x<-0
#'   y<-0.16*y
#'   return(c(x,y))
#' }
#'
#' ss1<-function(vec){
#'   x<-vec[1]
#'   y<-vec[2]
#'   x<-x/3-1/3
#'   y<-y/3+1/3
#'   return(c(x,y))
#' }
#'
#' ss2<-function(vec){
#'   x<-vec[1]
#'   y<-vec[2]
#'   x<-x/3
#'   y<-y/3+1/3
#'   return(c(x,y))
#' }
#'
#' ss3<-function(vec){
#'   x<-vec[1]
#'   y<-vec[2]
#'   x<-x/3+1/3
#'   y<-y/3+1/3
#'   return(c(x,y))
#' }
#'
#' ss4<-function(vec){
#'   x<-vec[1]
#'   y<-vec[2]
#'   x<-x/3+1/3
#'   y<-y/3
#'   return(c(x,y))
#' }
#'
#' ss5<-function(vec){
#'   x<-vec[1]
#'   y<-vec[2]
#'   x<-x/3+1/3
#'   y<-y/3-1/3
#'   return(c(x,y))
#' }
#'
#' ss6<-function(vec){
#'   x<-vec[1]
#'   y<-vec[2]
#'   x<-x/3
#'   y<-y/3-1/3
#'   return(c(x,y))
#' }
#'
#' ss7<-function(vec){
#'   x<-vec[1]
#'   y<-vec[2]
#'   x<-x/3-1/3
#'   y<-y/3-1/3
#'   return(c(x,y))
#' }
#'
#' ss8<-function(vec){
#'   x<-vec[1]
#'   y<-vec[2]
#'   x<-x/3-1/3
#'   y<-y/3
#'   return(c(x,y))
#' }
#'
#' triangle<-createIFS(s1,s2,s3)
#' tree<-createIFS(t1,t2,t3,t4)
#' barnsley<-createIFS(b1,b2,b3,b4)
#' square<-createIFS(ss1,ss2,ss3,ss4,ss5,ss6,ss7,ss8)
#'\dontrun{
#' animate(triangle,9,3,3)
#' animate(triangle,9,9,3)
#' animate(triangle,9,6,3)
#' animate(tree,8,4,4)
#' animate(barnsley,20,8,4)
#' animate(square,5,50,8)
#' animate(square,5,16,8)
#'}

#funkcja publiczna
animate<-function(IFS,glebokosc, lkolorow,lfunkcji){
  #library(plotly)
  wsppunktow<-print(IFS,c(0,0),glebokosc)
  wsppunktow<-as.list(wsppunktow)
  a<-seq(1,length(wsppunktow)/2-1,length=length(wsppunktow)/2-1)
  i<-1
  licz<-0
  while (i<length(wsppunktow)/2-1){
    kon=(i-1)+lfunkcji^(licz)
    a[i:kon]<-licz;
    i<-i+lfunkcji^(licz);
    licz<-licz+1
  }
  wspxowe=length(wsppunktow)/2+1
  wspyowe=length(wsppunktow)-1
  k=length(wsppunktow)/2-1
  x = wsppunktow[1:k]
  y = wsppunktow[wspxowe:wspyowe]
  f = a
  a<-seq(1,length(wsppunktow)/2-1,length=length(wsppunktow)/2-1)
  color<-seq(1,length(wsppunktow)/2-1,length=length(wsppunktow)/2-1)
  for (i in 1:length(color)){
    color[i]<-i%%lkolorow;
  }
  x=unlist(x)
  y=unlist(y)
  f=unlist(f)
  color=unlist(color)
  df <- data.frame(
    x = x,
    y = y,
    f = f,
    color=color
  )
  p <- df %>%
    plot_ly(
      x = ~x,
      y = ~y,
      frame = ~f,
      color = ~color,
      type = 'scatter',
      mode = 'markers',
      showlegend = F
    )
  return(p)
}

# funkcja prywatna
print.IFS <- function(IFS, wektorpocz, glebokosc) {
  class(IFS)<- "list"
  x<-wektorpocz[1]
  y<-wektorpocz[2]
  listawspolrzednych <- list()
  listawspolrzednychglebokosc<-list()
  listawspolrzednychglebokosc[[1]]<-list(x,y)
  listawspolrzednych[[1]]<-listawspolrzednychglebokosc
  for (i in 2:glebokosc){
    listawspolrzednychglebokosc <- list()
    it<-1
    for (j in 1:length(listawspolrzednych[[i-1]])){
      for (f in IFS){
        listawspolrzednychglebokosc[[it]]<-(f(c(listawspolrzednych[[i-1]][[j]][[1]],listawspolrzednych[[i-1]][[j]][[2]])))
        it<-it+1
      }
    }
    listawspolrzednych[[i]]<-listawspolrzednychglebokosc
  }
  for (j in listawspolrzednych){
    for (i in j){
      x<-c(x,i[[1]])
      y<-c(y,i[[2]])
    }
  }
  return(c(x,y))
}
