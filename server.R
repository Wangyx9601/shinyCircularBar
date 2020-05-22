shinyServer(
  function(input, output){
  observe({
    if(input$submit1 > 0){
      cirBar.height <<- input$cirBarHeight
      cirBar.width <<- input$cirBarWidth
      
      output$ggplot <- renderPlot({ 
        data <- read.table(input$data$datapath, sep = ",", head = T)
        data$id <- as.numeric(row.names(data))
        label_data=data
        number_of_bar=nrow(label_data)
        angle= 90 - 360 * (label_data$id-0.5) /number_of_bar
        label_data$hjust<-ifelse( angle < -90, 1, 0)
        label_data$angle<-ifelse(angle < -90, angle+180, angle)
        ggplot(data, aes(x=as.factor(id), y=data[,2])) +
          geom_bar(stat="identity", fill=alpha(input$var1,0.7))+
          labs(title = input$circularbarplotTitle)+
          ylim(-50,70)+theme_minimal() +
          theme(plot.title=element_text(face="bold.italic",size=input$var4, color="black", hjust = 0.5, vjust = 1),
            axis.text = element_blank(),
            axis.title = element_blank(),
            panel.grid = element_blank(),
            plot.margin = unit(c(2, 1, 1, 1), "cm")
            ) +  
          coord_polar(start = 0) +
          geom_text(data=label_data, aes(x=id, y=data[,2]+5,label=data[,1], hjust=hjust),
          
                    color=input$var2, fontface="bold",alpha=0.6, size=input$var3, angle= label_data$angle,inherit.aes = FALSE )
      }, height = cirBar.height, width = cirBar.width)
      } else{
        NULL
      }
  })
    
    
  ## Download PDF file of circular barplot
  output$downloadggplot.pdf <- downloadHandler(
    filename = function(){paste('CircularBar.pdf')},
    content <- function(file){    
      data <- read.table(input$data$datapath, sep = ",", head = T)
      data$id <- as.numeric(row.names(data))
      label_data=data
      number_of_bar=nrow(label_data)
      angle= 90 - 360 * (label_data$id-0.5) /number_of_bar
      label_data$hjust<-ifelse( angle < -90, 1, 0)
      label_data$angle<-ifelse(angle < -90, angle+180, angle)
      p1 <- ggplot(data, aes(x=as.factor(id), y=data[,2])) +
        geom_bar(stat="identity", fill=alpha(input$var1,0.7)) +
        labs(title = input$circularbarplotTitle)+
        ylim(-50,70) +theme_minimal() +
        theme(plot.title=element_text(face="bold.italic", size="input$var4", color="black", hjust = 0.5, vjust = 1),
          axis.text = element_blank(),
          axis.title = element_blank(),
          panel.grid = element_blank(),
          plot.margin = unit(c(2, 1, 1, 1), "cm")
          ) +  
        coord_polar(start = 0) +
        geom_text(data=label_data, aes(x=id, y=data[,2]+5,label=data[,1], hjust=hjust),
                  color=input$var2, fontface="bold",alpha=0.6, size=input$var3, angle= label_data$angle, inherit.aes = FALSE )
      ggsave(file, plot=p1, width = input$cirBarWidth/72, height = input$cirBarHeight/72)
      },
    contentType = "application/pdf")
  
  
  ## Download svg file of circular barplot
output$downloadggplot.svg <- downloadHandler(
  filename = function(){paste('CircularBar.svg')},
  content <- function(file){    
    data <- read.table(input$data$datapath, sep = ",", head = T)
    data$id <- as.numeric(row.names(data))
    label_data=data
    number_of_bar=nrow(label_data)
    angle= 90 - 360 * (label_data$id-0.5) /number_of_bar
    label_data$hjust<-ifelse( angle < -90, 1, 0)
    label_data$angle<-ifelse(angle < -90, angle+180, angle)
    p2 <- ggplot(data, aes(x=as.factor(id), y=data[,2])) +
      geom_bar(stat="identity", fill=alpha(input$var1,0.7)) +
      labs(title = input$circularbarplotTitle)+
      ylim(-50,70) +theme_minimal() +
      theme(plot.title=element_text(face="bold.italic", size="input$var4", color="black", hjust = 0.5, vjust = 1),
            axis.text = element_blank(),
            axis.title = element_blank(),
            panel.grid = element_blank(),
#            plot.margin = unit(rep(-1,4), "cm")
            plot.margin = unit(c(2, 1, 1, 1), "cm")
            ) +  
      coord_polar(start = 0) +
      geom_text(data=label_data, aes(x=id, y=data[,2]+5,label=data[,1], hjust=hjust),
                color=input$var2, fontface="bold",alpha=0.6, size=input$var3, angle= label_data$angle, inherit.aes = FALSE )
    ggsave(file, plot=p2, width = input$cirBarWidth/72, height = input$cirBarHeight/72)
  },
  contentType = "application/svg")
}
)