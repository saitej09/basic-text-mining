library(shiny)
shinyServer(function(input,output,session){
  
  thedata <- reactive({
    
    input$update # when update is pressed
    
    isolate({
      withProgress({
        setProgress(message = "Processing corpus...")
        getTDM(input$input_file)
      })
    })#isolate ends
    
  })# reactive code
  
  wordcloud_repeatable <- repeatable(wordcloud)
  
  output$plot <- renderPlot({
    v <- thedata()
    wordcloud_repeatable(names(v),v,scale=c(4,0.5),
                         min.freq = input$freq, rot.per=0.35,max.words = input$word_max, random.color = TRUE, colors = brewer.pal(8,"Dark2") )
  })
  
  output$Frequentwords <- renderText({
    d <- thedata()
    names(d[1:5])
  })
  
})#shiny server ends