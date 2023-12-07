### Needed for manual to show up when running ?print ###

#' Print methods for HRQoL results
#'
#' Prints contents of the first input `x` in a human-friendly way, see
#' **Details** for more information.
#'
#' @inheritParams base::print.default
#' @param decimals single integer (default is `3`), the number of digits
#' @param prop_decimals single integer (default is `3`), the number of digits used
#'   when printing proportions.
#' @param ... not used
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
print.hrqolr_trajectories <- function(x, prop_decimals = 3, ...) {
	print.default(x, digits = prop_decimals)
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
	colours <- c("valid as is" = "green", "expanded to" = "yellow", invalid = "red")

	cat("Scenario-parameter validation:\n")
	for (arg_name in names(x)) {
		res <- x[[arg_name]]["result"]
		cat("- ")
		cat(
			pad(arg_name, pad_length_names),
			crayon_style(pad(res, pad_length_colours), colours[res]),
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
		cat("- ")
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
#' @rdname print
#' @import data.table
#' @export
#'
print.hrqolr_comparisons <- function(x, decimals = 3, ...) {
	x_tmp <- copy(x)
	class(x_tmp) <- class(x_tmp)[-1] # strip hrqolr_comparisons class
	cols_in_order <- c("outcome", "comparator", "target", "analysis")
	setcolorder(x_tmp, intersect(names(x), cols_in_order))
		# in case e.g. analysis columns has already been removed

	x_tmp <- x_tmp[
		,
		lapply(.SD, function(col) tryCatch(round(col, decimals), error = function(e) col)),
		.SDcols = names(x_tmp)
	]

	print(transpose(x_tmp, keep.names = "statistic", make.names = "outcome"), ...)

	invisible(x)
}


#' Print method for hrqolr summary statistics
#'
#' @rdname print
#' @export
#'
print.hrqolr_summary_stats <- function(x, decimals = 3, ...) {
	x_tmp <- x
	class(x_tmp) <- class(x_tmp)[-1] # strip hrqolr_comparisons class

	print(
		x_tmp[
		,
		lapply(.SD, function(col) tryCatch(round(col, decimals), error = function(e) col)),
		.SDcols = names(x_tmp)
		],
		...
	)

	invisible(x)
}


#' Print method for bytes
#'
#' Logic from `pryr:::print.pryr_bytes` but simplified and included here to minimise dependencies.
#'
#' @export
#' @rdname print
#'
print.hrqolr_bytes <- function (x, digits = 3, ...) {
	power <- min(floor(log(abs(x), 1000)), 4) %fi% 0
	unit <- c("B", "kB", "MB", "GB", "TB")[[power + 1]]

	formatted <- format(
		signif(x / (1000^power), digits = digits),
		big.mark = ",",
		scientific = FALSE
	)

	cat(formatted, " ", unit, "\n", sep = "")

	invisible(x)
}
