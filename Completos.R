completos<-function(directorio,id=1:332){
  setwd("~/GitHub/Programacion_Actuarial_III_OT16/specdata")
 completo<-integer()
    for(n in id){
      data1 <- read.csv(paste(formatC(n,width = 3, flag = "0"), ".Csv",sep = ""), header = T)
      columnas <- data1[,2:3]
      casoscompletos<-complete.cases(columnas)
      j <- data1[,2:3][casoscompletos,]
    
  
  completo<-c(completo,sum(complete.cases(data1[,2:3])))
    }
table<-data.frame(Id=id,Nobs=completo)
table
  }

completos("specdata",1:322)

