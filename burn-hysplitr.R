rm(list=ls()) # clear env

devtools::install_github("rich-iannone/SplitR")
library(splitr)

trajectory <- hysplit_trajectory(
  lat = 35.792731,
  lon = -90.011787,
  height = 2,
  duration = 6,
  days = "2020-10-02",
  daily_hours = c(13, 15, 17),
  direction = "forward",
  met_type = "nam12",
  extended_met = T
)

trajectory_plot(trajectory)

dispersion_model <- create_disp_model() %>%
                                        add_emissions(
                                          rate = 5,
                                          duration = 6,
                                          start_day = "2015-07-01",
                                          start_hour = 0) %>%
                                        add_species(
                                          pdiam = 1,
                                          density = 1,
                                          shape_factor = 1) %>%
                                        add_grid(
                                          range = c(0.5, 0.5),
                                          division = c(0.1, 0.1)) %>%
                                        add_params(
                                          lat = 49.0,
                                          lon = -123.0,
                                          height = 50,
                                          duration = 24,
                                          start_day = "2015-07-01",
                                          start_hour = 0,
                                          direction = "forward",
                                          met_type = "reanalysis") %>%
                                        run_model()