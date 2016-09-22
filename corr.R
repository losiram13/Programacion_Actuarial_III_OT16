#Para obtener el coeficiente de correlación entre estas variables pueden ocupar la función cor().


corr<-function(directorio,horizonte=0){
  
  setwd("C:/Users/marisol/Documents/GitHub/Programacion_Actuarial_III_OT16/specdata")
  
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
  
  cd <- completos("specdata",1:332)
  
  
  complet <- cd[cd["Nobs"] > horizonte,]$Id
  resul <- numeric()
  for(n in complet){
    data1 <- read.csv(paste(formatC(n,width = 3, flag = "0"), ".Csv",sep = ""), header = T)
    
    comm <- data1[complete.cases(data1[,2:3]),]
    
    resul<-c(resul,cor(comm$sulfate,comm$nitrate))
    
  }
  resul
}
corr("specdata",18)

