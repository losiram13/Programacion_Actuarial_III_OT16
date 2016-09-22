

mediacontaminante <- function(directorio,contaminante,id=1:322){
  setwd("~/GitHub/Programacion_Actuarial_III_OT16/specdata")
  datos<-numeric()
  
  for(n in id){
    data1 <- read.csv(paste(formatC(n,width = 3, flag = "0"), ".Csv",sep = ""), header = T)
    
    if(contaminante=="sulfate")
    {r<-data1[,2]
    datos<-c(datos,r)}
    else
    {n<-data1[,3]
    datos<-c(datos,n)}
  }
  mean(datos,na.rm=TRUE)
}
mediacontaminante("specdata","nitrate",23)
