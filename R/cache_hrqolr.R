#' Caching of hrqolr functions
#'
#' TODO: Later on, we may implement our own memoisation logic that is lighter than that of
#' `memoise`.
#'
#' @inheritParams cachem::cache_mem
#'
#' @rdname cache_hrqolr
#'
#' @return NULL, these functions are called for their side effects: caching (or clearing caches) of
#'   select `hrqolr` functions.
#' @export
#' @importFrom utils assignInMyNamespace
#'
cache_hrqolr <- function(
		max_size = 1 * 1024^3,
		max_age = Inf,
		max_n = Inf,
		logfile = NULL,
		evict = "lru"
) {
	called_args <- as.list(match.call())[-1]
	default_args <- formals()
	default_args <- default_args[setdiff(names(default_args), names(called_args))]
	args <- c(
		lapply(called_args, eval, parent.frame()),
		lapply(default_args, eval, envir = environment())
	)
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


#' Remove caches
#'
#' @export
#' @rdname cache_hrqolr
#'
remove_hrqolr_cache <- function() {
	for (fun_name in .user_cacheable_functions) {
		memoise::drop_cache(get(fun_name))
	}
	gc()
}
