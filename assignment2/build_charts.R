build_charts = function(dtm)
{  
 
  dtm1 = as.matrix(dtm)   # need it as a regular matrix for matrix ops like %*% to apply
  adj.mat = t(dtm1) %*% dtm1    # making a square symmatric term-term matrix
  diag(adj.mat) = 0     # no self-references. So diag is 0.
  a0 = order(apply(adj.mat, 2, sum), decreasing = T)   # order cols by descending colSum
  adj.mat = as.matrix(adj.mat[a0[1:50], a0[1:50]])   # taking the top 50 rows and cols only
  # windows()  # New plot window
  
require(ggplot2)
  
  source("https://raw.githubusercontent.com/ardcd/econometricsA/master/assignment2/build_barchart.R")
   source("https://raw.githubusercontent.com/ardcd/econometricsA/master/assignment2/build_wordcloud.R")
  # #build distill COG
   source("https://raw.githubusercontent.com/ardcd/econometricsA/master/assignment2/distill.cog.R")
  
  build_barchart(dtm)
  
  distill.cog(adj.mat, 'Distilled COG - TF',  5,  5)
  
  build_wordcloud(dtm,100,2,"word cloud")
   

}
