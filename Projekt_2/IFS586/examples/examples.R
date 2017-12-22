

trian1 <- function(x,y) {
  x<-0.5*x - 0.5
  y<-0.5*y + 0.5
  return(c(x,y))
}

trian2 <- function(x,y) {
  x<-0.5*x - 0.5
  y<-0.5*y - 0.5
  return(c(x,y))
}

trian3 <- function(x,y) {
  x<-0.5*x + 0.5
  y<-0.5*y - 0.5
  return(c(x,y))
}

trianp <- c(0.3333, 0.3333, 0.3334)

po <- c(0,0)

sierpinski_triangle <- createIFS(trian1, trian2, trian3, prob_vec=trianp)

plot(sierpinski_triangle, n=15)



#-----------------
# sierpinski differences
#http://citeseerx.ist.psu.edu/viewdoc/download?doi=10.1.1.403.2843&rep=rep1&type=pdf
trian1_nl <- function(x,y) {
  x <- 175*x/500*x/500 + 75*x/500 + 100
  y <- 175*y/500*y/500 + 75*y/500 + 220
  return(c(x,y))
}

trian2_nl <- function(x,y ){
  x <- 175*x/500*x/500 + 75*x/500 + 200
  y <- 175*y/500*y/500 + 75*y/500 + 50
  return(c(x,y))
}

trian3_nl <- function(x,y) {
  x <- 175*x/500*x/500 + 75*x/500 + 50
  y <- 175*y/500*y/500 + 75*y/500 + 50
  return(c(x,y))
}

trianp <- c(0.3333, 0.3333, 0.3334)


sierpinski_triangle_nonlinear <- createIFS(trian1_nl, trian2_nl, trian3_nl, prob_vec=prob_nl)
plot(sierpinski_triangle_nonlinear, n=15)


#### SMOK

dragon1 <- function(x,y) {
  x <- -0.4*x - 1
  y <- -0.4*y+0.1
  return(c(x,y))
}

dragon2 <- function(x,y) {
  x <- 0.76*x-0.4*y
  y <- 0.4*x+0.76*y
  return(c(x,y))
}

dragonp <- c(0.5, 0.5)

dragon <- createIFS(dragon1, dragon2, prob_vec = dragonp)

plot(dragon, n=20)
save(dragon1, dragon2, dragonp, dragon, trian1, trian2, trian3, trianp, sierpinski_triangle,
     trian1_nl,trian2_nl, trian3_nl,sierpinski_triangle_nonlinear , file='./data/examples.rda')


## maple leaf

leaf1 <- function(x,y) {
  x <- 0.14*x + 0.01*y - 0.08
  y <- 0*x + 0.51*y - 1.31
  return(c(x,y))
}

leaf2 <- function(x,y) {
  x <- 0.43*x + 0.52*y + 1.49
  y <- -0.45*x + 0.5*y - 0.75
  return(c(x,y))
}

leaf3 <- function(x,y) {
  x <- 0.45*x - 0.49*y - 1.62
  y <- 0.47*x + 0.47*y - 0.74
  return(c(x,y))
}

leaf4 <- function(x,y) {
  x <- 0.49*x + 0*y + 0.02
  y <- 0*x + 0.51*y + 1.62
  return(c(x,y))
}

leaf_prob <- c(0.1,0.35,0.35,0.2)

maple_leaf <- createIFS(leaf1,leaf2, leaf3, leaf4, prob_vec = leaf_prob)
plot(maple_leaf, n = 20)

## maple leaf

fem1 <- function(x,y) {
  x <- 0*x + 0*y + 0.0
  y <- 0*x + 0.16*y + 0
  return(c(x,y))
}

fem2 <- function(x,y) {
  x <- 0.85*x + 0.04*y + 0
  y <- -0.04*x + 0.85*y + 1.6
  return(c(x,y))
}

fem3 <- function(x,y) {
  x <- 0.2*x - 0.26*y - 0
  y <- 0.23*x + 0.22*y + 1.6
  return(c(x,y))
}

fem4 <- function(x,y) {
  x <- -0.15*x + 0.28*y + 0
  y <- 0.26*x + 0.24*y + 0.44
  return(c(x,y))
}

fem_prob <- c(0.01,0.85,0.07,0.07)

fem <- createIFS(fem1,fem2, fem3, fem4, prob_vec = fem_prob)
plot(fem, n = 20)

save(leaf1, leaf2,leaf3, leaf4, leaf_prob, maple_leaf,
     fem1,fem2, fem3,fem4 ,fem, file='./data/examples2.rda')

### choinka dla Szymona

ch1 <- function(x,y){
  x <- 0.03*x
  y <- 0.1*y
  return(c(x,y))
}

ch2 <- function(x,y){
  x <- 0.85*x
  y <- 0.85*y+1.5
  return(c(x,y))
}

ch3 <- function(x,y){
  x <- 0.8*x
  y <- 0.8*y+1.5
  return(c(x,y))
}

ch4 <- function(x,y){
  x <- 0.2*x-0.08*y
  y <- 0.15*x+0.22*y+0.85
  return(c(x,y))
}

ch5 <- function(x,y){
  x <- -0.2*x+0.08*y
  y <- 0.15*x+0.22*y+0.85
  return(c(x,y))
}

ch6 <- function(x,y){
  x <- 0.25*x-0.1*y
  y <- 0.12*x+0.25*y+0.3
  return(c(x,y))
}

ch7 <- function(x,y){
  x <- -0.2*x+0.1*y
  y <- 0.12*x+0.2*y+0.4
  return(c(x,y))
}


p_ch <- c(0.02, 0.6, 0.1, 0.07, 0.07, 0.07, 0.07)

christmas_tree <- createIFS(ch1, ch2, ch3, ch4, ch5, ch6, ch7, prob_vec = p_ch)

plot(christmas_tree, point=c(0, 0), n=15)





### PENTAGON
pentagon1 <- function(x,y){
  x <- 0.382*x
  y <- 0.382*y
  return(c(x,y))
}

pentagon2 <- function(x,y){
  x <- 0.382*x+0.618
  y <- 0.382*y
  return(c(x,y))
}

pentagon3 <- function(x,y){
  x <- 0.382*x+0.809
  y <- 0.382*y+0.588
  return(c(x,y))
}

pentagon4 <- function(x,y){
  x <- 0.382*x+0.309
  y <- 0.382*y+0.951
  return(c(x,y))
}

pentagon5 <- function(x,y){
  x <- 0.382*x-0.191
  y <- 0.382*y+0.588
  return(c(x,y))
}

pentagonp <- c(0.2, 0.2, 0.2, 0.2, 0.2)

pentagon <- createIFS(pentagon1, pentagon2, pentagon3, pentagon4, pentagon5, prob_vec = pentagonp)

plot(pentagon, n=15)

save(ch1, ch2, ch3, ch4, ch5, ch6, ch7, p_ch,
     christmas_tree,pentagon1, pentagon2, pentagon3, pentagon4, pentagon5,pentagonp,pentagon, file='./data/examples3.rda')


