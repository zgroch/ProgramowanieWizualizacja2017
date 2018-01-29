test_that("Does createIFS return error if it gets non function",{
  lin <- function(a,b,c,d,e,f){function(x,y) {c(a*x+b*y+c,d*x+e*y+f)}}
  expect_error(createIFS(lin(1,1,1,1,1,1), 3))
})
