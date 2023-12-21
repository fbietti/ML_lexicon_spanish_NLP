### Packages 
library(dplyr)
library(tidytext)
library(stringr)
library(ggplot2)
library(tm)
library(quanteda)
library(topicmodels)
library(syuzhet)
library(RColorBrewer)
library(textdata)
library(quanteda.textmodels)
library(quanteda.textstats)
library(quanteda.textplots)
library(quanteda.corpora)
library(readtext)
library(tibble)
library("caret")


library(XML)
library(xml2)
library(stringr)
library(stringdist)
library(stringi)
library("methods")

library(questionr)

############### SPANISH DICTIONARY
###############
#### 1 convert the HTML dictionary lexicon to an R object
#### a) import to R
dico_esp <- xmlParse(file = "senticon.es.xml")
##### b) convert to dataframe
dico_esp <- xmlToDataFrame(dico_esp)
class(dico_esp)
##### 2) the structure is weird, so...
##### create a column with positive words using the tokenization function
dico_esp1 <- dico_esp %>% 
  select(positive) %>% 
  unnest_tokens(word, positive) 
dico_esp1$sentiment <- "positive"
dico_esp_p <- dico_esp1
dico_esp_p$value <- 1
dico_esp_p$word <- gsub("_", " ", dico_esp_p$word)

#### ##### create a column with negative words using the tokenization function
dico_esp2 <- dico_esp %>% 
  select(negative) %>% 
  unnest_tokens(word, negative) 
dico_esp2$sentiment <- "negative"
dico_esp_n <- dico_esp2
dico_esp_n$value <- 1
dico_esp_n$word <- gsub("_", " ", dico_esp_n$word)

####### 3) create a single table with both columns... merged by rows...
####### two columns "word" and "sentiment" (+/-)
dico_espanol <- rbind(dico_esp1, dico_esp2)
dico_espanol
dico_espanol$word <- gsub("_", " ", dico_espanol$word)
dico_espanol

###### 4) add a third column of value to see what happens... it is always 1, either - or +, then the score is obtained based on the difference
dico_espanol$value <- ifelse(dico_espanol$sentiment == "positive", 1, 1)
dico_esp <- dico_esp[, -3]
dico_esp
######## 5) structure it as a dictionary to use with quanteda in the liwcalike function
sentiments_dico_esp <- as.dictionary(dico_espanol, format = c("tidytext"), separator = " ", tolower = FALSE)
sentiments_dico_esp
