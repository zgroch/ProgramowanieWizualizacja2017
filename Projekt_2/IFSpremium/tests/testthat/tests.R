test_that("Result is an IFS",{
  expect_true(is(createIFS(SierpinskiTriangle), "IFS"))
})

test_that("Result is an IFS",{
  expect_true(is(createIFS(KochCurve), "IFS"))
})

test_that("Result is not an IFS",{
  expect_false(is(SierpinskiTriangle, "IFS"))
})

test_that("An invalid number of parameters",{
  expect_error(createIFS())
})

test_that("Wrong type of parameters",{
  expect_error(createIFS(1))
})

test_that("An invalid number of parameters",{
  expect_error(createIFS(SierpinskiCarpet, SierpinskiPentagon))
})

test_that("Results are correct",{
  expect_equal(length(createPoints(SierpinskiTriangle, 5)),
               3^5+3^4+3^3+3^2+3+1)
})

test_that("Results are correct",{
  expect_equal(length(colorPoints(3, 5)),
               length(createPoints(SierpinskiPentagon, 3)))
})
