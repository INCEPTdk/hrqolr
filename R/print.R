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
#' @rdname print
#' @export
#'
print.hrqolr_examples <- function(x, prop_digits = 3, ...) {
	print(x, digits = prop_digits)
	invisible(x)
}


#' Print method for results from validation of scenario specification
#'
#' @rdname print
#' @export
#'
print.hrqolr_scenario_validation_results <- function(x, ...) {
	pad_length_names <- max(sapply(names(x), nchar))
	pad_length_colours <- max(sapply(x, function(.) nchar(.["result"])))
	res_colours <- c("valid as is" = "green", modified = "yellow", invalid = "red")

	for (arg_name in names(x)) {
		res <- x[[arg_name]]["result"]
		cat(
			pad(arg_name, pad_length_names),
			crayon_style(pad(res, pad_length_colours), res_colours[res]),
			x[[arg_name]]["comment"],
			"\n",
			sep = "   "
		)
	}

	invisible(x)
}


#' Print method for scenario
#'
#' @rdname print
#' @export
#'
print.hrqolr_scenario <- function(x, ...) {
	col_widths <- 3 + c(
		max(nchar(names(x))),
		pmax(
			sapply(x$arms, function(a) max(nchar(sapply(x, function(.) .[a])), na.rm = TRUE)),
			nchar(x$arms)
		)
	)

	for (param in names(x)) {
		cat(crayon_style(pad(param, col_widths[1]), "blue"))
		for (arm in names(x[[param]])) {
			cat(pad(x[[param]][[arm]], col_widths[arm], side = "left"))
		}
		cat("\n")
	}

	invisible(x)
}


#' Print method for hrqolr comparison results
#'
#' @param n_digits int, number of digits to show in decimal numbers
#' @rdname print
#' @export
#'
print.hrqolr_comparisons <- function(x, n_digits = 3, ...) {
	x_tmp <- x
	class(x_tmp) <- class(x_tmp)[-1] # strip hrqolr_comparisons class

	x_tmp <- x_tmp[
		,
		lapply(.SD, function(col) tryCatch(round(col, n_digits), error = function(e) col)),
		.SDcols = names(x_tmp)
	]

	print(data.table::transpose(x_tmp, keep.names = "statistic", make.names = "outcome"))

	invisible(x)
}


#' Print method for hrqolr summary statistics
#'
#' @param n_digits int, number of digits to show in decimal numbers
#' @rdname print
#' @export
#'
print.hrqolr_summary_stats <- function(x, n_digits = 3, ...) {
	x_tmp <- x
	class(x_tmp) <- class(x_tmp)[-1] # strip hrqolr_comparisons class

	print(x_tmp[
		,
		lapply(.SD, function(col) tryCatch(round(col, n_digits), error = function(e) col)),
		.SDcols = names(x_tmp)
	])

	invisible(x)
}


#' Print method for bytes
#'
#' Logic from pryr:::print.pryr_bytes but simplified and included here to mimise dependencies.
#'
#' @param n_digits int, number of digits to show in decimal numbers
#' @export
#' @rdname print
#'
print.hrqolr_bytes <- function (x, digits = 3, ...) {
	power <- min(floor(log(abs(x), 1000)), 4)
	unit <- c("B", "kB", "MB", "GB", "TB")[[power + 1]]

	formatted <- format(
		signif(x / (1000^power), digits = digits),
		big.mark = ",",
		scientific = FALSE
	)

	cat(formatted, " ", unit, "\n", sep = "")

	invisible(x)
}
