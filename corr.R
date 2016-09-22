

#Para obtener el coeficiente de correlación entre estas variables pueden ocupar la función cor().


corr<-function(directorio,horizonte=0){
  
  setwd("~/GitHub/Programacion_Actuarial_III_OT16/specdata")
  resultado<-numeric()
  completo<-integer()
  for(n in 1:322){
    data1 <- read.csv(paste(formatC(n,width = 3, flag = "0"), ".Csv",sep = ""), header = T)
    
    
    completo<-c(sum(complete.cases(data1[,2:3])))
    columnas <- data1[,2:3]
    casoscompletos<-complete.cases(columnas)
    j <- c(data1[,2:3][casoscompletos,])
    if(completo>=horizonte)
    {resultado<-c(resultado,cor(j$sulfate,j$nitrate))}
    else
    {resultado=0}
  }
  resultado
}


corr("specdata",0)