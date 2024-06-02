#' Stuff to make C work (to put the right instructions in the NAMESPACE file)
#'
#' @noRd
#' @useDynLib hrqolr, .registration=TRUE, .fixes="C_"
NULL


# Save package version
.hrqolr_version <- as.character(packageVersion("hrqolr"))

# Set up cache environment
#
# This way, the user need to opt in to use caching and can specify the cache settings. That is more
# tricky if cache is set up while loading the package. By default, the cache is 2 GB, which is
# probably enough for most uses; at least, it was enough for simulating 100k trials with N = 4000.
# If not, the user should increase it.
#
.hrqolr_cache_user <- cachem::cache_mem(
	max_size = 2 * 1024^3,
)


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
		"For help, run 'help(\"hrqolr\")' or check out https://inceptdk.github.io/hrqolr."
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
			".", "actv", "arm", "ci_hi", "ci_lo", "ctrl", "est", "mean_diff",
			"n_patients_with_type", "p_value", "id", "trial_id",
			"bootstrap_mean_diffs", "x", "y", "hi", "lo", "analysis", "outcome",
			"value", "mean_ground_truth", "..outcome_cols", "patient_id", "statistic"
		))
	}

	cache_hrqolr()
}
