library(shiny)
library(ggplot2)
load("ct.RData")
load("money.RData")
load("settle.RData")

shinyServer(function(input, output) {
  output$lossplot <- reactivePlot({ function() {
    if (input$n == "loss") {
      data <- data.frame(year = factor(ct$Year), money = Amount.Received)
    }
  }
    
    
    
    cols <- c(`Vehicle damage` = "#CC0066", `Property lost/stolen` = "#FF9900", `Other property damage` = "#00CC00", Injury = "#9900CC")
    ggplot(money, aes(x = Year, y = Amount.Received, order = order.reason)) + 
      geom_bar(stat = "identity", aes(fill = order.reason)) +
      scale_fill_manual(values = cols, name = "Reason for Lawsuit") +
      ggtitle("OU's Expenses for Lost Lawsuits") +
      scale_x_continuous(breaks = c(2009, 2010, 2011, 2012, 2013, 2014, 2015))+
      ylab("Money OU Paid after Decision")
  })

}
)