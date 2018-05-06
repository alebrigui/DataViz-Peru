## Plottings used 
distPlot <- function(data, col) {
  if(is.numeric(data[[col]])){
    ggplot(data, aes_string(x=col))+
      geom_histogram(aes(y=..density..),
                     colour="black", 
                     fill="white") +
      geom_density(alpha=.2, fill="#FF6666") +
      labs(x=col,
           y="Density") +
      ggtitle("Density Plot")+
      theme_light() +
      scale_color_manual(values = c("black", "#66D65C"), guide = FALSE)
  } else {
    ggplot(data, aes_string(x = col)) +
      geom_bar() +
      labs(x = col,
           y = "Count") +
      ggtitle(col) +
      theme_light() +
      theme(axis.text.x = element_text(angle = 45, hjust = 1)) +
      scale_color_manual(values = c("black", "#66D65C"), guide = FALSE)
  }
}

scatterPlot <- function(data, cols) {
  ggplot(data,aes_string(x = cols[1], y = cols[2])) +
    geom_point() + 
    stat_smooth() +
    labs(x=cols[1],y=cols[2]) +
    theme_light() +
    scale_color_manual(values = c("black", "#66D65C"), guide = FALSE)
}