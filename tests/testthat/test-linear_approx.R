test_that("C++ linear approximation works", {
    x <- 1:10
    y <- c(1, 3, 2, 5, 1, 2, 1, 4, 4, 5)
    expect_identical(hrqolr_approx(x, y, xout = 4.5), 3)
})
