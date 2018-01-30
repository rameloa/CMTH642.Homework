health.check <- function(obs, data=USDAClean){
  # print(class(obs))
  # print(obs)
  # print(obs['Sodium'])
  # print(mean(data$Sodium))
  # # 
  # print(data$Sodium > mean(data$Sodium))
  # 
  #if(data[id,'Sodium'] > mean(data$Sodium) && data[id, 'Sugar'] > mean(data$Sugar) && data[id, 'TotalFat'] > mean(data$TotalFat)) return(FALSE)
  # class(data)
  meanSodium <- mean(data$Sodium)
  meanSugar <- mean(data$Sugar)
  meanFat <- mean(data$TotalFat)
  # if(obs['Sodium'] > mean(data$Sodium) && obs['Sugar'] > mean(data$Sugar) && obs['TotalFat'] > mean(data$TotalFat)) return(FALSE)
  if(as.numeric(obs['Sodium']) > meanSodium & as.numeric(obs['Sugar']) > meanSugar & as.numeric(obs['TotalFat']) > meanFat) return(FALSE)
  else return(TRUE)
}

#health.check(USDAClean)