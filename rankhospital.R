rankhospital <- function(estado, resultado, num = "mejor") {
    
    # Lectura de datos 
    datos <- read.csv("outcome-of-care-measures.csv",colClasses = "character")
   
    # Revisión de la validez de estado y resultado 
    estados <-levels(factor(datos[,7]))
    
    if (estado %in% estados == F){
        stop("estado inválido")
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
    
    # Regresa el nombre del hospital con el puesto dado de la tasa más   baja de mortalidad de 30 días 
    
    
    if (num=="mejor"){
    
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
    else if (num=="peor"){
        
        tasahos<-datos[datos$State==estado,]
        datos2<-tasahos[,c(2,colum)]
        tasas<-as.numeric(datos2[,2])
        orden<-order(tasas,na.last = NA)
        orden1<-datos2[orden,]
        n=nrow(orden1)
        ordenfinal<-orden1[,2]==orden1[n,2]
        
        mejor1<-orden1[ordenfinal,]
        mejor2<-mejor1[order(mejor1[,1]),]
        mejorh<-mejor2[1,1]
        mejorh
        }
    
        else if (0 < num & num<= length(tasahos<-datos[datos$State==estado,]))  {
            
            tasahos<-datos[datos$State==estado,]
            datos2<-tasahos[,c(2,colum)]
            tasas<-as.numeric(datos2[,2])
            orden<-order(tasas,na.last = NA)
            orden1<-datos2[orden,]
            n=num
            ordenfinal<-orden1[,2]==orden1[n,2]
            
            mejor1<-orden1[ordenfinal,]
            mejor2<-mejor1[order(mejor1[,1]),]
            mejorh<-mejor2[2,1]
            mejorh
            } 
    else if(num > length(tasahos<-datos[datos$State==estado,])){
        print(NA) }
  
    
}
