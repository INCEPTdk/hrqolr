#' Stuff to make Rcpp work (to put the right instructions in the NAMESPACE file)
#'
#' @importFrom Rcpp evalCpp
#' @useDynLib hrqolr, .registration=TRUE
#' @noRd
#'
NULL


# Save package version
.hrqolr_version <- as.character(packageVersion("hrqolr"))

# Helper to identify hrqolr functions that the user can choose to cache
.user_cacheable_functions <- c(
	"compute_estimates",
	"construct_final_trajectories",
	"construct_patient_trajectory"
)

# Set up cache environment
#
# This way, the user need to opt in to use caching and can specify the cache settings. That more
# tricky if cache is set up while loading the package.
#
.cache_env <- new.env(parent = emptyenv())


#' Print package startup message
#'
#' @param libname not used.
#' @param pkgname not used.
#'
#' @return NULL
#'
#' @importFrom utils packageVersion
#'
#' @keywords internal
#' @noRd
#'
.onAttach <- function(libname, pkgname) {
	packageStartupMessage(
		"Loading 'hrqolr' package v", .hrqolr_version, ".\n",
		"For help, run 'help(\"hrqolr\")' or check out https://inceptdk.github.io/hrqolr/.\n",
		"Consider running 'cache_hrqolr()' for faster simulations. If you have enough RAM, \n",
		"increasing the cache size might speed up things even more; run '?cache_hrqolr' for details."
	)
}


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
			"p_value", "id", "trial_id", "bootstrap_mean_diffs", "x", "y", "hi", "lo", "analysis",
			"outcome", "value"
		))
	}

	# Setting up cache (as per "Details" in ?memoise::memoise)
	shared_cache <- cachem::cache_mem(
		max_size = 256 * 1024^2, # MBs
		evict = "lru"
	)
	custom_memoise <- function(fun) {
		memoise::memoise(fun, cache = shared_cache)
	}

	# These functions will always be cached
	compute_eof <<- custom_memoise(compute_eof)
	construct_arm_level_trajectory <<- custom_memoise(construct_arm_level_trajectory)
	create_smooth_trajectory <<- custom_memoise(create_smooth_trajectory)
	create_xout <<- custom_memoise(create_xout)
	generate_mortality_funs <<- custom_memoise(generate_mortality_funs)
	find_decay_halflife <<- custom_memoise(find_decay_halflife)

	cache_hrqolr(1 * 1024^3) # TODO: remove before deploying
}
