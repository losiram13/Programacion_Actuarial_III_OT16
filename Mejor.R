setwd("C:/Users/marisol/Documents/GitHub/Programacion_Actuarial_III_OT16")

outcome <- read.csv("outcome-of-care-measures.csv", colClasses = "character") 
head(outcome) 
outcome[, 11] <- as.numeric(outcome[, 11]) 
    
hist(outcome[, 11]) 
    

mejor <- function(estado, resultado) {

    setwd("C:/Users/marisol/Documents/GitHub/Programacion_Actuarial_III_OT16")
    # Lectura de datos 
    datos<-read.csv("outcome-of-care-measures.csv",colClasses = "character")
   
    
# Revisi�n de la validez de estado y resultado 
    estados <-levels(factor(datos[,7]))
    
    if (estado %in% estados == F){
        stop("estado inv�lido")
        break  }
    
 
                
 
    if (resultado == "ataque"){
     enfe=TRUE
         colum=11
         }
    else if ( resultado =="falla" ){
           
          colum=17
            
         }
    else if (resultado =="neumonia"){
          
          colum=23
         }
    else 
    { stop("resultado invalido")}
    
    # Regresa el nombre del hospital con la tasa m�s baja de mortalidad de 30 d�as 
    tasahos<-datos[datos$State==estado,]
    datos2<-tasahos[,c(2,colum)]
    tasas<-as.numeric(datos2[,2])
    orden<-order(tasas,na.last = NA)
    orden1<-datos2[orden,]
    ordenfinal<-orden1[,2]==orden1[1,2]
    mejor1<-orden1[ordenfinal,]
    mejor2<-mejor1[order(mejor1[,1]),]
    mejorh<-mejor2[1,1]
    mejorh

    }


mejor("MD","falla")

    
    