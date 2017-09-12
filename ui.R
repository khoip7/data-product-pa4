#
# This is the user-interface definition of a Shiny web application. You can
# run the application by clicking 'Run App' above.
#
# Find out more about building applications with Shiny here:
# 
#    http://shiny.rstudio.com/
#

library(shiny)

# Define UI for application that draws a histogram
shinyUI(fluidPage(theme = "bootstrap.css",
  
  # Application title
  titlePanel("Word Predictor Demo"),
  
  # Sidebar with a slider input for number of bins 
  sidebarLayout(
    sidebarPanel(
            tabsetPanel(type = "tabs",
                        tabPanel(h4("Main Control"),
                               p(""),
                               textInput("sentence", "Text Input"),
                               sliderInput("number.of.words",
                                           "Number of words:",
                                           min = 1,
                                           max = 10,
                                           value = 3)),
                        tabPanel(h4("User Guide"),
                                p(""),
                                h4("Introduction"),
                                p("This program is a demo for word prediction based on ", strong("Ngrams"), " models whith ", strong("stupid backoff")," algorithm."),
                                h4("To predict a word from text input:"),
                                p("1. Type word(s) into field ", strong("Text Input.")),
                                p("2. Limit the number of predicted words int field", strong("Number of words.")),
                                p("The application will automatically filter unnecessary word(s) from your input and show the result in ", strong("Predicted words based on filtered text.")),
                                h4("Note:"),
                                p("This demo using aggressive filtering contains of nine steps that leave out all words that irrelevant to the context of the sentence. Therefore, only texts that appear in field \"Filtered text\" are used for prediction."),
                                h4("Slide:"),
                                p("For more information read the description slide at:", a("Link", href="http://rpubs.com/khoip/306129")),
                                h4("Creator"),
                                p("Khoi Phan - email: pkhoi176@gmail.com")
                                
                        ))),
    
    # Show a plot of the generated distribution
    mainPanel(
            h3("Unfiltered Input:"),
            span(h4(textOutput("input.sentence")), style="font-weight: bold; color: #cc3300"),
            br(),
            h3("Filtered Input:"),
            span(h4(textOutput("preprocessed.sentence")), style="font-weight: bold; color: #cc3300"),
            br(),
            h3("Predicted Word(s)"),
            span(h3(textOutput("predicted.words")), style="font-weight: bold; color: #009933")
    )
  )
))
