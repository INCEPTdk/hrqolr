#' Caching of hrqolr functions
#'
#' @inheritParams cachem::cache_mem
#'
#' @rdname cache_hrqolr
#'
#' @return `NULL`, these functions are called for their side effects: caching (or clearing caches) of
#'   select `hrqolr` functions.
#' @export
#' @importFrom utils assignInMyNamespace
#'
cache_hrqolr <- function(
		max_size = 2 * 1024^3,
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

	utils::assignInMyNamespace(".hrqolr_cache_user", do.call(cachem::cache_mem, args))
}


#' Caching hrqolr functions
#'
#' @export
#' @rdname cache_hrqolr
#' @return Nothing, used for its side effect
#'
clear_hrqolr_cache <- function() {
	.hrqolr_cache_user$reset()
}
