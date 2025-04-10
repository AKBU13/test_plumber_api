# Plumber Api
install.packages("plumber")
# Utilisation de plumber
library(plumber)

#* plot histogram
#* @serializer png 
#* @get /plot
function() {
  rand <- rnorm(100)
  hist(rand)
}
#* sum num
#* @post /add
#* @param x:num 
#* @param y:num 
function(x, y) {
  x <- as.numeric(x)
  y <- as.numeric(y)
  list(resultat = x + y)
}

