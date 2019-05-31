test_that("createIFS_from_coefficients creates object of class IFS", {
  matrix <- matrix(c(1:16), ncol=4)
  IFS <- createIFS_from_coefficients(matrix)
  expect_equal("IFS", class(IFS))
})

test_that("Barnsley Fern is correctly created from coefficients", {
  matrix_of_coefficients <- matrix(c(
    0.00,  0.00,  0.00, 0.16, 0, 0.00,
    0.85,  0.04, -0.04, 0.85, 0, 1.60,
    0.20, -0.26,  0.23, 0.22, 0, 1.60,
    -0.15,  0.28,  0.26, 0.24, 0, 0.44
  ), ncol = 6, byrow = TRUE)
  fractal <- createIFS_from_coefficients(matrix_of_coefficients)
  expect_equal(barnsley_fern, fractal)
})
