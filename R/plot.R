### Needed for manual to show up when running ?plot ###

#' Plotting methods for HRQoL results
#'
#' @param x object to plot, see *Details*.
#' @param ... passed on to methods
#'
#' @return A ggplot2 object.
#'
#' @name plot
#' @return A `ggplot`.
#'
NULL



#' Plot method for example trajectories
#'
#' @param which character, one of `"both"` (arm and patient trajectories, the default), `"arm"`
#'   (only arm trajectories), `"patient"` (only patient trajectories) and `"summarise"` (arm
#'   trajectories with ribbons summarising the patient trajectories).
#' @param arm_aes,patient_aes,ribbon_aes lists with additional settings for the arm, patients and
#'   ribbon layers.
#' @param ribbon_percentiles scalar of two elements defining the lower and upper percentiles of band
#'   drawn to summarise patient trajectories
#'
#' @describeIn plot Example trajectories
#' @importFrom stats quantile
#' @export
#'
plot.hrqolr_trajectories <- function(
		x,
		which = "both",
		arm_aes = NULL,
		patient_aes = list(alpha = 0.2),
		ribbon_aes = list(alpha = 0.2),
		ribbon_percentiles = c(0.25, 0.75),
		...
) {
	assert_pkgs("ggplot2")

	arm_layer <- do.call(
		ggplot2::geom_line,
		c(list(ggplot2::aes(x, y, colour = arm), x$arm_level), arm_aes)
	)

	patient_layer <- do.call(
		ggplot2::geom_line,
		c(
			list(ggplot2::aes(x, y, colour = arm, group = id), x$patient_level, na.rm = TRUE),
			patient_aes
		)
	)

	p_base <- ggplot2::ggplot() +
		ggplot2::labs(x = "Time (days)", y = "HRQoL") +
		ggplot2::theme(legend.title = ggplot2::element_blank())

	if (which == "arm") {
		p_base + arm_layer
	} else if (which == "patient") {
		p_base + patient_layer
	} else if (which == "summarise") {
		ids_with_nas <- x$patient_level[is.na(y)]$id
		ribbon_dt <- x$patient_level[
			!id %in% ids_with_nas,
			.(x = seq(min(x), max(x)), y = hrqolr_approx(x, y, seq(min(x), max(x)))),
			by = c("arm", "id")
		][
			,
			.(lo = quantile(y, ribbon_percentiles[1]), hi = quantile(y, ribbon_percentiles[2])),
			by = c("arm", "x")
		]

		ribbon_layer <- do.call(
			ggplot2::geom_ribbon,
			c(list(ggplot2::aes(x, ymin = lo, ymax = hi, fill = arm), ribbon_dt), ribbon_aes)
		)

		p_base +
			ribbon_layer +
			arm_layer
	} else {
		p_base +
			patient_layer +
			arm_layer
	}
}
