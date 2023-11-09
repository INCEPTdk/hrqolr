#' Interpolate multiple values
#'
#' Stripped-down version of [stats::approx()]. The underlying C code is exactly the same but included in
#' `hrqolr` as it's unexported from the `stats` package.
#'
#' @inheritParams stats::approx
#'
#' @keywords internal
#' @return Interpolated values
#'
hrqolr_approx <- function(x, y, xout, yleft = -Inf, yright = Inf, method = 1, f = 0) {
	x <- as.double(x)
	y <- as.double(y)
	.Call(C_approx, x, y, xout, method, yleft, yright, f)
}
