# Loading libraries/ dataset
library(googleVis)
library(shiny)
library(shinydashboard)
library(ggplot2)
library(leaflet)
library(data.table)
library(rgdal)

# Defining static variables

load("data\\model_input_settl")

data <- model_input_settl

col_num <- sapply(model_input_settl,is.numeric) 
names_all <- names(model_input_settl)
names_num <- names(model_input_settl)[col_num]