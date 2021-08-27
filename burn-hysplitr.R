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

dispersion <- hysplit_dispersion(lat = 35.792731,
                                 lon = -90.011787,
                                 height = 2,
                                 duration = 3,
                                 start_day = "2020-10-02",
                                 start_hour = 13,
                                 direction = "forward",
                                 met_type = "nam12",
                                 species = c(1))



dispersion_model <- create_dispersion_model() %>%
                                        add_emissions(
                                          rate = 5,
                                          duration = 6,
                                          start_day = "2015-07-01",
                                          start_hour = 0) %>%
                                        add_grid(
                                          range = c(0.5, 0.5),
                                          division = c(0.1, 0.1)) %>%
                                        add_source(
                                          lat = 49.0,
                                          lon = -123.0,
                                          height = 2,
                                          ) %>%
                                        run_model()

dispersion_model %>% dispersion_plot()
