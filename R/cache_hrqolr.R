#' Caching of hrqolr functions
#'
#' TODO: Later on, we may implement our own memoisation logic that is lighter than that of
#' `memoise`.
#'
#' @inheritParams cachem::cache_mem
#'
#' @rdname cache_hrqolr
#' @return NULL, these functions are called for their side effects: caching (or clearing caches) of
#'   select `hrqolr` functions.
#' @export
#'
cache_hrqolr <- function(
		max_size = 1 * 1024^3,
		max_age = Inf,
		max_n = Inf,
		logfile = NULL,
		evict = "lru"
) {
	args <- formals()
	called_args <- match.call()[-1]
	args[names(called_args)] <- called_args
	.cache_env[["shared_cache"]] <- do.call(cachem::cache_mem, args)

	for (fun_name in .user_cacheable_functions) {
		assignInMyNamespace(
			fun_name,
			memoise::memoise(get(fun_name), cache = .cache_env$shared_cache)
		)
	}
}


#' Caching hrqolr functions
#'
#' @export
#' @rdname cache_hrqolr
#'
clear_hrqolr_cache <- function() {
	for (fun_name in .user_cacheable_functions) {
		memoise::forget(get(fun_name))
	}
	gc()
}
