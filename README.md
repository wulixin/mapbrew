# mapbrew

Mapping China using amCharts + R.

## Installation

```r
devtools::install_github('czxa/mapbrew')
```

## Example

This is a basic example which shows you how to solve a common problem:

```r
library(mapbrew)
library(magrittr)
dir <- tempdir()
download.file('https://czxb.github.io/br/chinadf.rda', file.path(dir, 'chinadf.rda'))
load(file.path(dir, 'chinadf.rda'), verbose = TRUE)
df <- chinadf %>% 
  dplyr::filter(region == "China")
cnmap(id = df$name, 
      value = df$value, 
      description = paste0(df$name, ": ", df$value, "人"),
      smallMap = 0, 
      theme = "dark",
      width = "100%")
```

![](https://czxb.github.io/br/amCharts.svg)

## Use it in RMarkdown documents and Shiny Apps

```r 
library(shiny)
library(mapbrew)
library(dplyr)
library(magrittr)
dir <- tempdir()
download.file('https://czxb.github.io/br/chinadf.rda', file.path(dir, 'chinadf.rda'))
load(file.path(dir, 'chinadf.rda'), verbose = TRUE)
ui <- fluidPage(
  titlePanel("Map of China example"),
  mainPanel(
    cnmapOutput("shinytest", height = "500px")
  )
)
server <- function(input, output) {
  output$shinytest <- renderCnmap({
    df <- chinadf %>% dplyr::filter(region == "China")
    cnmap(id = df$name, value = df$value,
          description = paste0(df$name, ": ", df$value, "人"),
          smallMap = 0, theme = "dark")
  })
}
shinyApp(ui = ui, server = server)
```
