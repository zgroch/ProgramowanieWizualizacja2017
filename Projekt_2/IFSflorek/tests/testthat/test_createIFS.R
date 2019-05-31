test_that("createIFS creates object of class IFS", {
  IFS <- createIFS(function(x, y) c(x, y))
  expect_equal("IFS", class(IFS))
})

test_that("List of functions has proper length", {
  IFS <- createIFS(function(x, y) c(x, y),
                   function(x,y) c(x/2, y/2))
  expect_equal(2, length(IFS))
})
