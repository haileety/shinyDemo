library(shiny)

# Define UI for dataset viewer application
shinyUI(fluidPage(
  
  # Application title
  titlePanel("Shiny Text"),
  
  # Sidebar with controls to select a dataset and specify the
  # number of observations to view
  sidebarLayout(
    sidebarPanel(
      selectInput("dataset", "Choose a dataset:", 
                  choices = c("logistics")),
      selectInput("variable", "Variable:",
                  choices = c("Cost", "StandardCost","Forwarder")),
            
      numericInput("obs", "Number of observations to view:", 10)
    ),
    
    # Show a summary of the dataset and an HTML table with the 
	 # requested number of observations
    mainPanel(
      verbatimTextOutput("summary"),
      tableOutput("view"),
      h3(textOutput("caption")),
      plotOutput("mpgPlot")
    )
  )
))
