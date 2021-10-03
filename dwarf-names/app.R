#
# This is another of Ben's very silly auto-text generators.
#
# Dwarf name auto-generator for use in D&D campaigns.
#

library(shiny)
library(tidyverse)
library(ggfittext)


dwarf_fun <- function(){
    
    first.start <- c("Bargo", "Dibble", "Hork", "Grogg", "Bordo", 
               "Mumpo", "Grabbi", "Drog","Drago", "Arch", "Don", "Bun",
               "Honk", "Dorp", "Arno",  "Mongo", "Elder", "Dorn", "Dun",
               "Gor", "Gir", "Gun","Din","Gin", "Greg",
               "Fin", "Far", "Fred", "Himl", "Him", "Eor","Ed",
               "Jim", "Jer", "Jeff", "Kur", "Kyur", "Kev",
               "Len", "Lor", "Dav","Min","Mom", "Ned",
               "Ooyr", "Ok","Pin","Ren","Ran","Ted",
               "Zed","Zil","Jon"
               
    )
    
    first.end <- c("ion", "idorus", "acious", "onk", "oofo","igan", "","ist","idon", "yr", 
                   "rith", "ruff","mon", "grel", "dil","non", "nan","idon","or","urth","ther",
                   "ibald", "ith","ont", "","","", "i","et","if","gon","fir","fyr",
                   "hut","ingo","hip","ip","li"
                   
                   
                   )
    
    
    last.start <- c("Craggle","Brew","Beans","Meat","Lamb","Beef","Hunger", "Mutton","Diddle",
                    "Shatter","Smelt","Ore", "Metal", "Stone", "Bone", "Craft","Crag",
                    "Storm", "Light","Smash", "Break","Breakfast","Mead","Wine", "Dearth",
                    "Mason", "Tall","Short","Wide","Thick", "Char","Rend","Silver","Gold",
                    "Ruby","Diamond","Wooden","Oak","Maple","Fur","Spine")
        
        
       
    last.end <- c("beard", "legs", "strong", "eater", "ino",
                  "haven", "sword", "shield", "hammer", "blade", "brewer", "haver", "render", "slayer",
                  " The Third","shank", "tuft", "burn", "spear",
                  "mountain", "hearth", "grabber","thief","gard",
                  "fire","cury","dell", "knell", "grove", "gotten",
                  "hope", "crack","ton","mound","stall","gauntlet","hand","foot","thumb","legs")
    
    comment =  paste0(sample(first.start, size = 1),sample(first.end,size = 1), " ", sample(last.start, size = 1),sample(last.end,size = 1))
    
    return(comment)
    
}

# Define UI for application that draws a histogram
ui <- fluidPage(tags$style("#dwarftext {font-size:32px;
               color:black;
               display:bold; }"),
                
                # Application title
                titlePanel("Hail and well met, dwarf! What do they call ye?"),
                
                # Sidebar with a slider input for number of bins 
                sidebarLayout(
                    actionButton("goButton", "I've been called..."),
                    p("Hail, friend!")),
                
                
                mainPanel(
                    textOutput("dwarftext"), width = 12)
                
                
)


# Define server logic required to draw a histogram
server <- function(input, output) {
    
    output$dwarftext <- eventReactive(input$goButton, {
        dwarf_fun()
    })
    
}

# Run the application 
shinyApp(ui = ui, server = server)
