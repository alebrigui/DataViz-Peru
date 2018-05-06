#ui.R

navbarPage("Internet para Todos VIS", id="nav",
           
           tabPanel("Interactive map",
                    div(class="outer",
                        
                        tags$head(
                          # Include our custom CSS
                          includeCSS("styles.css"),
                          includeScript("gomap.js")
                        ),
                        
                        leafletOutput("map", width="100%", height="100%"),
                        
                        
                        absolutePanel(id = "controls", class = "panel panel-default", fixed = TRUE,
                                      draggable = F, top = 60, left = "auto", right = 20, bottom = "auto",
                                      width = 330, height = "auto",
                                      
                                      h2("Ubigeo explorer"),
                                      
                                      selectInput("color", "Color", names_all),
                                      plotOutput("dist_col", height = 200),
                                      selectInput("size", "Size", names_num),
                                      plotOutput("dist_size",  height = 200),
                                      plotOutput("colsize", height=250)            
                                      
                                      
                        )
                    )
                    )
           
           
)
