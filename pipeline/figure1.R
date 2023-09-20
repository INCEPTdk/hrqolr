library(magrittr)
library(data.table)
library(ggplot2)
library(patchwork)

res <- readRDS("_targets/objects/figure1_target")

# Needed when targets hasn't completed and I want to work with the files it has generated
# res <- lapply(list.files("_targets/objects", full.names = TRUE), readRDS)

scenario_keys <- data.table::rbindlist(lapply(res, function(x) x$args), idcol = "key")

comparisons <- merge(
	data.table::rbindlist(lapply(res, function(x) x$comparisons), idcol = "key"),
	scenario_keys,
	by = "key"
)

# not need once pipeline has been re-run with new relative_mortality_reduction_actv parameter
comparisons[, `:=`(
	relative_mortality_reduction_actv = 1 - relative_mortality_actv,
	relative_mortality_actv = NULL
)]

all_strat_vars <- c( # all variables by which to be stratified
	"n_patients_per_arm",
	"acceleration_hrqol_actv",
	"prop_mortality_benefitters_actv",
	"relative_mortality_reduction_actv",
	"relative_improvement_hrqol_actv",
	"mortality_dampening",
	"mortality_trajectory"
)
shape_var <- "acceleration_hrqol_actv"
colour_var <- "n_patients_per_arm"

strat_vars <- all_strat_vars[!all_strat_vars %in% c(shape_var, colour_var)]

data.table::setorderv(comparisons, all_strat_vars)

plot_dt <- comparisons[outcome == "surv__primary__hrqol_at_eof"] # figure 1
plot_dt <- comparisons[outcome == "surv__primary__hrqol_auc"] # figure 2

plot_dt[
	,
	`:=`(
		x = seq_len(.N),
		colour_column = factor(eval(as.name(colour_var)), ordered = TRUE),
		shape_column = factor(eval(as.name(shape_var))),
		line_group = do.call(paste, as.list(plot_dt[, mget(c(strat_vars, shape_var))]))
	)
]

# Build guides in bottom panel (also needed for shaded regions in top panel)
n_shape_colour_levels <- length(unique(paste(plot_dt[[shape_var]], plot_dt[[colour_var]])))
bar_combos <- unique(plot_dt[, ..strat_vars])[rep(seq_len(.N), each = n_shape_colour_levels), ]
bar_coords <- list()
for (g in strat_vars) {
	vals <- bar_combos[[g]]
	grps <- vals != data.table::shift(vals, fill = -Inf)
	tmp <- lapply(
		setNames(split(seq_len(nrow(plot_dt)), cumsum(grps)), vals[grps]),
		function(.) data.table::data.table(label_x = mean(range(.)), xmin = min(.), xmax = max(.))
	)
	bar_coords[[g]] <- data.table::rbindlist(tmp, idcol = "label")
}
bar_coords <- data.table::rbindlist(bar_coords, idcol = "grouping_var")

# Ensure vertical axis is in the right order
bar_coords[, grouping_var := factor(
	grouping_var,
	levels = bar_coords[, .N, by = grouping_var][order(N)][["grouping_var"]]
)]

bar_plot <- ggplot(bar_coords, aes(y = grouping_var)) +
	geom_errorbarh(aes(xmin = xmin - 0.5, xmax = xmax + 0.5), linewidth = 0.25, height = 0.3) +
	geom_text(aes(x = label_x, label = label), size = 6/.pt, vjust = 1.5) +
	theme_minimal() +
	theme(
		panel.grid = element_blank(),
		axis.title = element_blank(),
		axis.text.y = element_text(size = 6),
		axis.text.x = element_blank()
	)

# Shaded ribbons to help see groups belonging to the lowest level of stratification
ribbon_coords <- data.table(
	x = seq_len(nrow(plot_dt)),
	grp = rep(seq_len(nrow(plot_dt) / n_shape_colour_levels), each = n_shape_colour_levels),
	draw_ribbon = rep(seq_len(.N / n_shape_colour_levels), each = n_shape_colour_levels) %% 2 == 1
) %>%
	.[draw_ribbon == TRUE] %>%
	.[, .(xmin = min(x) - 0.5, xmax = max(x) + 0.5), by = "grp"]

point_plot <- ggplot(plot_dt) +
	geom_line(aes(x = x, y = rejection_rate, group = line_group), linewidth = 0.25, colour = "grey90") +
	geom_hline(yintercept = 0.05, linewidth = 0.25, linetype = 2) +
	geom_rect(aes(xmin = xmin, xmax = xmax, ymin = -Inf, ymax = Inf), ribbon_coords, alpha = 0.05) +
	geom_point(aes(x = x, y = rejection_rate, shape = shape_column, colour = colour_column)) +
	scale_colour_brewer(palette = "Set1") +
	scale_y_continuous(limits = c(0, 1)) +
	theme_minimal() +
	theme(
		axis.text.y = element_text(size = 6),
		axis.text.x = element_blank(),
		axis.title.y = element_text(size = 7),
		axis.title.x = element_blank(),
		panel.grid.major.x = element_blank(),
		panel.grid.minor.x = element_blank(),
		legend.position = "top",
		legend.title = element_text(size = 6),
		legend.text = element_text(size = 6)
	) +
	guides(
		colour = guide_legend(title = colour_var),
		shape = guide_legend(title = shape_var)
	)

# Vertical layout
point_plot / bar_plot +
	plot_layout(heights = c(4, 1))

ggsave("internal/dasaim_abstract_figure1.pdf", units = "cm", width = 30, height = 15)

# Horizontal layout
# bar_plot + point_plot +
# 	plot_layout(widths = c(1, 3))
