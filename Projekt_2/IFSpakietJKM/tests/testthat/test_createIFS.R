test_that("result is of class IFS", {
  expect_equal(class(createIFS(list(function(x){x}))), "IFS")
})

test_that("invalid class of an argument", {
  expect_error(createIFS())
  expect_error(createIFS(c(1,1)))
  expect_error(createIFS(list("abc")))
  expect_error(createIFS(list(function(x){x}, 1)))
})