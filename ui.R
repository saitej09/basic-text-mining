shinyUI(
  fluidPage(
    titlePanel("Word Cloud"),
    tags$style(type="text/css",
               ".shiny-output-error { visibility: hidden; }",
               ".shiny-output-error:before { visibility: hidden; }"),
    sidebarLayout(
      sidebarPanel(
        fileInput(
          "input_file", "Upload a Text File"
        ),# filein/p end
        actionButton("update","Plot"),
        hr(),
        
        sliderInput("freq","Minimum Frequency",min = 1,  max = 50, value = 15),
        sliderInput("word_max","Maximum Words",min = 1,  max = 300, value = 75)
        
      ),# sidebar panel ends
      
      mainPanel(
        tabsetPanel(
          tabPanel("Plot",plotOutput("plot")),
          tabPanel("Text Analysis ",{
            h1(strong(textOutput("Frequentwords")))
          })
        )
        
        
        
      )
    )
  )
)