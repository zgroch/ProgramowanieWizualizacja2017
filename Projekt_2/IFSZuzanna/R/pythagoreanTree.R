
#Pythagorean Tree
pythagoreanTreef1 <- function(point) {
  x<- point[1]
  y<- point[2]
  c((cos(pi/4))^2 * x - cos(pi/4) * sin(pi/4) * y, cos(pi/4) * sin(pi/4) * x + (cos(pi/4))^2 * y + 1)
}


pythagoreanTreef2 <- function(point) {
  x<- point[1]
  y<- point[2]
  wynik <- c((sin(pi/4))^2 * x + cos(pi/4) * sin(pi/4) * y + (cos(pi/4))^2 , -cos(pi/4) * sin(pi/4) * x + (sin(pi/4))^2 * y + 1 + cos(pi/4) * sin(pi/4))
  wynik
}

pythagoreanTreef3 <- function(point) {
  x<- point[1]
  y<- point[2]
  wynik <- c(x, y)
  wynik
}

pythagoreanTree <- createIFS(list(pythagoreanTreef1, pythagoreanTreef2, pythagoreanTreef3))
