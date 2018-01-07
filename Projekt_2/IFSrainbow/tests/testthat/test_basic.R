library(IFSrainbow)
library(dplyr)

test_that("createIFS for functions is the same as for the list of them", {
    expect_identical( createIFS( sin, cos ), createIFS( list(sin,cos) ) )
})

IFSpoints <- generateIFS(sierpinski, 10, 2)
test_that("generateIFS give a list with proper names", {
    expect_equal( names(IFSpoints), c("points", "paths") )
})


F1 <- function(p){
    return( c(
        p[1]/2 + p[2]/2 - 1,
        -p[1]/2 + p[2]/2
    ) )
}
F2 <- function(p){
    return( c(
        -p[1]/2 + p[2]/2,
        -(p[1]/2 + p[2]/2 - 1)
    ) )
}

first_result <- generateIFSgif(c(0,0),8,list(F1,F2)) %>%
    arrange(x,y)
second_result <- generateIFSgif(c(0,0),8,list(F2,F1)) %>%
    arrange(x,y)

test_that("changing the order of the function changes the order of the result", {
    expect_identical(first_result,second_result)
})
