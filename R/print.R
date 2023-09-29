### Needed for manual to show up when running ?print ###

#' Print methods for HRQoL results
#'
#' Prints contents of the first input `x` in a human-friendly way, see
#' **Details** for more information.
#'
#' @param x object to print, see **Details**.
#' @param prop_digits single integer (default is `3`), the number of digits used
#'   when printing proportions.
#' @param ... passed on to methods
#'
#' @details The behaviour depends on the class of `x`:
#'
#' @return Invisibly returns `x`.
#' @name print
NULL


#' Print method for example trajectories
#'
#' @describeIn print Example trajectories
#' @export
#'
print.hrqolr_examples <- function(x, prop_digits = 3, ...) {
	print(x, digits = prop_digits)
}
