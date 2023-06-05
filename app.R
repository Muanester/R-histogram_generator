library(shiny)
data(airquality)

ui <- fluidPage(
  titlePanel("Histogram Generator"),
  sidebarLayout(
    sidebarPanel(
      sliderInput(inputId = "bins",
                  label = "Number of bars:",
                  min = 1,
                  max = 100,
                  value = 30)
    ),
    
    mainPanel(
      plotOutput(outputId = "distPlot")
    ),
  ),
  tags$head(
    tags$link(rel = "stylesheet", type = "text/css", href = "styles.css")
  ),
)

server <- function(input, output) {
  output$distPlot <- renderPlot({
    x <- airquality$Ozone
    x <- na.omit(x)
    bins <- seq(min(x), max(x), length.out = input$bins + 1)
    
    hist(x, breaks = bins, col = "red", border = "black",
         xlab = "Number of bars",
         main = "Histogram")
  })
}

shinyApp(ui = ui, server = server)

