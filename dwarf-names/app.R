#
# This is a Shiny web application. You can run the application by clicking
# the 'Run App' button above.
#
# Find out more about building applications with Shiny here:
#
#    http://shiny.rstudio.com/
#
#
# This is a Shiny web application. You can run the application by clicking
# the 'Run App' button above.
#
# Find out more about building applications with Shiny here:
#
#    http://shiny.rstudio.com/
#

library(shiny)
library(tidyverse)
library(ggfittext)


dwarf_fun <- function(){
    
    first <- c("Craggle", "Doinklus", "Bargo", "Dibblus", "Jibblo", "Grogg", "Bordo", 
               "Mumpo", "Grabbi", "Drog","Smelt","Ore", "Metal", "Stone", "Bone", "Craft",
               "Brew","Beans","Meat","Lamb","Beef", "Drago", "Arch", 
               "Honk", "Dorp", "Arno", "Hunger", "Mutton"
    )
    
    last <- c("ion", "idorus", "monacious", "onk", "oofo", "beard", "legs", "strong", "eater", 
              "haven", "sword", "shield", "hammer", "blade", "brewer", "haver", "render", "slayer",
              "igan", "", " The Third","shank", "tuft", "burn", "spear")
    
    
    comment =  paste0(sample(first, size = 1),sample(last,size = 1), " ", sample(first, size = 1),sample(last,size = 1))
    
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
