
test_that("Check we don't have errors on function returning coordinates",{
  simple <- function(point) {
    c(1, 1)
  }
  fraktal <- createIFS(list(simple))
  plot(fraktal, 10, 'green')
  expect_true(TRUE)
})
