library(plyr)

ui <- fluidPage(
  titlePanel("Course Craver!"),
  
  pageWithSidebar(
    headerPanel("Analysis"),
    
    sidebarPanel(
      
      # Text for mini-tutorial
      h4(strong("Guidelines:")),
      p("Course Desired: Input the course you want"),
      p("Choose a difficulty: Choose between the designated difficulties"),
      p("Hours to Complete: How long it takes for you to finish the course"),
      p("Ratings of Course: Choose the rating you want, choose 0 for EDX courses inclusion."),
      p("Enrollment Option: Whether or not the course is free."),
      p("Receive Financial Aid: Receive a certificate upon completion"),
      
      # Input: Text for course input ----
      textInput(inputId = "courseInput",
                label = "Course Desired:"),
      
      # Input: Selector for choosing difficulty ----
      selectInput(inputId = "dificulty",
                  label = "Choose course difficulty:",
                  choices = c("Beginner", "Intermediate", "Advanced")),
      
      # Input: Numeric entry for number of hours to complete ----
      numericInput(inputId = "hoursToComplete",
                   label = "Hours to Complete: ",
                   value = 100,
                   min = 1,
                   max = 100),
      
      # Input: Numeric entry for ratings for course desired (optional)
      
      numericInput(inputId = "courseRatings",
                   label = "Ratings of course: ",
                   value = 0,
                   min = 0,
                   max = 5),
      
      # Input: Checkbox input for whether or not the course is free
      
      checkboxInput(inputId = "freeOrNot",
                    label = "Enrollment Option (free?)",
                    value = TRUE,
                    width = NULL),
      
      # Input: Checkbox input for financial aid
      
      checkboxInput(inputId = "financialAid",
                    label = "Receive Financial Aid?",
                    value = TRUE,
                    width = NULL),
      
    ),
    
    mainPanel(
      
      # Output: Formatted text for caption ----
      h3(textOutput("caption", container = span)),
      
      # Output: Verbatim text for data summary ----
      verbatimTextOutput("summary"),
      
      # Output: HTML table with requested number of observations ----
      DT::dataTableOutput("view")
    ) 
  ) 
)