#
# This is the server logic of a Shiny web application. You can run the 
# application by clicking 'Run App' above.
#
# Find out more about building applications with Shiny here:
# 
#    http://shiny.rstudio.com/
#

library(shiny)
library(tm)
library(textstem)
library(hunspell)
load("./grams.RData")
load("./profanityWords.RData")
grams <<- grams
profanityWords <<- profanityWords
source("./prediction.R")
source("./cleanning_text.R")
source("./incorrect_words_remove.R")
options(warn=-1)
ToSpaceByPattern <<- content_transformer(function(x, pattern, replace.with) {return (gsub(pattern,replace.with, x))})
# Define server logic required to draw a histogram
shinyServer(function(input, output) {
  
  output$input.sentence <- renderText({input$sentence})
  output$preprocessed.sentence <- renderText({CleanningText(input$sentence)})
  output$predicted.words <- renderText({
          result = PredictNextWord(CleanningText(input$sentence))
          if (result != FALSE){
                  result = head(result, input$number.of.words)
                  result = paste(result, collapse = ", ")
          }else{
                  result = "Enter some text for prediction."
          }
          return(result)
  })
  
})
