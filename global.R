# Loading libraries/ dataset
library(googleVis)
library(shiny)
library(shinydashboard)
library(ggplot2)
library(leaflet)
library(data.table)
library(rgdal)

# Defining static variables

load("data\\settlements")

data <- settlements

col_num <- sapply(settlements,is.numeric) 
names_all <- names(settlements)
names_num <- names(settlements)[col_num]