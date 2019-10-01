#' Mapping China use amCharts + R
#'
#' @param id province name
#' @param value province value
#' @param description detailed description
#' @param theme theme: black/chalk/dark/light
#' @param colorSteps Number of layers of colors in legend
#' @param smallMap Weather to display a minimap or not. smallMap = 1 means to display, smallMao = 0 means to not display.
#' @param smallMapTop Control the vertical position of the minimap.
#' @param smallMapRight Control the Horizontal position of the minimap.
#' @param export Whether to open the export plug-in, 1 means to open, 0 means not to open.
#' @param valueLegendRight Horizontal position of legend
#' @param valueLegendBottom Vertical position of legend
#' @param minValue Label of Minimum Legend
#' @param maxValue Label of Maximum Legend
#' @param title title
#' @param titleSize title size
#' @param titleColor title color
#' @param subtitle subtitle
#' @param subtitleSize subtitle size
#' @param subtitleColor subtitle color
#' @param autoZoom Whether to zoom in automatically or not, 1 means yes and 0 means no.
#' @param outlineAlpha Transparency of borders
#' @param outlineColor Color of borders
#' @param outlineThickness Width of borders
#' @param rollOverColor The color of the area where the mouse passes
#' @param width NULL
#' @param height NULL
#' @param elementId NULL
#' @param ... NULL
#'
#' @examples
#' library(mapbrew)
#' library(magrittr)
#' dir <- tempdir()
#' download.file('https://czxb.github.io/br/chinadf.rda', file.path(dir, 'chinadf.rda'))
#' load(file.path(dir, 'chinadf.rda'), verbose = TRUE)
#' df <- chinadf %>%
#'   dplyr::filter(region == "China")
#' if(interactive()) {
#'   cnmap(id = df$name,
#'         value = df$value,
#'         description = paste0(df$name, ": ", df$value, "人"),
#'         smallMap = 0,
#'         theme = "dark",
#'         width = "100%")
#' }
#'
#' @import htmlwidgets
#'
#' @export
cnmap <- function(id = NULL,
                  value = NULL,
                  description = NULL,
                  theme = NULL,
                  colorSteps = 12,
                  smallMap = 1,
                  smallMapTop = 50,
                  smallMapRight = 50,
                  export = 1,
                  valueLegendRight = 10,
                  valueLegendBottom = 10,
                  minValue = "min",
                  maxValue = "max",
                  title = "Map of China",
                  titleSize = 18,
                  titleColor = "#363636",
                  subtitle = "czxa.top",
                  subtitleSize = 16,
                  subtitleColor = "#363636",
                  autoZoom = 1,
                  outlineAlpha = 0.5,
                  outlineColor = "#363636",
                  outlineThickness = 0.5,
                  rollOverColor = NULL,
                  ...,
                  width = NULL,
                  height = NULL,
                  elementId = NULL) {

  # forward options using x
  x = list(
    id = id,
    value = value,
    description = description,
    theme = theme,
    colorSteps = colorSteps,
    smallMap = smallMap,
    smallMapTop = smallMapTop,
    smallMapRight = smallMapRight,
    export = export,
    valueLegendRight = valueLegendRight,
    valueLegendBottom = valueLegendBottom,
    minValue = minValue,
    maxValue = maxValue,
    title = title,
    titleSize = titleSize,
    titleColor = titleColor,
    subtitle = subtitle,
    subtitleSize = subtitleSize,
    subtitleColor = subtitleColor,
    autoZoom = autoZoom,
    outlineAlpha = outlineAlpha,
    outlineColor = outlineColor,
    outlineThickness = outlineThickness,
    rollOverColor = rollOverColor,
    ...
  )

  # create widget
  htmlwidgets::createWidget(
    name = 'cnmap',
    x,
    width = width,
    height = height,
    package = 'mapbrew',
    elementId = elementId
  )
}

#' Shiny bindings for cnmap
#'
#' Output and render functions for using cnmap within Shiny
#' applications and interactive Rmd documents.
#'
#' @param outputId output variable to read from
#' @param width,height Must be a valid CSS unit (like \code{'100\%'},
#'   \code{'400px'}, \code{'auto'}) or a number, which will be coerced to a
#'   string and have \code{'px'} appended.
#' @param expr An expression that generates a cnmap
#' @param env The environment in which to evaluate \code{expr}.
#' @param quoted Is \code{expr} a quoted expression (with \code{quote()})? This
#'   is useful if you want to save an expression in a variable.
#'
#' @name cnmap-shiny
#'
#' @export
cnmapOutput <- function(outputId, width = '100%', height = '400px'){
  htmlwidgets::shinyWidgetOutput(outputId, 'cnmap', width, height, package = 'mapbrew')
}

#' @rdname cnmap-shiny
#' @export
renderCnmap <- function(expr, env = parent.frame(), quoted = FALSE) {
  if (!quoted) { expr <- substitute(expr) } # force quoted
  htmlwidgets::shinyRenderWidget(expr, cnmapOutput, env, quoted = TRUE)
}
