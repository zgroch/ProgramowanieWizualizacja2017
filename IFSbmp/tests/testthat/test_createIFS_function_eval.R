test_that("Does createIFS return proper evaluations of its elements",{
  lin3 <- function(a,b) {function(x,y){c(1/3*x+a/3,1/3*y+b/3)}}
  expect_equal(createIFS(lin3(1,2),lin3(2,1))[[2]](4,2),c(2,1))
})
