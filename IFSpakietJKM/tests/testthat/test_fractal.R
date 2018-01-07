test_that("invalid number of parameters", {
  expect_error(fractal())
  expect_error(fractal(c(1,1)))
  expect_error(fractal(list("abc")))
})

test_that("invalid class of f", {
  expect_error(fractal(c(1,1), 2))
  expect_error(fractal(list("abc"), 2))
  expect_error(fractal(list(function(x){x}, 1), 3))
})

test_that("invalid class of d", {
  expect_error(fractal(list(function(x){x}), "a"))
  expect_warning(fractal(list(function(x){x}), d=c(1,1)))
})

test_that("returns matrix 2 x n^d", {
  expect_equal(nrow(fractal(list(function(x){c(x[1],x[2])}, function(x){c(x[2],x[1])}), d=4)), 2)
  expect_equal(ncol(fractal(list(function(x){c(x[1],x[2])}, function(x){c(x[2],x[1])}), d=4)), 2^4)
})
