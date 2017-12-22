test_that("Test we are getting proper points for single function",{
  simple <- function(point) {
    x<- point[1]
    y<- point[2]
    c(x + 1, y - 1)
  }
  fractal <- createIFS(list(simple))
  points <- getPoints(fractal, c(0, 0), 2)
  x_points <- as.list(points)$X
  expected_x_points <- c(0, 1, 2)
  expect_true(all(x_points == expected_x_points))

  y_points <- as.list(points)$Y
  expected_y_points <- c(0, -1, -2)
  expect_true(all(y_points == expected_y_points))
})


test_that("Test we are getting proper points for two functions",{
  inc_x <- function(point) {
    x<- point[1]
    y<- point[2]
    c(x + 1, y)
  }
  inc_y <- function(point) {
    x<- point[1]
    y<- point[2]
    c(x, y + 1)
  }
  fractal <- createIFS(list(inc_x, inc_y))
  points <- getPoints(fractal, c(0, 0), 2)
  x_points <- as.list(points)$X
  expected_x_points <- c(0, 1, 2, 1, 0, 1, 0)
  expect_true(all(x_points == expected_x_points))

  y_points <- as.list(points)$Y
  expected_y_points <- c(0, 0, 0, 1, 1, 1, 2)
  expect_true(all(y_points == expected_y_points))
})

