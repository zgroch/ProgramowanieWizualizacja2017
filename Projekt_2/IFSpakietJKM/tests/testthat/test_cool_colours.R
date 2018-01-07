test_that("invalid number of parameters", {
  expect_error(cool_colours())
  expect_error(cool_colours(3))
  expect_error(cool_colours(d=3))
})

test_that("invalid length of a vector", {
  expect_equal(length(cool_colours(3,4)), 3^4)
})