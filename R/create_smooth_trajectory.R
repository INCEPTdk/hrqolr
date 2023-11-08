#' Create smooth trajectory
#'
#' Default settings create a centripetal Catmull-Rom curve with the coordinates given by `x` and
#' `y`.
#'
#' @param x,y numeric vectors with points to be connected with smooth curve
#' @param alpha single numerical value in `[0, 1]`, controls the tightness of the curve. `alpha = 0.5` (the default)
#'   yields a centripetal Catmull-Rom curve
#' @param epsilon single numerical value, used to create phantom points. The default value should suffice for
#'   most use cases (see also link below).
#'
#' @details This function is based on the nice run-down of smooth curves at
#' https://apoorvaj.io/cubic-bezier-through-four-points.
#'
#' @importFrom Hmisc bezier
#' @importFrom stats dist
#'
#' @return A data.table with the (x, y) coordinates of the smooth trajectory.
#' @export
#'
create_smooth_trajectory <- function(x, y, alpha = 0.5, epsilon = 1e-4) {
	hash <- rlang::hash(c("create_smooth_trajectory", x, y, alpha, epsilon))  #### AG: Don't we need to assert availability of rlang (currently in suggests)?
	out <- .hrqolr_cache_user$get(hash)

	if (!cachem::is.key_missing(out)) {
		return(out)
	}

	stopifnot(length(x) == length(y))

	n_points <- length(x)
	res <- list()

	for (i in seq_len(n_points - 1)) {
		p1 <- c(x[i], y[i])
		p2 <- c(x[i+1], y[i+1])
		p0 <- if (i == 1) p1 + (p1 - p2) * epsilon else c(x[i-1], y[i-1])
		p3 <- if (i == n_points - 1) p2 + (p2 - p1) * epsilon else c(x[i+2], y[i+2])

		d1 <- dist(rbind(p1, p0))^alpha
		d2 <- dist(rbind(p2, p1))^alpha
		d3 <- dist(rbind(p3, p2))^alpha

		T1 <- (d1^2 * p2 - d2^2 * p0 + (2 * d1^2 + 3 * d1 * d2 + d2^2) * p1)/(3 * d1 * (d1 + d2))
		T2 <- (d3^2 * p1 - d2^2 * p3 + (2 * d3^2 + 3 * d3 * d2 + d2^2) * p2)/(3 * d3 * (d3 + d2))

		points <- rbind(p1, T1, T2, p2)

		res[[i]] <- Hmisc::bezier(points[, 1], points[, 2])
	}

	out <- unique(data.table::rbindlist(res))

	if (!is.null(hash)) {
		.hrqolr_cache_user$set(hash, out)
	}

	return(out)
}
