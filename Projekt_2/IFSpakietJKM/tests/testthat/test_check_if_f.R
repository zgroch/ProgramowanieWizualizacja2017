test_that("invalid class of an argument", {
  expect_error(check_if_f())
  expect_error(check_if_f(c(1,1)))
  expect_error(check_if_f(list("abc")))
  expect_error(check_if_f(list(function(x){x}, 1)))
})

test_that("invalid domain or set of values", {
  expect_error(check_if_f(list(function(x){x[1]})))
  expect_error(check_if_f(list(function(){cat("abc")})))
})

test_that("is from R^2 to R^2", {
  expect_true(is.null(check_if_f(list(function(x){x}, function(x){c(1,1)}))))
})
