for(att in c('Sodium', 'Calories','Protein','Sugar','TotalFat')){
  # high.att <- cat('High',att,sep='')
  browser()
  high.att <- paste('High',att,sep='')
  USDAClean[,high.att] <- as.numeric(USDAClean[,att] > mean(USDAClean[,att]))
}
