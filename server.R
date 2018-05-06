# server.R
source("plottings.R")

server <- function(input, output, sessions){
  
  data <- reactive(settlements)
  
  output$dist_col <- renderPlot({
    distPlot(ubiInBounds(),input$color)
  })
  
  output$dist_size <- renderPlot({
    distPlot(ubiInBounds(),input$size)
  })
  
  output$colsize <- renderPlot({
    scatterPlot(ubiInBounds(),c(input$color,input$size))
  })
  
  ### PLOTTING THE MAP
  ubiInBounds <- reactive({
    if (is.null(input$map_bounds))
      return(data()[FALSE,])
    bounds <- input$map_bounds
    latRng <- range(bounds$north, bounds$south)
    lngRng <- range(bounds$east, bounds$west)
    
    subset(data(),
           latitude >= latRng[1] & latitude <= latRng[2] &
             longitude >= lngRng[1] & longitude <= lngRng[2])
  })
  
  output$map <- renderLeaflet({
    leaflet() %>%
      addTiles() %>%
      setView(lng = -75.0152,lat = -9.1900, zoom = 5) # Sets the view on PERU
  })
  
  observe({
    colorBy <- input$color
    sizeBy <- input$size
    
    colorData <- data()[[colorBy]]
    
    if (is.factor(colorData)) {
      
      pal <- colorFactor("viridis", colorData)
      
    } else if(is.numeric(colorData)) {
      
      pal <- colorBin("viridis", colorData, 5, pretty = FALSE)
      
    }
    
    ## Defining the radius variable
    sizeData <- abs(data()[[sizeBy]])
    radius <- ( sizeData / max(sizeData, na.rm = T) ) * 30000
    
    leafletProxy("map", data = data()) %>%
      clearShapes() %>%
      addCircles(~longitude, ~latitude, radius=radius,
                 stroke=FALSE, fillOpacity=0.6, fillColor=~pal(colorData),
                 label = paste(paste(sizeBy,as.character(data()[[sizeBy]]),sep=" : "),
                               paste(colorBy,as.character(data()[[colorBy]]),sep=" : "),
                               sep="\n")) %>%
      addLegend("bottomleft", pal=pal, values=colorData, title=colorBy,
                layerId="colorLegend")
    
  })
}
