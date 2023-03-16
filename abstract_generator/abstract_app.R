# Full Abstract Randomization App


library(shiny)
library(tidyverse)
library(ggfittext)
library(shinythemes)

# Paper Generator Function V 0.1 ####
# Test Version, no external inputs
paper_fun <- function(Noun_List,Author_list = c("Johnson", "Reginald", "Washington","Chambers")){
  
  #
  nouns = Noun_List
  #Author_list = strsplit(input$Author_list, split = ",")
  
  points = c("we may never truly understand",
             "our vision may have been obscured",
             "our predecessors were incorrect",
             "it all depends on the context",
             "nothing can truly affect this",
             "we may be on the right track",
             "our objectives were too ambitious",
             "we are seeing evidence of this",
             "we are seeing no evidence of this",
             "the technology is not yet advanced enough",
             "new developments will have to wait",
             "seeking alternate paths forward may be required",
             paste("context dependency drives the interactions between ",sample(nouns,1)," and ",sample(nouns,1), ". ", sep = ""),
             "approximations are no longer accurate enough",
             paste("a ", sample(c("model","concept", "systems","structure"),1),"-based framework is necessary", sep = ""),
             paste("we are seeing a shift in focus towards ",sample(nouns,1), sep = ""),
             paste("our understanding of ",sample(nouns,1)," is still limited", sep = ""),
             paste(sample(nouns,1)," may be the key", sep = ""),
             paste(sample(nouns,1)," could be the solution", sep = ""),
             paste(sample(nouns,1)," may be generating these problems", sep = ""),
             paste("our reliance on ", sample(nouns,1)," may be affecting this", sep = ""),
             paste("we cannot simply ignore ",sample(nouns,1), sep = ""),
             paste(sample(nouns,1)," may rely more on ", sample(nouns,1)," than previously understood", sep = ""),
             paste(sample(nouns,1)," could be interacting with ", sample(nouns,1)," in unexpected ways", sep = ""),
             paste("current theory on ", sample(nouns,1), " may be ", sample(c("under","over")),"stating their importance",sep = ""),
             paste("this demands theory establishing a franework for measuring ",sample(nouns,1), sep = ""),
             paste("inaccurate predictions were the basis for such falsehoods regarding", sample(nouns,1), sep = "")
  )
  
  authors = c(paste("Smith et al. ", sep = "", sample(1990:2020, 1)," "), 
              paste("Jones et al. ", sep = "", sample(1990:2020, 1)," "),
              paste("Jeff et al. ", sep = "", sample(1990:2020, 1)," "), 
              paste("Hemsworth et al. ", sep = "", sample(1990:2020, 1)," "),
              paste("Jafferty et al. ", sep = "", sample(1990:2020, 1)," "), 
              paste("Wu et al. ", sep = "", sample(1990:2020, 1)," "),
              paste("Hiroshimo et al. ", sep = "", sample(1990:2020, 1)," "), 
              paste("Davis et al. ", sep = "", sample(1990:2020, 1)," "),
              paste("Gavin et al. ", sep = "", sample(1990:2020, 1)," "), 
              paste("Lee et al. ", sep = "", sample(1990:2020, 1)," "),
              paste("Samuels et al. ", sep = "", sample(1990:2020, 1)," "), 
              paste("Daniels et al. ", sep = "", sample(1990:2020, 1)," "),
              paste("Margolin et al. ", sep = "", sample(1990:2020, 1)," "), 
              paste("Neace et al. ", sep = "", sample(1990:2020, 1)," "),
              paste("Ortiz et al. ", sep = "", sample(1990:2020, 1)," "), 
              paste("McDermott et al. ", sep = "", sample(1990:2020, 1)," "),
              paste("McGovern et al. ", sep = "", sample(1990:2020, 1)," "), 
              paste("Li et al. ", sep = "", sample(1990:2020, 1)," "),
              paste("Yu et al. ", sep = "", sample(1990:2020, 1)," "), 
              paste("Gared et al. ", sep = "", sample(1990:2020, 1)," "),
              paste("Smith et al. ", sep = "", sample(1990:2020, 1)," "), 
              paste("Jones et al. ", sep = "", sample(1990:2020, 1)," "),
              paste("Jeff et al. ", sep = "", sample(1990:2020, 1)," "), 
              paste("Hemsworth et al. ", sep = "", sample(1990:2020, 1)," "),
              paste("Jafferty et al. ", sep = "", sample(1990:2020, 1)," "), 
              paste("Wu et al. ", sep = "", sample(1990:2020, 1)," "),
              paste("Hiroshimo et al. ", sep = "", sample(1990:2020, 1)," "), 
              paste("Davis et al. ", sep = "", sample(1990:2020, 1)," "),
              paste("Gavin et al. ", sep = "", sample(1990:2020, 1)," "), 
              paste("Lee et al. ", sep = "", sample(1990:2020, 1)," "),
              paste("Samuels et al. ", sep = "", sample(1990:2020, 1)," "), 
              paste("Daniels et al. ", sep = "", sample(1990:2020, 1)," "),
              paste("Margolin et al. ", sep = "", sample(1990:2020, 1)," "), 
              paste("Neace et al. ", sep = "", sample(1990:2020, 1)," "),
              paste("Ortiz et al. ", sep = "", sample(1990:2020, 1)," "), 
              paste("McDermott et al. ", sep = "", sample(1990:2020, 1)," "),
              paste("McGovern et al. ", sep = "", sample(1990:2020, 1)," "), 
              paste("Li et al. ", sep = "", sample(1990:2020, 1)," "),
              paste("Yu et al. ", sep = "", sample(1990:2020, 1)," "), 
              paste("Gared et al. ", sep = "", sample(1990:2020, 1)," "),
              paste(sample(Author_list,1), " et al. ", sep = "", sample(1990:2020, 1)," "),
              paste(sample(Author_list,1), " et al. ", sep = "", sample(1990:2020, 1)," "),
              paste(sample(Author_list,1), " et al. ", sep = "", sample(1990:2020, 1)," "),
              paste(sample(Author_list,1), " et al. ", sep = "", sample(1990:2020, 1)," "),
              paste(sample(Author_list,1), " et al. ", sep = "", sample(1990:2020, 1)," "),
              paste(sample(Author_list,1), " et al. ", sep = "", sample(1990:2020, 1)," "),
              paste(sample(Author_list,1), " et al. ", sep = "", sample(1990:2020, 1)," "),
              paste(sample(Author_list,1), " et al. ", sep = "", sample(1990:2020, 1)," "),
              paste(sample(Author_list,1), " et al. ", sep = "", sample(1990:2020, 1)," "),
              paste(sample(Author_list,1), " et al. ", sep = "", sample(1990:2020, 1)," ")
  )
  
  Opening <- c(
    paste("The ", sample(c("recent", "abundance of", "lack of", "recognition of", "uncovering of"),1), " evidence surrounding ", sample(nouns, 1)," point to a greater need for studies examining why", sample(points,1),". ", sep = ""),
    paste("For ",sample(c("the first time ever, ","generations, ", "millenia, ", "some researchers, ", "the time being, ",
                          "several decades, "), 1), sample(nouns, 1)," are being utilized in ways that may tell us how ", sample(points,1),". ", sep = ""),
    paste("There is ",sample(c("ample ", "growing ", "weak ", "limited ", "vastly overstated ", "understated "),1), "support for the claim that ", sample(points, 1),". ", sep = ""),
    paste("The work of ", sample(authors,1), " was ", sample(c("revolutionary", "misguided", "fundamental", "ahead of its time", "critical", "controversial"),1),  " in its establishment that ", 
          sample(nouns,1), " could contribute to our understanding of ", sample(nouns, 1),". ", sep = ""),
    paste("Studies ", sample(c("surrounding ","examining ", "investigating "),1), sample(nouns,1), " have typically focused on their interplay with ", sample(nouns,1), " and the resulting effects on ", sample(nouns,1),". ", sep = ""),
    paste("The establishment of ", sample(nouns,1), " as a model system for examining how ", sample(points,1), " has it's roots in historical studies on ", sample(nouns,1), ". ", sep = "")
    
  )
  
  Argue <- c(
    paste("Along similar lines, ", sample(authors, 1), "argues that ", sample(points, 1),". ", sep = ""),
    paste("There seems to be no compelling reason to argue that ", sample(points, 1),". ", sep = ""), 
    paste("As a rebuttal to this point, it could be argued that ", sample(points, 1),". ", sep = ""), 
    paste("There are ", sample(c("two ","three ","four ")), "main arguments that can be advanced to support ", sample(points, 1),". ", sep = ""), 
    paste("The underlying argument ", sample(c("in favor of ", "against ")), sample(nouns,1), " is that ", sample(points, 1),". ",sep = ""), 
    paste(sample(authors,1)," argue ",sample(c("in favor of ", "against ")), sample(nouns,1), " as follows: ", sample(points, 1),". ", sep = ""))
  
  
  Claim <- c(
    paste("In this paper, I put forward the claim that ", sample(points, 1),". ", sep = ""),
    paste(sample(authors,1), "develops the claim that ", sample(points, 1),". ", sep = ""),
    paste("There is ",sample(c("ample ", "growing "),1), "support for the claim that ", sample(points, 1),". ", sep = ""),
    paste(sample(authors,1), "findings lend support to the claim that ", sample(points, 1),". ", sep = ""),
    paste("Taking a middle-ground position, ", sample(authors,1), "claims that ", sample(points, 1),". ", sep = "")
  )
  
  Data <- c(
    paste("The data gathered in ", sample(authors,1), " suggest that ", sample(points,1),". ", sep = ""),
    paste("The data appears to suggest that ", sample(points,1), sep = ""),
    paste("The data yielded by this study provide convincing evidence that ", sample(points,1),". ", sep = ""),
    paste("A closer look at the data indicates that ", sample(points,1),". ", sep = ""),
    paste("The data generated by our experiments on ", sample(nouns,1), " are reported in Table 1. ", sep = ""),
    paste("The aim of this section is to generalize beyond the data and ", sample(points,1),". ", sep = "")
  )
  
  Debate <- c(
    paste(sample(authors,1),"has encouraged debate on how", sample(points,1), ". ",sep = ""),
    paste("There has been an inconclusive debate about whether ", sample(points,1),". ", sep = ""),
    paste("The question of whether ", sample(points,1), " has caused much debate in our profession over the years", sep =""),
    paste("Much of the current debate revolves around how", sample(points,1), sep = "")
  )
  
  Discussion <- c(
    paste("In this ", sample(c("section, ","chapter, "),1),"the discussion will point to ", sample(points,1), ". ", sep = ""),
    paste("The foregoing discussion implies that ", sample(points,1), ". ", sep = ""),
    paste("For the sake of discussion, I would like to argue that ",sample(points,1),". ", sep = ""),
    paste("In this study, the question under discussion is ", sample(points,1),". ", sep = ""),
    paste("In this paper, the discussion centers on ", sample(points,1),". ", sep = ""),
    paste("It is clear that ", sample(nouns,1)," lies at the heart of the discussion on ", sample(nouns,1),". ", sep = "")
  )
  
  Evidence <- c(
    paste("The available evidence seems to suggest that ", sample(points,1),". ", sep = ""),
    paste("On the basis of the evidence currently available, it seems fair to suggest that ",sample(points,1),". ", sep = ""),
    paste("There is overwhelming evidence for the notion that ",sample(points,1),". " ,sep = ""),
    paste("Further evidence ",sample(c("supporting ","against "),1), sample(points,1), " may lie in the findings of ", sample(authors,1),"who state,",sample(points,1),". ", sep = ""),
    paste("These results provide confirmatory evidence that ", sample(points,1),". ", sep = "")
  )
  
  Ground <- c(
    paste("I will now summarize the ground covered in this chapter by ", sample(points,1),". ", sep = ""),
    paste("On logical grounds, there is no compelling reason to argue that ", sample(points,1),". ", sep = ""),
    paste(sample(authors,1),"takes a middle-ground position and argues that ", sample(points,1),". ", sep = ""),
    paste("On these grounds, we can argue that",sample(points,1),". ", sep = ""),
    paste(sample(authors,1),"views are grounded on the assumption that ", sample(points,1),". ", sep = "")
  )
  
  Issue <- c(
    paste("This study is an attempt to address the issue of ", sample(nouns,1),". ", sep = ""),
    paste("In the present study, the issue under scrutiny is whether ", sample(points,1),". ", sep = ""),
    paste("The issue of whether ", sample(points,1), " is clouded by the fact that ", sample(points,1),". ", sep = ""),
    paste("To portray the issue in ", sample(authors,1), "’s terms, ",sample(points,1),". ", sep = ""),
    paste("Given the centrality of this issue, I will now detail how ", sample(points,1),". ", sep = ""),
    paste("This chapter is concerned with the issue of how ", sample(points,1),". ", sep = "")
  )
  Literature <- c(
    paste(sample(authors,1), "is prominent in the literature on how ", sample(points,1),". ", sep = ""),
    paste("There is a rapidly growing literature on ", sample(nouns,1), " which indicates that ", sample(points,1),". ", sep = ""),
    paste("The literature shows no consensus on how ", sample(points,1), " which means that ",sample(nouns,1), " could be the reason that ", sample(points,1), ". ", sep = ""),
    paste("The current literature on ", sample(nouns,1)," abounds with examples of ", sample(points,1),". ", sep = "")
  )
  
  # Resume work here
  Premise <- c( 
    paste("The main theoretical premise behind ", sample(nouns,1)," is that ", sample(nouns,1)," may be able to interact with ", sample(nouns,1),". ", sep = ""),
    paste("It may be true that ", sample(nouns,1)," and ",sample(nouns,1), " share an important premise: ", sample(points,1),". ", sep = ""),
    paste("We believe ", sample(nouns,1)," premised on the assumption that ",sample(points,1),". ", sep = ""),
    paste("The basic premises of ", sample(authors,1),"'s theory are predicated on ", sample(nouns,1),", ",sample(nouns,1),", and ",sample(nouns,1),". ", sep = ""),
    paste("The arguments against", sample(authors,1), "’s premise rest on two assumptions: ", sample(points,1),", and ",sample(points,1),". ", sep = "")
  )
  
  Research <- c(
    paste("This study draws on research conducted by ", sample(authors,1),"on ", sample(nouns,1), ". ", sep = ""),
    paste("Although there has been relatively little research on ", sample(nouns,1),". ", sep = ""),
    paste("In the last ", sample(c(1:10),1), "years, studies have provided ample support for the assertion that ", sample(points,1),". ", sep = ""),
    paste("Current research appears to validate the view that ", sample(points,1),". ", sep = ""),
    paste("Research on ", sample(nouns,1), " does not support the view that ",sample(points,1),". ", sep = ""),
    paste("Further research in this area may include ", sample(points,1),". ", sep = ""),
    paste("Evidence for ", sample(points,1), " is borne out by research that shows ", sample(points,1)),". ", sep = "",
    paste("There is insufficient research into" ,sample(points,1), " to draw any firm conclusions about ", sample(nouns,1),". ", sep = "")
  )
  
  View <- c(
    paste("The consensus view seems to be that ", sample(points,1)," when it comes to ", sample(nouns,1), ". ", sep = ""),
    paste(sample(authors,1),"propounds the view that ", sample(points,1),". ", sep = ""),
    paste("Current research on ", sample(nouns,1), sample(c(" does ", " does not "),1), "appear to validate such a view. ", sep = ""),
    paste("There have been dissenters to the view that ",sample(points,1),". ", sep = ""),
    paste("The difference between ",sample(nouns,1),"and ", sample(nouns,1)," is not as clear-cut as popular views might suggest. ", sep = ""),
    paste("The view that ", sample(points,1),"is in line with our position that ",sample(points,1),". ", sep = ""),
    paste("I am not alone in my view that ", sample(points,1),". ", sep = ""),
    paste(sample(authors,1),"puts forward the view that ",sample(points,1),". ", sep = ""),
    paste(sample(authors,1),"may have an important position regarding ", sample(nouns,1),". ", sep = ""),
    paste(sample(authors,1),"s views rest on the assumption that ",sample(points,1),". ", sep = "")
  )
  
  
  test_text <- paste(sample(View,1),sample(View,1),sample(View,1),sample(View,1),sample(View,1))
  
  paper = paste(  
    sample(Opening,1),
    sample(Claim, 1),
    sample(Debate, 1),
    sample(Data, 1),
    sample(Evidence, 1),
    sample(Issue, 1),
    sample(Ground, 1),
    sample(Literature, 1),
    sample(Argue, 1),
    sample(Discussion, 1),
    sample(Claim, 1),
    sample(Debate, 1),
    sample(Data, 1),
    sample(Evidence, 1),
    sample(Issue, 1),
    sample(Ground, 1),
    sample(Literature, 1),
    sample(Argue, 1),
    sample(Discussion, 1),sep = " ")
  
  return(paper)
  
}

title_fun <- function(Noun_List) {
  
  # Formatting Input as List
  #nouns = as.list(unlist(strsplit(input$Noun_List,split = ",")))
  nouns = Noun_List
  
  # First half of title (as "subject")
  first_half <- c(
    paste("Analysis of ", sample(nouns,1), sep = ""),
    paste("Elements of ", sample(nouns,1), sep = ""),
    paste("Modeling using ", sample(nouns,1), sep = ""),
    paste("Factors associated with ", sample(nouns,1), sep = ""),
    paste("The effect of ", sample(nouns,1), sep = ""),
    paste("Long-term changes in ",sample(nouns,1), sep = ""),
    paste("Monitoring of ", sample(nouns,1), sep = ""),
    paste("Novel Applications of ", sample(nouns,1), sep = ""),
    
    paste("Overuse of ", sample(nouns,1), sep = ""),
    paste("Influence of ", sample(nouns,1), sep = ""),
    paste("Contributions from ", sample(nouns,1), sep = ""),
    paste("The global spectrum of ", sample(nouns,1), sep = ""),
    paste("Estimating the effects of ", sample(nouns,1), sep = ""),
    paste("Evaluating variation in ", sample(nouns,1), sep = ""),
    
    paste("Dynamic change to ", sample(nouns,1), sep = ""),
    paste("Probing ", sample(nouns,1), sep = ""),
    paste("Intensive management of ", sample(nouns,1), sep = ""),
    paste("An integrated design and management strategy for ", sample(nouns,1), sep = ""),
    paste("Efficient, stable, and scalable ", sample(nouns,1), sep = ""),
    paste("Options for ", sample(nouns,1), sep = ""),
    
    paste("Theraputic effects of ", sample(nouns,1), sep = ""),
    paste("A review of ", sample(nouns,1), sep = ""),
    paste("A meta-analysis of ", sample(nouns,1), sep = ""),
    paste("Revisiting ", sample(nouns,1), sep = ""),
    paste("Establishing ", sample(nouns,1), sep = ""),
    
    paste("Removal of ", sample(nouns,1), sep = ""),
    paste("Addition of ", sample(nouns,1), sep = ""),
    paste("Questions regarding ", sample(nouns,1), sep = ""),
    paste("A hypothetical framework for ", sample(nouns,1), sep = ""),
    paste("Dependency of ", sample(nouns,1), sep = "")
    
  )
  
  
  # Second half of title as Subject response/description
  last_half <- c(
    paste(" contributes to variation in ", sample(nouns,1), sep = ""),
    paste(" and their ability to predict changes to ", sample(nouns,1), sep = ""),
    paste(" can predict changes to ",sample(nouns,1), sep = ""), 
    paste(" can cause ", sample(c("losses in ","gains in ", "differences in "),1), sample(nouns,1), sep = ""),
    paste(" as a source for ", sample(nouns,1), sep = ""),
    paste(" enhances responses to ", sample(nouns,1), sep = ""),
    paste(" is associated with ", sample(c("failure of ", "success of "),1), sample(nouns,1), sep = ""),
    paste(" from diverse groups of ",sample(nouns,1), sep = ""),
    paste(" after ", sample(nouns,1), " therapy"),
    paste(" as a conduit to ",sample(nouns,1), sep = ""),
    paste(" when averaging ",sample(nouns,1), sep = ""),
    paste(" for data-driven analyses of ", sample(nouns,1), sep = ""),
    
    paste(" by preventing ", sample(c("losses in ","gains in ", "differences in "),1), sample(nouns,1), sep = ""),
    paste(": recent updates "),
    paste(" in three dimensions"),
    paste(" and their values to human well-being"),
    paste(" using failed experiments"),
    paste(" of a novel design"),
    paste(" in labratory mice"),
    paste(" in complex networks"),
    paste(" with reduced side effects"),
    paste(": past, present and future"),
    paste(" during therapy"),
    paste(" after treatment"),
    paste(" over time"),
    paste(": ", toString(sample(1:9,1)), "0 years of lessons", sep = ""),
    
    paste(" to promote ", sample(nouns,1), sep = ""),
    paste(" can risk expansion of ", sample(nouns,1), sep = ""),
    paste(" can accumulate ", sample(nouns,1), sep = ""),
    paste(" may activate the ", sample(nouns,1)," pathway", sep = ""),
    paste(" in the ", sample(nouns,1), " receptor"))
  
  
  abstract_title <- paste(sample(first_half,1), sample(last_half,1), sep = "")   
  
  
  
  return(abstract_title)
  
}

# Define UI for application that draws a histogram
ui <- fluidPage(
  
  # theme
  theme = shinytheme("slate"),
  
  # Application title
  titlePanel("Abstract Generator"),
  
  h5("At least 15 nouns recommended"),
  # Sidebar with a slider input for number of bins 
  sidebarLayout(
    sidebarPanel( 
      
      
      # Text input for study subjects 
      textInput("Noun_individual","Input plural nouns below."),
        actionButton('add',"add"),
      br(),
      br(),
      h4("Current List of Terms"),
      textOutput('Noun_List'),
      
     # # Text input for any specific authors
     # textInput("Author_list","Authors names separated by ',' (not required)"),
      
     # Go Button to randomize Title
     actionButton("goButtontitle", "HIGH IMPACT TITLE"), #
     p("PUMP UP THOSE NUMBERS"), # 
     
      # Go Button to randomize Main Text
      actionButton("goButtontext", "STRAIGHT TO NATURE"),
      p("ACCEPTED NO REVISIONS"),
      
    ),
    mainPanel(
      
      span(textOutput("abstract_title"),style ="font-family: 'Yusei Magic'; font-size: 28px; font-style: bold"), 
     
      span(textOutput("paper"), style = "font-family: 'Yusei Magic'"), 
           width = 12)
    
    
  )
)

# Define server logic required to draw a histogram
server <- function(input, output) {
  
  # Generate text in response

Noun_List <- reactiveValues()
      observe({if(input$add >0){
        Noun_List$dList <- c(isolate(Noun_List$dList), isolate(input$Noun_individual))
        
      }
      })
     

  output$Noun_List <- renderPrint({
    Noun_List$dList
  })
  
    output$paper <- 
    eventReactive(input$goButtontext, {
    paper_fun(Noun_List = Noun_List$dList)
  })
  
  
  # Generate title in response
  output$abstract_title <- 
    eventReactive(input$goButtontitle, {
    title_fun(Noun_List = Noun_List$dList)
  })
  
  
  
}


# Run the application 
shinyApp(ui = ui, server = server)

