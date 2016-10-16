rankingcompleto <- function(resultado, num = "mejor") { 
    # Lectura de datos 
    setwd("C:/Users/marisol/Documents/GitHub/Programacion_Actuarial_III_OT16")
    datos<-read.csv("outcome-of-care-measures.csv")
   
    datos[,2] <- as.character(datos[, 2])
    
    # Revisión de la validez de estado y resultado 
    

    
    if (resultado == "ataque"){
     
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
    
     
    # Para cada estado, encuentra el hospital con la posición dada. 
    dat <- numeric()
    estados <- levels(datos$State)
    t <- length(estados)
    for(i in 1:t) {
        est <- datos[estados[i] == datos$State,]
        tasa <- est[, colum]
        orden <- est[order(tasa, na.last = NA), ]
        primero <- orden[1,2]
        ultimo <- orden[nrow(orden),2]
        if(num == "mejor"){
            nombre <- primero}
        else if(num == "peor"){
            nombre <- ultimo}
        else {nombre <- orden[num, 2]}
        hospitales <- c(nombre, estados[i])
        dat <- append(dat,hospitales)
    }
    # Regresa un data frame con el nombre del hospital y la abreviatura # del nombre del estado al que pertenece.
    tabla <- matrix(dat,t,2,byrow = T)
    colnames(tabla) <- c("Hospital", "State")
    rownames(tabla)<- estados
    t <- data.frame(tabla)
    t
}
     
   