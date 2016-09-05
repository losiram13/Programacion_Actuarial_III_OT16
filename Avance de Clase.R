#clase 25/08/16
#crear vectores con la función vector
x <- vector(mode="numeric", length = 5L)
x

#crear vectores con la función c
x <- c(0.5,0.6)
x

class(x)

x<- c(TRUE,FALSE, T, F)
x
class
y <- 5:10
x
class(x)
x<- 10:0
x
class(x)
class


x<- c(1+2i, 5, 3+9i, -4-5i)
x
class(x)


x<- c("a", "b", "c", "d")
x
class(x)

#Mezcla de objetos en un vector

y<- c(1.7, "a")   #caracter 
y
class(y)

y<- c(true,2)   #numerico
y 
class(y)


y<- c("a", True) #caracter
y
class(y)





y<- c(TRUE)
y
class(y)



#orden de coacción/cohersion explicita
#1 caracter
#2complejo
#3numerico
#4entero
#5logico


#coercion explicita
z<- 0:6
class(z)
as.numeric(z)
as.logical(z)
as.character(z)




z<- c(1+2i, 3+4i,8,0)
as.logical(z)


z<- c("programación", "actuarial","III")
as.numeric(z)
as.logical(z)
as.complex(z)


#lista (es como un vector... pero con vectores y c/u tiene su propia clase)

x <- list(1,"a",TRUE, 1+4i)
x
class(x)

#Matríces
m<- matrix(nrow=2, ncol=3)
m
dim(m)
attributes(m)
#cambio de dimensiones de 2*3 a 3*2
dim(m) <- c(3,2)
m

#crear una matriz con datos
m<-matrix(1:6, 3,2)
m
m<-matrix(1:6, 3,3,TRUE)
m
m<-matrix(1:10, 3,3,TRUE)
m
class(m)
str(m)



dim(m) z-c(2,5)  # esto va a producir un error 

x<- c(1,2,3)
y<- c("a","b","c")
z<- c(x,y)
z
class(z)

m1 <- rbind(m,y)
m1

m2 <- cbind(m,x)
m2

rbind(m1,y)

cbind(m2,y)


install.packages("rmarkdown")











#Clase 31-08-16
#Factores
x<- factor(c("si","no","si","no","si","no","si","no","hola"))
x

table(x)
unclass(x)


x<- factor(c("si","no","si","no","si","no","si","no","hola")),leves= c("si","no","hola")






#Valores faltantes
x<- c(1,2,NA, 10,3)
is.na(x)
is.nan(x)


x<- c(1,2,NaN, 10,3)
is.na(x)
is.nan(x)



#Data frames
x<- data.frame(Erick = 1:4, Lori= c(T,T,F,F))
x
row.names(x) <-c("Primero","Segundo","Tercero", "Cuarto") #poner nombre a filas
x
nrow(x)
ncol(x)
attributes(x)

names(x)<- c("Yareli","Karen")
x



#Los nombres no son exclusivos de los Data frames
x<- 1:3
names(x) #NULL
names(x) <- c("hugo", "Paco","Luis")
x

x<- list(a=1:10, b=100:91, c=51:60)
x
names(x)<- c("Seq1","Seq2","Seq3")
x


m<- matrix(1:4,2,2)
m
attributes(m)
dimnames(m) <- list(c("Fil1","Fil2"),c("Col1","Col2")) #Poner nombre a las filas de la matríz
m


r<- matrix(nrow=5,ncol=6)    #creamos una tabla tipo excel 
dimnames(r)<- list(c("1","2","3","4","5"),c("A","B","C","D","E","F"))
r



?factor


#Lectura de datos

getwd()
setwd("~/GitHub/Programacion_Actuarial_III_OT16")
data<- read.csv("Datos_S&P.csv")
data<- read.table("Datos_S&P.csv",T,",")
data 
lapply(read.table("Datos_S&P.csv",T,","),class)  
#Lapply sirve para aplicar alguna función a una lista de datos, 
#como en este ejemplo para conocer la clase de cada lista en la base de datos 


getwd()
setwd("~/GitHub/Programacion_Actuarial_III_OT16")
data<- read.csv("Datos_S&P.csv")
data<- read.table("Datos_S&P.csv",T,",",nrows=100)
clases<- sapply(data,class)
data<- read.table("Datos_S&P.csv",T,",",colclasess=clases)

view(data)


# uso de dput y dget
# dump= pueden crear formatos editables en texto que son bastate recuperables = dput; preservan la "metadata", para que otros usuarios no tengan que especificarla otra vez.

 y<- data.frame(a=1, b="a")
 
 dput(y)
 
dput(y, file="y.R")

nueva.y<-dget("y.R")
y
nueva.y

x<- "Programación Actuarial III"
y<- data.frame(a=1, b="a")
dump(c("x","y"),file = "data.R")
rm(x,y) #remover-borrar
source("data.R")

dput(airquality, file="airquality")   #guardar un archivo= dput(nombre del archivo. file=como se llama actualmente)

#file, abre ua conexion a un archivo
#con<-url("") "conecta con una pagina de internet
str(file)  # description= nombre del archivo,open=que es lo que quiero hacer(r=lectura, )


con<- url("http://www.fcfm.buap.mx/","r")
x<-readLines(con,7)
x
#--->writeLines("toma un vector de caracteristicas y escribe cada elemento en una linea a la vez en un archico de texto")lo gusrda en archivo dif.

###########################################################################################################
#Subconjuntos: extraer subconjuntos([ regresa un objeto de la misma clase del original, [[ extrae un elemento de una lista o data frame. solamente extrae un elemento, $ extrae elementos de una lista o data frame por nombre)


#creamos vector#
x<- c("a","b","c","c","d","e")
#veamos el vector
x

#extraemos elementos con []
x[1]   #toma el primer elemento
x[2]   # toma el segundo elemento
#tambien podemos extraer una secuencia de elementos
x[1:4]   #toma elementos del 1 al 4
#es posible extraer los elementos que cumplen una restriccion
x[x>"b"]   #toma los elementos que sean mayoresque b en orden alfabetico
#De manera equivalente se puede obtener un vector lógico 
u<- x=="c"   #toma los elemntos que sean iguales a c
u

x[u]   # muestra los elementos de u

#creamos una lista
x<- list(foo=1:4,bar=0.6)
#extraemos el primer elemento de la lista,
#este elemento es ua lista que contiene una secuencia
x[1]

"extraemos nuevamente el primer elemento de la lista,
#ahora el elemento es la secuencia en sí"
x[[1]]
#extraemos un elemento por nombre
x$bar
x[["bar"]]
x["bar"]










































