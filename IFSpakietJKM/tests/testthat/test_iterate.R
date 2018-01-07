test_that("Wrong argument",{
  expect_error(iterate())
  expect_error(iterate(NULL,matrix(c(0.5, 0.3, 0.4, 0.2), nrow=2, ncol=2)))
  expect_error(iterate(list(function(x){list(x[1],x[2])})))
})

test_that("The result is not a matrix",{
  expect_true(is.matrix(iterate(list(function(x){list(x[1],x[2])}, function(x){list(x[2],x[1])}), matrix(c(0.5, 0.3, 0.4, 0.2), nrow=2, ncol=2))))
})
