pti <- c("RJSONIO","jsonlite","RColorBrewer","ggiraph","scales","sp","shiny","leaflet","leaflet.extras","dplyr","rsconnect","ggplot2")
pti <- pti[!(pti %in% installed.packages())]
if(length(pti)>0){
    install.packages(pti)
}

library(RJSONIO)
library(jsonlite)
library(RColorBrewer)
library(ggiraph)
library(scales)
library(sp)
library(shiny)
library(leaflet)
library(leaflet.extras)
library(dplyr)
library(rsconnect)
library(ggplot2)

x <- readRDS("isbike_20201118 (1).rds")
y <- toJSON(x,pretty = TRUE)

cat(y)

z <- fromJSON(x)

z$dataList$bos=as.integer(z$dataList$bos)
z$dataList$dolu=as.integer(z$dataList$dolu)
z$dataList$lon=as.double(z$dataList$lon)
z$dataList$lat=as.double(z$dataList$lat)
z <- z$dataList %>% mutate(Bos_Ratio= (bos/(dolu+bos)))
z <- z %>% mutate(Bos_Ratio = replace(Bos_Ratio,is.nan(Bos_Ratio),0)) 

library(shiny)

# Define UI for application that draws a histogram
ui <- fluidPage(
    
    # Application title
    titlePanel("Availability ratio of ISBike Stations"),
    
    # Sidebar with a slider input for number of bins 
    sidebarLayout(
        sidebarPanel(
            selectInput("Parking_Area", "Select Parking Area", choices = c("All",z$adi),multiple = TRUE,selected = "All")
            ,
            
            sliderInput("Ratio",
                        "Select the minimum Availability Ratio:",
                        min = min(z$Bos_Ratio*100),
                        max = max(z$Bos_Ratio*100),
                        value = 75,
                        step = 5,
                        sep ="",
                        ticks = FALSE),
            
            p("Data was taken from the ", tags$a(href = "https://data.ibb.gov.tr/en/dataset/isbike-istasyon-durumlari-web-servisi", 
                                                 " IBB Open Data Portal", 
                                                 target = "_blank"), ),
            
            
        ),
        
        # Show a plot of the generated distribution
        mainPanel(
            tabsetPanel(type = "tab", 
                        tabPanel("Bar_Chart", plotOutput("distBar")),
                        tabPanel("Mapping", leafletOutput(outputId = "mymap")))
            
        )
    )
)

# Define server logic required to draw a histogram
server <- function(input, output) {
    
    output$mymap <- renderLeaflet({
        
        mydf <- z
        colnames(mydf)[3]="Parking_Area"
        colnames(mydf)[10]="Availability_Ratio"
        
        mydf <- mydf %>% filter(Availability_Ratio*100 >= input$Ratio[1])
        
        if(!("All" %in% input$Parking_Area) ){
            mydf <- mydf %>% filter(Parking_Area %in% input$Parking_Area) 
        }
        else 
        {mydf <- mydf}
        
        leaflet(mydf) %>% 
            setView(lng = 29, lat = 41, zoom = 10)  %>% #setting the view over ~ center of North America
            addTiles() %>% 
            addCircles(data = mydf, lat = ~ lat, lng = ~ lon, weight = 1, radius = ~(Availability_Ratio)*70, popup = ~as.character(input$Parking_Area), color = "#d3501d", fillOpacity = 2)
        
    })
    
    output$distBar <- renderPlot({
        
        mydf <- z
        colnames(mydf)[3]="Parking_Area"
        colnames(mydf)[10]="Availability_Ratio"
        
        if(!("All" %in% input$Parking_Area) ){
            mydf <- mydf %>% filter(Parking_Area %in% input$Parking_Area) }
        else 
        {mydf <- mydf}
        
        mydf <- mydf %>% filter(Availability_Ratio*100 >= input$Ratio[1])
        ggplot(mydf,aes(x=Parking_Area, y=Availability_Ratio)) +geom_bar(stat='identity',position="dodge",fill="#d3501d", colour="black")+geom_text(aes(label=label_percent(1)(Availability_Ratio)), position=position_dodge(width=0.9), vjust=-0.25)+ theme(axis.text.x = element_text(angle = 90, hjust = 1))
        
    })
}

# Run the application 
shinyApp(ui = ui, server = server)