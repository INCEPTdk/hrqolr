library(xml2)
library(stringr)
library(readr)
library(purrr)
library(dplyr)

arms <- c("restricted", "standard")

km_curve <- read_xml("preproc/classic_trial_km_overall_survival.svg") %>%
	xml_children() %>%
	keep(xml_has_attr, attr = "id")

axes <- km_curve[str_detect(xml_attr(km_curve, "id"), "axis")]
curves <- km_curve[xml_attr(km_curve, "id") %in% arms]

axis_coords <- map_dfr(
	c("x1", "x2", "y1", "y2"),
	~ c(list(coord = .), setNames(parse_number(xml_attr(axes, .)), xml_attr(axes, "id")))
) %>%
	summarise(
		y_axis_min = y_axis[coord == "y2"],
		y_axis_diff = abs(y_axis_min - y_axis[coord == "y1"]),
		x_axis_min = x_axis[coord == "x2"],
		x_axis_diff = abs(x_axis_min - x_axis[coord == "x1"])
	) %>%
	as.list()

cum_mort_classic_standard_arm <- curves[xml_attr(curves, "id") == "standard"] %>%
	xml_attr("points") %>%
	str_split(" ") %>%
	pluck(1) %>%
	discard(str_equal, "") %>%
	str_split(",") %>%
	do.call(rbind, .) %>%
	as_tibble(.name_repair = ~ c("x", "y")) %>%
	mutate(across(everything(), parse_number)) %>%
	group_by(x) %>%
	summarise(y = max(y)) %>% # origin of coordinates is upper-left corner
	transmute(
		t = 90 * (x - axis_coords$x_axis_min) / axis_coords$x_axis_diff,
		p_death = (y - axis_coords$y_axis_min) / axis_coords$y_axis_diff) %>%
	mutate(across(everything(), ~ . - min(.))) %>% # align origin of coordinate system
	bind_rows(tibble(t = 180, p_death = 0.46))
		# near-linear KM between 90 and 180 days in fig. 2 of 10.1007/s00134-023-07114-8,
		# which also shows 46% cumulative mortality after 180 days

usethis::use_data(cum_mort_classic_standard_arm, internal = TRUE, overwrite = TRUE)
