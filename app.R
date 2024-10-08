library(shiny)

generate_story <- function(noun, verb, adjective, adverb) {
  cat("\This is a message\ with the noun:{noun}", file = stderr())
  cat("\This is a message\ with the verb:{verb}", file = stderr())
  cat("\This is a message\ with the adjective:{adjective}", file = stderr())
  cat("\This is a message\ with the adverb:{adverb}", file = stderr())

  glue::glue("
    Once upon a time, there was a {adjective} {noun} who loved to
    {verb} {adverb}. It was the funniest thing ever!
    Ik voeg hier iets tekst toe
  ")
}

ui <- fluidPage(
  titlePanel("Mad Libs Game"),
  sidebarLayout(
    sidebarPanel(
      textInput("noun1", "Enter a noun:", ""),
      textInput("verb", "Enter a verb:", ""),
      textInput("adjective", "Enter an adjective:", ""),
      textInput("adverb", "Enter an adverb:", ""),
      actionButton("submit", "Create Story")
    ),
    mainPanel(
      h3("Your Mad Libs Story:"),
      textOutput("story"),
      h3("code @ https://github.com/YvonneHassink/madlibs")
    )
  )
)

server <- function(input, output) {
  story <- eventReactive(input$submit, {
    generate_story(input$noun1, input$verb, input$adjective, input$adverb)
  })
  output$story <- renderText({
    story()
  })
}

shinyApp(ui = ui, server = server)
