#' Caching of hrqolr functions
#'
#' @inheritParams in_memory_cache
#' @rdname cache_hrqolr
#'
#' @return `NULL`, these functions are called for their side effects: caching (or clearing caches) of
#'   select `hrqolr` functions.
#' @export
#' @importFrom utils assignInMyNamespace
#'
cache_hrqolr <- function(max_size = 2 * 1024^3) {
	utils::assignInMyNamespace(".hrqolr_cache_user", in_memory_cache(max_size))
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


#' Create an in-memory cache
#'
#' Very much inspired by `cachem::cache_mem` but stripped down to avoid unneeded
#' overhead due to housekeeping as this is an internal function that users
#' should never use.
#'
#' @param max_size Maximum size of the cache, in bytes. If the cache exceeds
#'   this size, the entire cache is wiped; this is much faster than using an
#'   eviction policy for how the cache is used in `hrqolr` objects will be
#'   removed according to the value of the
#'
#' @importFrom utils object.size
#' @importFrom rlang as_quosure eval_tidy
#' @keywords internal
#'
#' @return A memory caching object, with class `hrqolr_memory_cache`.
#'
in_memory_cache <- function(max_size = 2 * 1024^3) {
	if (!verify_num(max_size)) {
		stop0("max_size must be a number. Use `Inf` for no limit.")
	}

	key_idx_map_  <- fastmap::fastmap()

	# These values are set in the reset() method.
	key_ <- NULL
	value_ <- NULL
	size_ <- NULL

	# Internal constant metadata
	max_size_ <- max_size
	initial_size <- 64L
	prune_by_size <- is.finite(max_size_)

	# Internal dynamic metadata
	total_size_ <- 0  # Total number of bytes used
	max_total_size_ <- 0  # The largest cache size in bytes, can be useful if pruned
	last_idx_ <- 0L  # Most recent (and largest) index used

	# Methods
	reset <- function() {
		key_idx_map_$reset()
		key_ <<- rep_len(NA_character_, initial_size)
		value_ <<- vector("list", initial_size)
		size_ <<- rep_len(NA_real_, initial_size)

		# Update before resetting
		max_total_size_ <<- max(max_total_size_, total_size_)

		total_size_ <<- 0
		last_idx_ <<- 0L
		invisible(TRUE)
	}

	get <- function(key) {
		idx <- key_idx_map_$get(key)

		if (is.null(idx)) {
			return(fastmap::key_missing())
		}

		value_[[idx]]
	}

	set <- function(key, value) {
		if (prune_by_size) {
			size <- as.numeric(object.size(value))  # imperfect, see ?object.size

			if ((total_size_ + size) > max_size_) {
				reset()
			}

			total_size_ <<- total_size_ + size
		} else {
			size <- NA_real_
		}

		old_idx <- key_idx_map_$get(key)

		if (!is.null(old_idx)) {
			if (prune_by_size) {
				total_size_ <<- total_size_ - size_[old_idx]
			}

			new_idx <- old_idx
		} else {
			last_idx_ <<- last_idx_ + 1L
			key_idx_map_$set(key, last_idx_)
			new_idx <- last_idx_
		}

		key_  [new_idx]   <<- key
		value_[[new_idx]] <<- value
		size_ [new_idx]   <<- size

		invisible(TRUE)
	}

	keys <- function() {
		key_idx_map_$keys()
	}

	info <- function(x = NULL) {
		options <- lapply(
			list(
				max_size = max_size_,
				total_size = total_size_,
				max_total_size = max(max_total_size_, total_size_)
			),
			function(o) structure(o, class = c("hrqolr_bytes", class(o)))
		)

		if (is.null(x)) {
			return(options)
		}
		else if (length(x) == 1) {
			return(options[[x]])
		} else {
			return(options[x])
		}
	}

	reset() # set defaults before returning cache object below

	cache <- structure(
		list(
			get = get,
			set = set,
			keys = keys,
			info = info,
			reset = reset
		),
		class = c("hrqolr_memory_cache")
	)

	return(cache)
}
