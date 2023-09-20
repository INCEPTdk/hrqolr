#' Find appropriate half-life of exponential decay
#'
#' The notion of this function is to find the largest half-life that yields a almost-zero decay factor (as per `tol` argument) at `grid_end`.
#'
#' @param t_diff int, the span in days that the decay should span
#' @param min_halflife,max_halflife integers, shortest and longets half lives to consider
#' @param res scalar numeric, grid size in half-life values to be checked
#' @param tol scalar, low number reflecting the tolerance for find
#'
#' @keywords internal
#' @return The best half-life
#'
find_decay_halflife <- function(
		t_diff = 180 - 1,
		min_halflife = 0,
		max_halflife = 180,
		res = 0.1,
		tol = 0.001
) {
	# TODO: Perhaps this could be replaced by simpler logic akin to: we arrive at 0 after 5-6 half-lives
	halflife_grid <- seq(min_halflife, max_halflife, by = res)
	decay_factor <- 2.0^(-t_diff / halflife_grid)
	max(halflife_grid[decay_factor <= tol]) %fi% t_diff / 5
}

