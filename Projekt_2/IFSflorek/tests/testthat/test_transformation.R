test_that("transformation returns two element vector", {
  result <- transformation(1, 2, 3, 4, 5, 6, 7)
  expect_true(length(result) == 2)
})

test_that("transformation gives correct result", {
  result <- transformation(c(1,1), 2, 3, 4, 5, 6, 7)
  expect_equal(result, c(11, 16))
})
