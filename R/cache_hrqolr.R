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
cache_hrqolr <- function(max_size = 2 * 1024^3, pruning_factor = 0.5) {
	utils::assignInMyNamespace(
		".hrqolr_cache_user",
		in_memory_cache(max_size, pruning_factor)
	)
}


#' @export
#' @rdname cache_hrqolr
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
#' @param max_size number, maximum size of the cache, in bytes. If the cache
#'   exceeds this size, the entire cache is wiped; this is much faster than
#'   using an eviction policy for how the cache is used in `hrqolr` objects will
#'   be removed according to the value of the
#' @param pruning_factor number, the fraction of elements to remove from the
#'   cache when it's full.
#'
#' @importFrom utils object.size
#' @importFrom rlang as_quosure eval_tidy
#' @keywords internal
#'
#' @return A memory caching object, with class `hrqolr_memory_cache`.
#'
in_memory_cache <- function(max_size = 2 * 1024^3, pruning_factor = 0.5) {
	if (!verify_num(max_size)) {
		stop0("max_size must be a number. Use `Inf` for no limit.")
	}

	if (!verify_num(pruning_factor, min_value = 0, max_value = 1)) {
		stop0("pruning_factor must be a number between 0 and 1.")
	}

	key_idx_map_ <- fastmap::fastmap()

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
	n_pruned_ <- 0L  # The number of times the cache was reset
	last_idx_ <- 0L  # Most recent (and largest) index used

	# Methods
	reset <- function() {
		key_idx_map_$reset()
		key_ <<- vector("character")
		value_ <<- vector("list")
		size_ <<- vector("numeric")

		total_size_ <<- 0
		last_idx_ <<- 0L

		invisible(TRUE)
	}

	prune <- function() {
		to_keep <- seq_along(key_) >= (pruning_factor * length(key_))

		idx_to_keep <- unlist(key_idx_map_$mget(key_[to_keep]))
		key_ <<- key_[idx_to_keep]
		value_ <<- value_[idx_to_keep]
		size_ <<- size_[idx_to_keep]

		# We have to re-initialise the key-idx map
		key_idx_map_ <<- fastmap::fastmap()
		key_idx_map_$mset(.list = setNames(seq_along(key_), key_))

		max_total_size_ <<- max(max_total_size_, total_size_)
		total_size_ <<- sum(size_)
		last_idx_x_ <<- length(key_)
		n_pruned_ <<- n_pruned_ + 1

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

		key_[new_idx] <<- key
		value_[[new_idx]] <<- value
		size_[new_idx] <<- size

		if (total_size_ > max_size_) {
			prune()
		}

		invisible(TRUE)
	}

	keys <- function() {
		key_idx_map_$keys()
	}

	info <- function(x = NULL) {
		options <- list(
			max_size = structure(max_size_, class = "hrqolr_bytes"),
			total_size = structure(total_size_, class = "hrqolr_bytes"),
			max_total_size = structure(max(max_total_size_, total_size_), class = "hrqolr_bytes"),
			n_pruned = n_pruned_
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
			reset = reset,
			prune = prune
		),
		class = c("hrqolr_memory_cache")
	)

	return(cache)
}
