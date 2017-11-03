vec <- 1:5
vec <- seq(1, 5, 1)

for (i in vec) {
  cat(i, "\n")
}

kraje <- c("Polska", "Grecja", "Polska", "Polska")

for (i in kraje) {
  cat(i, "\n")
}

for (i in iris) {
  i[1]+i[2]
}

lapply(iris, function(i){
  i[1]+i[2]
})

wynik <- numeric(length(vec))
for (i in vec) {
  wynik[i] <- i
}

wynik <- lapply(vec, function(i){
  i
})

wynik <- sapply(vec, function(i){
  i
})

x <- 0
repeat({
  i <- runif(1)
  x <- x + 1
  if (x > 10) break()
  cat(i, "\n")
})

wynik <- replicate(100, {
  runif(1)
})

# -----------
# instrukcje warunkowe
i <- 0.2
if (i %in% c(0.5, 0.7)) 
  cat("mniej") else 
  cat("wiecej")

czy_wieksze_niz_5_8 <- iris$Sepal.Length > 5.8
ifelse(iris$Sepal.Length > 5.8, 
       iris$Sepal.Length,
       c(5.8, 1))
p <- c(0.000,0.1)
ifelse(p < 0.05, 
       "*",
       "")

x <- "Polska4"
switch (x,
        Polska = cat("Hura"),
        Polska2 = cat("Nie hura"),
        Polska3 = cat("Nie nie hura"),
        cat("Cos innego")
)

switch2 <- function(expr, ...){
  lista <- list(...)
  lista[[expr]]
}
switch2("jablko", jablko = 3)

####################
# funkcje

function() 1




(function(x) {
  x^2
})(2)

kwadrat <- function(x) {
  x^2
}
kwadrat(2)
kwadrat(x = 2)

potega <- function(x, k = 2, delta) {
  x^k - delta
}
potega(x=2, 3)
potega(x=2, delta=3)
potega(2, 3)
potega(2, 3)

potega2 <- function(czesc, ...) {
  cat(czesc)
  potega(2, ...)
}
potega2(3, delta=0, czesc="Hello")


moj_plot <- function(title="Czesc", ...) {
  plot(main = title, ...)
}


iris[1,2,drop=FALSE]

co_w_srodku <- function(...) {
  list(...)
}
co_w_srodku(1, 2, 3, Polska = 4)


lapply(1:100, function(i) {
  i^2
})

tmp <- function(i) {
  i^2
}
lapply(1:100, tmp)

class(kwadrat)

x <- iris$Sepal.Length
dystrbuanta <- ecdf(x)
dystrbuanta(5)

ecdf(x)(5)

plot(dystrbuanta)

funkcje <- list(sin, cos, tan)
lapply(funkcje, function(x)x(1))

wektor <- c("A", "B")
lapply(1:2, `[`, wektor)


wektor[2]
`[`(wektor, 2)
`for`()


