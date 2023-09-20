#' Stuff to make Rcpp work (to put the right instructions in the NAMESPACE file)
#'
#' @importFrom Rcpp evalCpp
#' @useDynLib hrqolr, .registration=TRUE
#' @noRd
#'
NULL

#' Stuff to do when package is loaded
#'
#' @param libname not used.
#' @param pkgname not used.
#'
#' @keywords internal
#' @noRd
#'
.onLoad <- function(libname, pkgname) {
	# Handles "Undefined global functions or variables" after R CMD check in functions using
	# non-standard evaluation. See [https://stackoverflow.com/a/12429344].
	if (getRversion() >= "2.15.1") {
		utils::globalVariables(c(
			".", "actv", "arm", "ci_hi", "ci_lo", "ctrl", "est", "mean_diff", "n_patients_with_type",
			"p_value"
		))
	}

	# Setting up cache (as per "Details" in ?memoise::memoise)
	shared_cache <- cachem::cache_mem(
		max_size = 7 * 1024^3, # GBs
		# max_age = 60,
		# logfile = "internal/memoise.log",
		evict = "lru"
	)
	custom_memoise <- function(fun) {
		memoise::memoise(fun, cache = shared_cache)
	}

	# These are commented out as memoising them seems to hurt performance quite a lot
	# auc <<- custom_memoise(auc)
	# compute_hosp_discharge <<- custom_memoise(compute_hosp_discharge)
	# linear_approx <<- custom_memoise(linear_approx)
	# na_matrix <<- custom_memoise(na_matrix)

	compute_eof <<- custom_memoise(compute_eof)
	compute_estimates <<- custom_memoise(compute_estimates)
	construct_arm_level_trajectory <<- custom_memoise(construct_arm_level_trajectory)
	construct_final_trajectories <<- custom_memoise(construct_final_trajectories)
	construct_patient_trajectory <<- custom_memoise(construct_patient_trajectory)
	create_smooth_trajectory <<- custom_memoise(create_smooth_trajectory)
	create_xout <<- custom_memoise(create_xout)
	find_decay_halflife <<- custom_memoise(find_decay_halflife)
	generate_mortality_funs <<- custom_memoise(generate_mortality_funs)
}
