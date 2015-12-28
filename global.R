library(tm)
library(wordcloud)
library(memoise)

getTDM <- function(f){
  text <- readLines(f$datapath,encoding = "UTF-8",skipNul = TRUE)
  
  myCorpus = Corpus(VectorSource(text))
  
  myCorpus = tm_map(myCorpus, content_transformer(tolower))
  myCorpus = tm_map(myCorpus, removePunctuation)
  myCorpus = tm_map(myCorpus, removeNumbers)
  myCorpus = tm_map(myCorpus, removeWords,
                    c(stopwords("SMART"), "thy", "thou", "thee", "the", "and", "but"))
  
  myDTM = TermDocumentMatrix(myCorpus,
                             control = list(minWordLength = 1,wordLengths=c(0,Inf)))
  
  m = as.matrix(myDTM)
  
  sort(rowSums(m), decreasing = TRUE)
}