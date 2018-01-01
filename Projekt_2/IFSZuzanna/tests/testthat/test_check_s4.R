
test_that("Check if createIFS function create S4 Object",{
  simple <- function(point) {
    c(0, 0)
  }
  fraktal <- createIFS(list(simple))
  expect_equal(typeof(fraktal), "S4")
})
