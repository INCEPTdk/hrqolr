test_that("C++ linear approximation works", {
    x <- 1:10
    y <- c(1, 3, 2, 5, 1, 2, 1, 4, 4, 5)
    expect_identical(linear_approx(x, y, xout = 4.5), 3)

    # No checks of same length (so, invalid input)
    expect_identical(linear_approx(x, c(y, NA), xout = 4.5), 3)
    expect_identical(linear_approx(x, c(y, 10), xout = 4.5), 3)

    y <- c(1, 3, 2, 5, NA, 2, 1, 4, 4, 5)
    expect_true(is.na(linear_approx(x, y, xout = 4.5)))
})
