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


#' Print method for simulation results
#'
#' @param prefix_outcome character, name of the primary outcome(s). Will print
#'   comparisons for all values given.
#' @param decimals single integer, number of decimals in summary statistics and
#'   comparisons
#'
#' @rdname print
#' @export
#'
print.hrqolr_results <- function(x, decimals = 3, prefix_outcome = "primary", ...) {
	cat("# Scenario specification\n")
	print(x$args$scenario)

	cat("\n# Simulation metadata\n")
	args_to_print <- c(
		"No. simulated trials" = "n_trials",
		"Max. no. patients per batch" = "max_batch_size",
		"No. ground-truth samples" = "n_patients_ground_truth",
		"Valid range of HRQoL" = "valid_hrqol_range",
		"Significance level (alpha)" = "alpha",
		"Test function" = "test_fun",
		"Seed" = "seed"
	)

	args <- x$args[args_to_print]
	for (a in args_to_print[1:4]) {
		args[[a]] <- format(args[[a]], big.mark = ",", scientific = FALSE)
	}
	args$valid_hrqol_range <- paste0(
		"[", paste(args$valid_hrqol_range, collapse = ", "), "]"
	)
	args$test_fun <- attr(args$test_fun, "fun_name") %||% "Unknown name"

	sim_metadata <- c(
		setNames(args, names(args_to_print)),
		with(x$resource_use, list(
			"Elapsed time" = sprintf("%.1f %s", elapsed_time, attr(elapsed_time, "units")),
			"Peak memory use" = capture.output(peak_memory_use)
		))
	)
	pad_length <- max(sapply(names(sim_metadata), nchar))
	for (name in names(sim_metadata)) {
		val <- sim_metadata[[name]] %||% "NULL"
		cat("- ")
		cat(crayon_style(pad(name, pad_length), "blue"), val, "\n", sep = "   ")
	}

	cat("\n# Comparisons between arms (all patients) and select performance metrics\n")
	comparisons <- copy(x$comparisons)
	class(comparisons) <- class(comparisons)[-1] # strip hrqolr_comparisons class

	prefix_pattern <- sprintf("^%s", paste(prefix_outcome, collapse = "|"))
	comparisons <- comparisons[
		analysis == "all" & grepl(prefix_pattern, outcome),
		lapply(.SD, function(col) tryCatch(round(col, decimals), error = function(e) col)),
		.SDcols = names(comparisons)
	]

	new_col_names <- c(
		"outcome" = "Outcome",
		"comparator" = "Comparator arm",
		"target" = "Target arm",
		"mean_estimate" = "Mean difference",
		"se" = "Std. error of mean diff.",
		"relative_bias" = "Relative bias",
		"rejection_proportion" = "Rejection proportion",
		"coverage" = "Coverage"
	)
	comparisons <- transpose(
		comparisons[, mget(names(new_col_names))],
		keep.names = "statistic",
		make.names = "outcome"
	)
	comparisons[, statistic := new_col_names[statistic]]
	setnames(comparisons, "statistic", "")
	print(comparisons, row.names = FALSE)

	cat("\n# Summary statistics\n")

	cat("## All participants\n")
	summary_stats_all <- x$summary_stats[analysis == "all"]
	print(summary_stats_all[, analysis := NULL], row.names = FALSE)

	cat("\n## Survivors\n")
	summary_stats_survivors <- x$summary_stats[analysis == "survivors"]
	print(summary_stats_survivors[, analysis := NULL], row.names = FALSE)

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
	if (is.na(x)) {
		cat("Not available\n")

		return(invisible(x))
	}

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
