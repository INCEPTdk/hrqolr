# Stuff to make Rcpp work (to put the right instructions in the NAMESPACE file)
#' @importFrom Rcpp evalCpp
#' @useDynLib hrqolr, .registration=TRUE

.onLoad <- function(libname, pkgname) {
	# as per "Details" in ?memoise::memoise

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
	# fast_approx <<- custom_memoise(fast_approx)
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
