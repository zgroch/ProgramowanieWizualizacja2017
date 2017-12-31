## ----heighway_dragon_functions-------------------------------------------
scale_and_rotate1 <- function(x) {
  c(0.5*x[1] - 0.5*x[2], 0.5*x[1] + 0.5*x[2])
}
scale_and_rotate2 <- function(x) {
  c(-0.5*x[1] - 0.5*x[2] + 1, 0.5*x[1] - 0.5*x[2])
}

## ----create_heighway_dragon_fractal--------------------------------------
library(IFSflorek)
heighway_dragon <- createIFS(scale_and_rotate1, scale_and_rotate2)

## ----plot_heighway_dragon------------------------------------------------
plot(heighway_dragon)

## ----plot_heighway_dragon_change_depth-----------------------------------
plot(heighway_dragon, depth = 13)

## ----plot_heighway_dragon_change_colours---------------------------------
plot(heighway_dragon, depth = 10, colour_palette = "black")
plot(heighway_dragon, depth = 10, colour_palette = heat.colors)

## ----check_datasets, eval = FALSE----------------------------------------
#  data(package = "IFSflorek")

## ----about_datasets, eval=FALSE------------------------------------------
#  ?sierpinski_gasket

## ----exampleIFS----------------------------------------------------------
exampleIFS("sierpinski", 7)

## ----create_matrix_of_coefficients---------------------------------------

matrix_of_coefficients <- matrix(c(
  0.00,  0.00,  0.00, 0.16, 0, 0.00,
  0.85,  0.04, -0.04, 0.85, 0, 1.60,
  0.20, -0.26,  0.23, 0.22, 0, 1.60,
  -0.15,  0.28,  0.26, 0.24, 0, 0.44
), ncol = 6, byrow = TRUE)
colnames(matrix_of_coefficients) <- c("a", "b", "c", "d", "e", "f")

matrix_of_coefficients


## ------------------------------------------------------------------------
barnsley_fern <- createIFS_from_coefficients(matrix_of_coefficients)

plot(barnsley_fern, colour_palette = c("green", "red"))


## ----random_fractals-----------------------------------------------------
set.seed(16)
random_fractal <- randomIFS()
plot(random_fractal)

set.seed(84)
random_fractal <- randomIFS()
plot(random_fractal, colour_palette = topo.colors)

set.seed(25)
random_fractal <- randomIFS(3)
plot(random_fractal, depth = 9, colour_palette = cm.colors)

set.seed(48)
random_fractal <- randomIFS()
plot(random_fractal, colour_palette = heat.colors, reverse = FALSE)

set.seed(132)
random_fractal <- randomIFS()
plot(random_fractal, colour_palette = "lightblue")

set.seed(133)
random_fractal <- randomIFS()
plot(random_fractal, reverse = FALSE)

if (require(RColorBrewer, quietly = TRUE)) {
  greens <- function(n) {
    brewer.pal(n, "Greens")
  }
  
  set.seed(142)
  random_fractal <- randomIFS()
  print(plot(random_fractal, colour_palette = greens))
  
  
  tree_colours <- function(n) {
    colours <- colorRampPalette(c("brown", "brown2", "green"))
    colours(n)
  }
  
  set.seed(37)
  random_fractal <- randomIFS()
  print(plot(random_fractal, depth = 9, colour_palette = tree_colours))
}


