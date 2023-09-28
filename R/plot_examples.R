#' Plot example trajectories
#'
#' @param object object of class `hrqolr_results` as returned by `simulate_trial`
#' @param ... passed on to methods
#'
#' @export
#'
plot_results <- function(object, ...) {
	UseMethod("plot_results")
}

#' Actual function
#'
#' @rdname plot_results
#'
plot_examples.hrqolr_results <- function(object, ...) {

}
