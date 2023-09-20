#' Find appropriate half-life of exponential decay
#'
#' The notion of this function is to find the largest half-life that yields a almost-zero decay factor (as per `tol` argument) at `grid_end`.
#'
#' @param x_diff
#' @param tol
#'
#' @return
#' @export
#'
#' @examples
#'
find_decay_halflife <- function(t_diff = 180 - 1, t_start = 0, t_end = 180, res = 0.1, tol = 0.001) {
	halflife_grid <- seq(t_start, t_end, by = res)
	decay_factor <- 2.0^(-t_diff / halflife_grid)
	max(halflife_grid[decay_factor <= tol]) %fi% t_diff
}

