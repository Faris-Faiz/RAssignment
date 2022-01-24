library(plyr)

server<- shinyServer(function(input, output, session){
  
  coursera<-read.csv("coursera.txt", sep = ';')
  edx<-read.csv("edx.txt", sep = ';')
  
  coursesMerged <- plyr::join(coursera, edx, type = "full")
  
  
  output$summary <- renderText({
    paste(input$courseInput)
  })
  
  output$view <- DT::renderDataTable({
    difficultyFilter <- subset(coursesMerged, coursesMerged$difficulty == input$dificulty 
                               & coursesMerged$hours_to_complete <= input$hoursToComplete 
                               & coursesMerged$ratings >= input$courseRatings 
                               & coursesMerged$free_enrol == input$freeOrNot 
                               & coursesMerged$fin_aid == input$financialAid
                               & grepl(input$courseInput, coursesMerged$name, ignore.case = TRUE)
    )
    
    
    
  })
})