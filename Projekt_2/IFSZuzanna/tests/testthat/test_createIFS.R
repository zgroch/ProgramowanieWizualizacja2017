
test_that("Check we have errors when calling with not a list ",{
  simple <- function(point) { 0 }
  expect_error(createIFS(simple))
})


test_that("Check we have errors when calling empty",{
  expect_error(createIFS())
})


test_that("Check we have errors when calling with no functions ",{
  expect_error(createIFS(list(1)))
})


test_that("Check we have error on drawing function not returning coordinates",{
  simple <- function(point) { 1 }
  expect_error(createIFS(list(simple)))
})


test_that("Check we have error on drawing function returning strings",{
  simple <- function(point) { c("ala", "ma") }
  expect_error(createIFS(list(simple)))
})
