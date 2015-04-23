library(shiny)
library(datasets)
load("~/logistics.rda")

# Define server logic required to summarize and view the selected
# dataset
shinyServer(function(input, output) {
  
  # Return the requested dataset
  datasetInput <- reactive({
    switch(input$dataset,
           "logistics" = logistics)
  })  
  # Return the requested category
  variableInput <- reactive({
    switch(input$variable,
           "Cost" = logistics$Cost,
          "StandardCost" = logistics$StandardCost,
          "Forwarder" = logistics$Forward
          )
  })  
  # Compute the formula text in a reactive expression since it is
  # shared by the output$caption and output$mpgPlot functions
  formulaText <- reactive({
    paste("logistics$", input$variable)
  })
  
  # Return the formula text for printing as a caption
  output$caption <- renderText({
    formulaText()
  })
  

  # Generate a summary of the dataset
  output$summary <- renderPrint({
    dataset <- datasetInput()
    variable <- variableInput()
    summary(variable)
  })
  
  # Show the first "n" observations
  output$view <- renderTable({
    head(datasetInput(), n = input$obs)
  })
  
  #Generate a plot of the requested variable against mpg and
  # only include outliers if requested
  output$mpgPlot <- renderPlot({
   # hist(logistics$Cost)
    variable <- variableInput()
    hist(variable)
  })
})
