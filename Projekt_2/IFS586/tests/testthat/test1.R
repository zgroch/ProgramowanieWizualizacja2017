test_that("Argument must be object of IFS_S3 class",{
  arg <- c(2,7)
  expect_error(plot.IFS_S3(arg, n=2))
})

test_that("An invalid number of parameters",{
  expect_error(createIFS(trian1, prob_vec = trianp))
})

test_that("Result is object of IFS_S3 class",{
  expect_true(class(sierpinski_triangle) == "IFS_S3")
})

test_that("An invalid number of parameters2",{
  expect_error(createIFS(trian1, trian1, prob_vec = trianp))
})

test_that('Probability sum up to 1', {
  trianp <- c(0,0.5,0.2)
  expect_error(createIFS(trian1, trian2,trian3, prob_vec = trianp))
})
