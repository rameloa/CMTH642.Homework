ano.fn <- function(x){
  browser()
  return(sum(is.na(x)) <= 4)
}
apply(USDA, 1, ano.fn)

# 
# USDA <- USDA[apply(USDA, 1 ,function(x) { 
#   browser()
#   sum(is.na(x)) <= 4 )} 
#   , ] #6918 Records remain