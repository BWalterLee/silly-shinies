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


stonk_fun <- function(){
    
    rando <- c("Tesla","Bed Bath and Beyond", "Microsoft", "Apple", "GM", "GE", "Gamestop", "AMC", 
                   "Blackberry", "Exxon", "Bumble", "Petco", "Roblox", 
                   "Shopify", "Amazon", "Square", "Weed Stocks", "The New York Times", 
               "Airbnb", "Disney", "Google", "Peloton", "DoorDash", "IBM", "Nvidia",
               "Goldman Sachs", "the big guys", "the little guys", "the Big Banks", 
               "Elon", "NFTs", "Crypto", "Bitcoin", "Bonds", "the guys on the sideline", "Silicon Valley",
               "the corporate tax rate", "the Oracle of Omaha")
    
    times <- c("last quarter", "the Dot Com bubble", "pre-Covid",
               "the IPO", "last year", "the previous earnings report" , "that massive buyback",
               "my divorce", "the 80's", "the 90's", "the Great Recession", "the merger", 
               "Lehman", "the semiconductor shortage", "WallStreetBets", "the quadruple witching hour")
    
    lead_list <- c("Hey now, ",
                   "Where this thing is going, ",
                   "I haven't seen this in years, ",
                   "Takeaway: ",
                   "Purpose built, mission driven: ",
                   "It's cyclical not secular, ",
                   "Really robust top line, ",
                   "Edge computing at the forefront, ",
                   "This would look better triple levered, ",
                   "Don't tell my wife, but ",
                   "Don't tell my husband, but ",
                   "Couldn't be more sure, ",
                   "Seriously undervalued, ",
                   "Market's looking shaky, ",
                   "I'm a little nervous, but ",
                   (paste("Bringing it back to ", sample(times, 1),", ", sep = "")),
                   "A little here, a little there, ",
                   (paste("This is probably bigger than ", sample(rando, 1),", ", sep = "")),
                   "Risking my kid's college fund, but ",
                   "Lesson number one: ",
                   "Stimulus right here, ",
                   "This is a structured product, ",
                   "They really went open kimono, ",
                   "I'm more Main Street than Wall Street, ",
                   "The downside is really limited by the upside, ",
                   "No one's even bothered to look at the synergies yet, ",
                   "I'm junked up, ",
                   "I don't mean to be a BSD, ",
                   "I'm doing market research, ",
                   "Reminds me of my last SPAC, ",
                   "You can cut this baby any way you want, "
                   
                   
                   )
    
    turn_list <- c("the fundamentals are just prime. ",
                   "where's the downside? ",
                   "I'm gonna want to get in and get out FAST! ",
                   "my accountant is gonna have a field Day! ",
                   "you just can't let an opportunity like this slide by. ",
                   "it's just the WOW factor!!! ",
                   "why don't they bring it offshore? ",
                   "it's a cash cow ready to be milked and bottled. ",
                   "they're tapping into digital finance interoperability. ",
                   "I'm into taking a risk on this one. ",
                   "The Street just isn't in the know. ",
                   "severely undervalued. ",
                   "and the volatility is overrated. ",
                   (paste("makes ", sample(rando, 1), " look like ", sample(rando, 1),"! ", sep = "")),
                   "the Roaring 20's are back! ",
                   "it's 2008 all over again. ",
                   (paste("been looking great since ",sample(times,1),". ", sep = "")),
                   "but I've seen better. ",
                   "but I haven't seen better. ",
                   "and it's looking up for the most part. ",
                   "though I could be wrong. ",
                   "and I've always been right. ",
                   "but something shady has to be going on. ",
                   "who even ARE these guys?!? ",
                   "always buy on a discount. ",
                   (paste("and they don't want to end up like ", sample(rando, 1), ". ", sep = "")),
                   "and they don't want to be caught with their hands in their pants. ",
                   "they could really squeeze out some more leverage. ",
                   "this really hits my return hurdles. ",
                   "nothing like seeing a wall of green! ",
                   "you can thank Jay Powell for this. ",
                   "but those dividends are gonna be huge. " 
                   
           
                   
                   
    )
    
    quip_list <- c("Take it or leave it!",
                   "Hot mama!",
                   "Not even a question.",
                   "This is only the beginning!",
                   "What a monster.",
                   "Good Morning!",
                   "Good Night!",
                   "I'll be keeping my eyes on this one.",
                   "PROFIT!",
                   "AMAZING!",
                   "Where could it be going?",
                   "This is gonna PAY!",
                   "This one's a squirter.",
                   "Worse than a waiter on a Wednesday",
                   "Sweeter than the OJ on a Sunday morning.",
                   "I lean more rule of 50 than rule of 40.",
                   "Driven by AI/ML/IoT/NLP tailwinds.",
                   "Prime.",
                   "Opposite of a dog.", 
                   "Fundamentals aren't everything.",
                   "It's a long play, for sure.",
                   "Can't hop off this rollercoaster!",
                   paste("Really brings me back to ", sample(times, 1),".", sep = ""),
                   "Hold!",
                   "BUY BUY BUY!",
                   "BUY SELL BUY!",
                   "Don't take no for an answer!",
                   "Not today!",
                   "Break em up!",
                   "Never sell!",
                   "How much is too much?",
                   "Buy the dip!",
                   "Tesla or a Lambo?",
                   "Holding this til the next earnings report.",
                   "We don't need to compare apples to oranges when we're talking about bananas.",
                   "This is a massive TAM.",
                   "Put it on the tape!"
                
                   
                   )
    
    
    comment = paste(  
        sample(lead_list, 1),
        sample(turn_list, 1),
        sample(quip_list, 1), sep = "")
    
    return(comment)
    
}

# Define UI for application that draws a histogram
ui <- fluidPage(tags$style("#stonktext {font-size:32px;
               color:black;
               display:bold; }"),
    
    # Application title
    titlePanel("So u bought stonk. Tell us why. "),
    
    # Sidebar with a slider input for number of bins 
    sidebarLayout(
        actionButton("goButton", "PROFIT"),
        p("What did you know?")),
    
   
    mainPanel(
           textOutput("stonktext"), width = 12)
    
        
     )
    

# Define server logic required to draw a histogram
server <- function(input, output) {
    
    output$stonktext <- eventReactive(input$goButton, {
        stonk_fun()
    })
    
}

# Run the application 
shinyApp(ui = ui, server = server)
