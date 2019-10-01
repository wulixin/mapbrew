## ----setup, include = FALSE----------------------------------------------
knitr::opts_chunk$set(
  collapse = TRUE,
  comment = "#>"
)

## ----eval=FALSE, include=TRUE--------------------------------------------
#  devtools::install_github('czxa/mapbrew', build_vignettes = TRUE)

## ------------------------------------------------------------------------
dir <- tempdir()
download.file('https://czxb.github.io/br/chinadf.rda', file.path(dir, 'chinadf.rda'))
load(file.path(dir, 'chinadf.rda'), verbose = TRUE)

## ------------------------------------------------------------------------
library(mapbrew)
library(magrittr)
df <- chinadf %>% 
  dplyr::filter(region == "China")
cnmap(id = df$name, 
      value = df$value, 
      description = paste0(df$name, ": ", df$value, "units"),
      smallMap = 0, 
      theme = "dark",
      width = "100%")

## ------------------------------------------------------------------------
cnmap(id = df$name, 
      value = df$value, 
      description = paste0(df$name, ": ", df$value, "units"),
      smallMap = 0,
      width = "100%")

## ------------------------------------------------------------------------
cnmap(id = df$name, 
      value = df$value, 
      description = paste0(df$name, ": ", df$value, "units"),
      smallMap = 0,
      width = "100%",
      theme = "light")

## ------------------------------------------------------------------------
cnmap(id = df$name, 
      value = df$value, 
      description = paste0(df$name, ": ", df$value, "units"),
      smallMap = 0,
      width = "100%",
      theme = "chalk")

## ------------------------------------------------------------------------
cnmap(id = df$name, 
      value = df$value, 
      description = paste0(df$name, ": ", df$value, "units"),
      smallMap = 0,
      width = "100%",
      theme = "dark")

## ------------------------------------------------------------------------
cnmap(id = df$name, 
      value = df$value, 
      description = paste0(df$name, ": ", df$value, "units"),
      smallMap = 0,
      width = "100%",
      theme = "black")

## ------------------------------------------------------------------------
cnmap(id = df$name, 
      value = df$value, 
      description = paste0(df$name, ": ", df$value, "units"),
      smallMap = 0,
      width = "100%",
      colorSteps = 5)

## ------------------------------------------------------------------------
cnmap(id = df$name, 
      value = df$value, 
      description = paste0(df$name, ": ", df$value, "units"),
      smallMap = 1,
      smallMapTop = 160,
      smallMapRight = 10,
      width = "100%",
      colorSteps = 5)

## ------------------------------------------------------------------------
cnmap(id = df$name, 
      value = df$value, 
      description = paste0(df$name, ": ", df$value, "units"),
      smallMap = 0,
      valueLegendBottom = 40,
      valueLegendRight = 350,
      width = "100%",
      colorSteps = 5)

