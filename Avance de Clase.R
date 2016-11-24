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

y<- c(TRUE,2)   #numerico
y 
class(y)


y<- c("a", TRUE) #caracter
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


#lista (es como un vector... pero con vectores 
#  y c/u tiene su propia clase)

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
x
y<- c("a","b","c")
y
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


x<- factor"(c("si","no","si","no","si","no","si","no","hola"))","leves= c("si","no","hola")"






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
names(x) #NULL(osea que no tiene nombre)
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
r
dimnames(r)<- list(c("1","2","3","4","5"),c("A","B","C","D","E","F"))
r



?factor


#Lectura de datos

getwd()
setwd("~/GitHub/Programacion_Actuarial_III_OT16")
data<- read.csv("Datos_S&P.csv")
data
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
data<- read.table("Datos_S&P.csv",T,",", colClasses = clases)

view(data)


# uso de dput y dget
# dump= pueden crear formatos editables en texto que son bastate 
# recuperables = dput; preservan la "metadata", para que otros usuarios 
# no tengan que especificarla otra vez.

 y<- data.frame(a=1, b="a")
 y
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
#Subconjuntos: extraer subconjuntos([ regresa un objeto de la misma
# clase del original, [[ extrae un elemento de una lista o data frame.
# solamente extrae un elemento, 
#$ extrae elementos de una lista o data frame por nombre)


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
x
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

######################################################################3
#creamos una lista de 3 elementos
x<- list(foo=1:4, bar=0.6, baz="hola")
#extraemos el primer y tercer elemento de la lista
x[c(1,3)]


x[[c(1,3)]]

name<-"foo"
x[[name]]
x$name

#se pueden extraer elementos de los elementos extraídos
x<- list(a=list(10,12,14), b=list(3.14,2.81))
x[[c(1,3)]]
x[[1]][[3]]
x[[c(2,1)]]

#extraccion de un dato en una matriz
x<- matrix(1:6,2,3) 
x

x[1,2]
x[2,1]
x[1,]
x[,2]


#el resultado es una vector
x[1,2]
#con drop=FALSE, se mantiene la dimension y el resultado será una matriz
x[1,2,drop = FALSE]

x<- matrix(1:6,2,3)
x

#sidejamos solamente el espacio, el resultado será un vector
x[1,]

#si usamos drop=FALSE, el resultado será una matriz 
x[1, ,drop=FALSE]

#<3
x<- list(erfrkh = 1:5)
x$e   #extrae los elementos de e ya que su nombre empieza con e
x[["e"]] # extrae un elemento de la lista que sea e
x[["e",exact=FALSE]] #extrae los elementos de e por que especificamos que no tome e


#######valores faltantes##### 
airquality[1:6,] # extrae las filas del 1:6, y de todas las comulumnas
completos<- complete.cases(airquality)  #te da como resultado un 
#vector 

completos #true si estan completos y false si estan incompletos

airquality[completos,]  #toma los datos completos de todo el doc.
airquality[completos,][1:6,] #toma las primeras 6 filas completas

airquality[1:6,][completos,]


#colocar diferentes lineas en una sola separadas por ;

x<- 1:4; y<- 6:9
x+y
x>2 #hay algun numero en x mayores a dos
x>=2 #hay algun numero x mayores o iguales a 2
y==8
x*y
x/y

#si y tiene solo 8 elementos vuelve a tomar el mas pequeño de y 
x<- matrix(1:4,2,2);y<- matrix(rep(10,4),2,2)
x;y 

x*y
x/y
x%*%y


###3##-------------------------########
#estructuras de contol
#if else: probar una condicion
#for: ejecuta un ciclo de un determinado numero de veces
#while: ejecuta un ciclo mientras se cumpla una condicion
#repeat: ejecuta un ciclo infinito
#break; termina la ejecucion de un ciclo
# next: "salta" una iteración de un ciclo ---->en repit
#return: sale de una funcion 


x<-c("a","b","c","d")
for(i in 1:4){
  print(x[i])
}

for(i in seq_along(x)){
   print(x[i])
}

for(letra in x){
  print(letra)
}

for(i in 1:4) print(x[i]) #no se utiliza llaves por que  solo utilizé una condición.



s<- matrix(1:6,2,3)
s
for(i in seq_len(nrow(s))){
  for(j in seq_len(ncol(s))){
    print(s[i,j])
  }
}


#ciclo while: repetir instrucciones mientras no se cumple una condición

z<-5
while(z>=3 && z<=10){

  print(z)
moneda<-rbinom(1,1,0.5)  #rbinom crea numeros aleatorios
if(moneda==1){#caminata aleatoria
  z<- z+1
} else {
    z<- z-1
  }
}

#  rbinom(no. de datos, parametros, probabilidad de exito) genera numeros aleatorios
# == dice igual lógico
#&& operaciones con verdadero falso(condicion)
#& trabajamos con un vector y el resultado sera un vector



z<-5
while(z>=3 && z<=10){
  print(z)
  moneda<-rbinom(1,1,0.5)
  if(moneda==1){#caminata aleatoria
    z<- z+1
  } else {
    z<- z-1
  }
}

z<-5
while(z>=3 && z<=10){
  print(z)
  y<-c(y,z)
  moneda<-rbinom(1,1,0.5)
  if(moneda==1){#caminata aleatoria
    z<- z+0.5
  } else {
    z<- z-0.5
  }
}
y

plot(y,type="l")  #crea la grafica de el vector y

arriba=0
abajo=0
for (i in 1:100){
  z<-5
  while(z>=3 && z<=10){
    print(z)
    y<-c(y,z)
    moneda<-rbinom(1,1,0.5)
    if(moneda==1){#caminata aleatoria
      z<- z+0.5
    } else {
      z<- z-0.5
    }
  }
  y

if (z=10) {arriba<-c(arriba+1)}
else {abajo<-c(abajo+1)}

}
arriba
abajo

#estructura de control: repeat
x0<- 1
tol <- 1e-8
repeat{
  x1<- CalculaEstimado(x0)
  if(abs(x1-x0)< tol)
  {break}
  else
  {x0<-x1}
}

#se utiliza next para no hacer iteración en un ciclo
for(i in 1:100)
{if (1<=20)
{next}
  #otras instrucciones
  }


#creacion de Funciones (checar pag 42 y copiar)
suma2<- function(x,y)
{x+y}

mayor10<-function(x)
{validos<-x>10
x[validos]}
mayor10(56)

mayor<-function(x,n-10){
  x[x>10]
}

promedioCol<-function(x,quitarNA =TRUE){
  nc<-ncol(x)
  medias<-vector("numeric",nc)
  for (i in 1:nc){
    medias[i]<-mean(x[,i],na.rm=quitarNA)
  
  }
  medias
}


#evaluacion perezosa
f<- function(a,b){
a^2
}
f(2)
f<-function(a,b){
  print(a)
  print(b)
}
f(3)


# el argumento "..."
myplot<-function(x,y,type="l",...){
  plot(x,y,type = type,...)}

args(paste) #pega un texto con otro separado con un espacio sep=""
function(...,sep="",collapse=NULL)
  NULL


args(paste)
function(...,sep="",collapse=NULL)
  NULL

paste("a","b",sep=":")
paste("a","b",se=":")
  
args(cat)
funtion(...,file="",sep="",fill=FALSE,labels=NULL,append=FALSE)
NULL

?formatC

# source("funcion")= sirve para llamar una función en otra función


lm # esta guardado en stats
lm<- function(x){x*x}  # cambias la función
lm
rm(lm) #borra lo que hiciste por segunda vez 
lm


search() #orden a buscar alguna función, lista de entornos


#configurar el orden de los paquetes 

library(stats)
search()

#R sigue el Ámbito lexicológico o estático; ámbito dinámico
# Con ámbito léxico, un nombre siempre refiere a su entorno léxico local. esta es una propiedad del programa texto y se realiza independientemente de la llamada a la pila durante el tiempo de ejecución a través de la implementación del lenguaje.
# Debido a que esta correspondencia solo requiere un análisis del programa texto estático, este tipo de ámbito es también llamado ámbito estático.


#variable libre: no esta definida dentro de la funcion, pero son buscados en el entorno de trabajo e el que la funcion fue definida


hacer.potencia<- function(n)
{potencia<- function(x){
  x^n
}
potencia
}


#esta funcion regresa como resultado una funcion con su valor
cubica<-hacer.potencia(3)
cuadrada<-hacer.potencia(2)

cubica(3)
cuadrada(3)

#¿Qué es el entorno de una función?
ls(environment(cubica))
get("n",environment(cubica))
ls(environment(cuadrada))
get("n",environment(cuadrada))

#estatico vs dinamico

y<-10
f<-function(x){
  y<-2
  y^2+g(x)
  
}
g<-function(x){
  x*y
}

f(3)

#estandares de escritura
#   sangrías,longitud a 80 columas.
#   Archivos de texto.
#   Tamaño de las funciones: limitar a una sola actividad, leer datos separados, 
#                           procesarlos, generar reporte. 
#   Fechas y tiempo: fechas(clase: data);tiempos(clases: POSIXct/POSIXlt)
#POSIXct: entero muy grande; util para guardadr datos en un data.frame
#POSIXlt: es una lista y guarda un cojunto de información 

#Fechas y tiempos:
x<-as.Date("1970-01-01")
x
unclass(x)
unclass(as.Date("1970-01-02"))

date() #muestra fecha y hora
as.POSIXct("2016-09-26")


# funciones de ciclo:
# Lapply: aplica una fucion a toda una lista
#Sapply:
#Apply
#Tapply
#Mapply
#   coercionar(cambia de tipo el objeto; as.lista(x))
#      match.fun() = primero busca si existe una funcion con ese nombre,
#       .internal= lo resuelve como en c, lo devuelve en R

lapply
x<-list(a=1:5,b=rnorm(10000))
x
lapply(x,mean)
x<-list(a=1:5,b=rnorm(10),c=rnorm(10,1),d=rnorm(10,2))
lapply(x,mean)

x<-1:4
lapply(x,runif)  #runif(genera numeros aleatorios con distribucion uniform, entre 0 y 1)
x<-1:4
lapply(x,runif,max=15,min=5) #runif(genera numeros aleatorios con distribucion uniform,
# entre 5 y 15)


##  sapply(x,mean) (comparacion)
x<-list(a=1:5,b=rnorm(10),c=rnorm(10,1),d=rnorm(10,2))
lapply(x,mean)
sapply(x,mean)

x<-1:4
lapply(x,runif,max=15,min=5)
sapply(x,runif,max=15,min=5)

## Apply: evaluar una funcion
str(apply)
#margen 1= filas, margen 2= columnas en la matriz
x<-matrix(rnorm(200),20,10)
apply(x,2,mean)
apply(x,1,sum)

# opciones
rowSums=apply(x,1,sum)
rowMeans=apply(x,1,mean)
colSums=apply(x,2,sum)
colMeans=apply

#otras formas
x<- matrix(rnorm(200),20,10) # matrix genera no. aleatorios(200)
apply(x,1,quantile,probs=c(0.25,0.75))

a<-array(rnorm(2*2*10),c(2,2,10))
apply(a,c(1,2),mean)
rowMeans(a,dims=2)

#mapply, es como apply pero multivariante,aplica una funcion  en paralelo
#        a lo largo de un conjunto de argumentos.
list(rep(1,4),rep(2,3),rep(4,1))
mapply(rep,1:4,4:1)


#### vectorizar una función
noise<-function(n,mean,sd){
    rnorm(n.mean,sd)
    
}
noise(5,1,2)
noise(1:5,1:5,2)


mapply(noise,1:5,1:5,2)


#### tapply= tabla, aplicar
stri(tapply)  # x es un vector, index es un factor o una lista de factores,
# fun es la funcion, .... otros argumentos, simplify se debe simplificar el resultado

#gl crea niveles
x<- c(rnor(10),runif(10),rnorm(10,1))
f<- gl(3,10)
f
tapply(x,f,mean)


tapply(x,f,mean,simplify = F)

# str(split)
# function (x, f, drop = FALSE, ...); x es un vector, lista o data frame,
#  f es un factor o lista de factores,drop indica si los factores vacios deberian de omitirse
# split separa los datos de acuerdo a algun factor
x<- c(rnorm(10),runif(10),rexp(10))
f<-gl(3,10)
f
split(x,f)

lapply(split(x,f),mean)
library(datasets)
head(airquality) #los primeros seis elementos

base<-airquality
meses<-base$Month
split(base,meses)

#lo mismo que :
s<-split(airquality,airquality$Month)
lapply(s,function(x)colMeans(x[,1:3]))  # cuando aplicas promedio 
#a un objeto con datos faltantes el resultado será na
lapply(s,function(x)colMeans(x[,1:3],na.rm = TRUE))
sapply(s,function(x)colMeans(x[,1:4],na.rm=TRUE))

#split a mas de un nivel

##### Control de errores

#message: 
#warning: no detiene el codigo, indica que algo esta mal 
#error
#condition

log(-1)
#[1] NaN
#Warning message:
 #   In log(-1) : NaNs produced (el logaritmo de un numero negativo no existe)

imprimeMSJ<- function(x){
    if(x > 0)
        print("x es mayor 0")
    else
        print("x es menor o igual que 0")
    invisible(x)
}

imprimeMSJ(1)
imprimeMSJ()

imprimeMSJ2<-function(x){
    if(is.na(x))
        print("x es un valor faltante")
    
}




#       herramientas para depurar
#traceback: te dice cual fue la funcion donde se marco el error
#debug
#browser
#trace
#recover


#traceback
mean(x)
#Error in mean(x) : object 'x' not found(no existe x en el entorno de trabajo)
traceback()
lm(y~x)
traceback()

debug(lm)
lm(y~x)

debug(lm)

options(error=recover)
read.csv("perritosgay")

install.packages("swirl")


#### 05/10/16###
#str:  muestra una forma compacta de la estructura interna de un objeto 
str(str)
x<-rnorm(100)
str(x)
summary(x)
f<-gl(40,10)
f
str(f)
summary(f)
str(airquality)
s<-matrix(rnorm(100),10,10)
s
str(s)
r<-split(airquality,airquality$Month)
r
str(r)


###resumen estadistico = summary

#Generacion de Números aleatorios
#->rnorm: genera num. aleatorios con desv. estandar 1
#->dnorm= probabilidad de que una variable aleatoria de un valor especifico.
#->Pnorm:evalua la función de distribución en un punto
#->rpois: 

#   d: densidad
#   r: genera no, aleatorio
#   p: para distribucion acumulada (probabilidad menor o igual)
#   q: para el cuantil de una funcion


x<- rnorm(10) # crea 10 no. aleatorios
x
y<-rnorm(10,50,5)
y
summary(x)
summary(y)

set.seed(1) #establecer semilla=1
rnorm(5)
set.seed(2) #establecer semilla=2
rnorm(5)
set.seed(1)
rnorm(5)

normal1<-rnorm(10000)
normal2<-rnorm(10000,10,5)

hist(normal1) # crea un histograma de frecuencias de valores
summary(normal1)
hist(normal2)
summary(normal2)


rpois(10,1) #distribucion poisson
poisson1<-rpois(10000,1)
poisson2<-rpois(10000,10)
hist(poisson1)
hist(poisson2)
ppois(2,2)
ppois(4,2)
ppois(6,2)
hist(rpois(100000,2))

#contar los numeros en un intervalo
as.numeric(as.integer(probs*10000))/10

for(i in 0:11){dpois(1,2)}
for(i in 0:11){print(dpois(i,2))}

hist(runif(10000,10,20))# distribicion uniforme entre 10=min-20=max

set.seed(20)#semilla
x<-rnorm(100,0,1)
e<-rnorm(100,0,2)
y<-0.5+2*x+e
plot(x,y) #graficar(x,y)

z<-0.5+2*x
plot(x,z)
plot(z,y)


set.seed(10)
x<-rbinom(100,1,0.5)  # numero de exitos en una cierta cantidad de intentos, 
#                      (cuantas,tamaño de la mustra,probabilidad de exito)
e<-rnorm(100,0,2)
y<-0.5+2*x+e
summary(y)
plot(x,y,main="Modelo Lineal", col="dark red")  #titulo de la grafica,Col="color"
?plot
set.seed(10)
x<-rbinom(100,1,0.5)  # numero de exitos en una cierta cantidad de intentos, 
#                      (cuantas,tamaño de la mustra,probabilidad de exito)
e<-rnorm(100,0,2)
y<-0.5+5*x+e
summary(y)
plot(x,y,main="Modelo Lineal", col="dark red")  #titulo de la grafica,Col="color"

set.seed(10)
x<-rbinom(100,1,0.5)  # numero de exitos en una cierta cantidad de intentos, 
#                      (cuantas,tamaño de la mustra,probabilidad de exito)
e<-rnorm(100,0,1)
y<-0.5+2*x+e
summary(y)
plot(x,y,main="Modelo Lineal", col="dark red")  #titulo de la grafica,Col="color"


########## modelando,"Poisson"
set.seed(1)
x<-rnorm(100)
log.mu <-0.5+0.3*x
y<-rpois(100,exp(log.mu)) #rpois = poisson
summary(y)
plot(x,y,main="Modelo Poisson", col="forestgreen")


        ######## 10/10/2016
set.seed(1)
#muestreo:tomar al azar dentro de un grupo de valores

sample(1:10,4)
sample(1:5,4)
sample(LETTERS,5)
sample(1:10) # existen 10! formass de ordenar  #permutación
sample(1:10,replace=TRUE) # existen 10^10 formas de ordenar 

####### Perfilaje......
#   respone.¿Por qué mi codigo es lento?
#usar system.time(). toma una expresion arbitraria de R como argumento y 
#devuelve la cantidad de tiempo que se tarda en ejecutar la expresio en cpu(usertime),
#cuanto esperé (elapsed time).


system.time(readLines("http://www.fcfm.buap.mx"))

#system.time(readLines("http://www.fcfm.buap.mx"))
#user  system elapsed 
#0.72    0.56    1.29 


hilbert<-function(n){
    i<-1:n
    1/outer(i-1,i,"+")
}
    
x<-hilbert(1000) ### investigar que hace
system.time(x<-hilbert(1000))
system.time(svd(x))

# perfilador de R
> # funcion Rprof() inicia el perfilador de r
    # no correr sistem.time() y Rprof juntos
#Rprof revisa la linea de ejecucion periodicamente en intervalos regulares y 
    #tabula cuanto tiempo pasa cada función
    
    
    
    ###############################################################3
    
    #Limpieza y depuracion de datos
    
#Datos brutos: tal y como los encontramos
#Datos Procesdos: 
    #Datos ordenado:
#-> Datos brutos, Ordenados, Libro de codigo que escriba cada variable y los 
#valores que iene c/u

#Datos brutos, Un archivo binario que entrega como resultado una maquina de medición
# estos datos estan en el formato correcto si :
#   1.- no se utiliza software con los datos
#   2.- no se manipula ninguno de los valores de los datos
#   3.- no se remueve ningun valor de los datos
#   4.- no se resumen los datos de ninguna forma


# Datos ordendos:
# variable en una columna
# Cada observacion aparece en cada fila
# tabla para cada tipo de variable
# una columna que los vinculara

#tips
#-> incluir una fila al inicio con el nombre de las variables 
#-> haz los nombre de las variables entendibles
# -> guarda la informacion de una tabla por archivo

#Libro de codigo:
#-> informacion acerca de las  variables
#-> informacion acerca de la sintesis que se realizaron
#-> informacion acerca del diseño experimental utilizado

# Algunos tipos importante:
#-> un formato comun para este documento es un archivo de word/texto
#-> contener una seccion llamada "Diseño experimental"
#-> "Libro de codigos"



#ubicacion absoluta: 
#ubicaciones relativas: donde estoy ubicado, (~)



getwd()

tail(list.files(),2)
setwd("./testdir")

getwd()
setwd("../")
setwd("~")
#funciones  de busqueda y creacion de directorios
# file.exists("nombre del directorio") busca si existe un directorio con ese nombre
# dir.create("nombre del directorio") crea un directorio con ese nombre

if (file.exists("data")==FALSE){ 
    dir.create("data")
}

if (!file.exists("data")){
    dir.create("data")
}
file.exists("data")

#download.file(), descarga un archivo desde internet, ayuda a la replicación, parametros(url, )

#Carga de archivos
# read.table, es el principal para cargar y leer datos, flexible y robusta, requiere mas parametros
 
#Algunos parametros importantes:
# quote- le dice a r si existe un comentario (quote=""), no hay comentarios
# na.strings, establece que el caracter que corresponde a valores faltantes
# nrows, dice la cantidad de filas a leer del archivo
# skip- una cantidad de filas a evitar antes antes de iniciar la lectura

install.packages("rJava")
install.packages("xlsx")
library(rJava)



######  26-10-16  ############
#funcion Write
#formato XML: almacenar datos, 
# etiquetas: inicio, cierre, vacias


install.packages("XML")
library(XML)
url<-"http://www.w3schools.com/xml/simple.xml"
data<- xmlTreeParse(url, useInternalNodes = TRUE)
nodoRaiz<-xmlRoot(data)
xmlName(nodoRaiz)
names(nodoRaiz)

#extraccion de datos
xmlSApply(nodoRaiz,xmlValue)# te da lo que esta almacenado en ese nodo

# XPath:
# /nodo ,nodo de nivel superior
# //


#obtener precios y nombre+
xpathSApply(nodoRaiz,"//name",xmlValue)

xpathSApply(nodoRaiz,"//price",xmlValue)


# http://www.start.berkel


# Archivo Json: 
install.packages("jsonlite")
library(jsonlite)
jsonData<-fromJSON("http://api.github.com/users/Losiram13/repos")
names(jsonData)

jsonData$name

iris
#Conversion a json
myjson<- toJSON(iris, pretty = TRUE)
cat(myjson)

#conversion desde json a dataframe
iris2<- fromJSON(myjson)
head(iris2)

##########27-10-16############333
#Data.table hereda de dataframe todas las funciones que lo aceptan.
install.packages("data.table")
library(data.table)
DF=data.frame(x=rnorm(9),y=rep(c("a","b","c"),each=3),z=rnorm(9))
DF
DT=data.table(x=rnorm(9),y=rep(c("a","b","c"),each=3),z=rnorm(9))
head(DT,3)
tables()
DT[2,]
DT[DT$y=="a"] #datos que tengan valores igual a "a"

DT[DT$y=="b"]
DT[DT$y=="a"]
DT[c(2,3)]
DT[,c(2,3)]


#subconjunto de columnas
#el argumento que se pone despues de la coma es llamado una expresion
#en r una expresion es una coleccion de declaraciones delimitada por llaves
{x=1
y=5}
DT[,list(mean(x),sum(z))]
DT[,table(y)]
DT[,w:=z^2]
DT

DT2<-DT
DT[,y:=2]
DT
head(DT)
head(DT2)=tambien cambia los datos, si modificas el original
DT[,m:={tmp<-(x+z);log2(tmp+5)}]
DT
DT[,a:=x>0]
DT
DT[,b:=mean(x+w),by=a]
DT

set.seed(123)
DT<-data.table(x=sample(letters[1:3],1E5,TRUE))
DT[,.N,by=x] #crea una funcion .N y cuenta cuantas valores dio de cada variable




library(swirl)
install_from_swirl("Getting_and_Cleaning_Data")

Leaving swirl now. Type swirl() to resume.


# lectura oara trabajar con datos : http://vita.had.co.nz/papers/tidy-data.pdf


########09/11/16######
DT<- data.table(x=rep(letters[1:3],each=100),
y=rnorm(300))
setkey(DT,x) 
DT['a']

DT1<- data.table(x=c('a','a','b','dt1'),y=1:4)
DT2<-data.table(x=c('a','b','dt2'),z=5:7)
setkey(DT1,x);set2key(DT2,x)
merge(DT1,DT2) #variables que aparecen en una y otra tabla

set.seed(1)
df_gde<-data.frame(x=rnorm(1E6),y=rnorm(1E6))
file<-tempfile()
write.table(df_gde,file=file,row.names=F, col.names=T,sep="\t",quote=F)
system.time(fread(file))
system.time(read.table(file,header = T,sep="\t"))


##otro formato para bases de datos: (mySQL)
#bases de datos, Tablas 

install.packages("RMySQL")
library(RMySQL)
ucscDb<-dbConnect(MySQL(),user="genome",
                  host="genome-mysql.cse.ucsc.edu")
result<-dbGetQuery(ucscDb,"show databases;");dbDisconnect(ucscDb);
result


#######10/11/16##
#conectar a hg19 y listado de tablas
hg19<- dbConnect(MySQL(),user="genome",db="hg19", host="genome-mysql.cse.ucsc.edu")
tablas<-dbListTables(hg19)
length(tablas)
tablas[1:3]
#obtener dimensiones de una tabla en especifico
dbListFields(hg19,"affyU133Plus2")

#leer desde la tabla
affydata<-dbReadTable(hg19,)

dbDisconnect(hg19)


##16-11-16###
# HDF5 almacena una gran base  de datos, dif. clases de datos, guarda la informacion como si fueran carpetas 

source("http://bioconductor.org/biocLite.R")
biocLite("rhdf5") #instala los paquetes 
library(rhdf5)
created=h5createFile("example.h5") 
created

#copiar de diapositivas 
# 

### si pones a actualiza todos los paquetes en r###
h5write(c(12,13,14), "example.h5","foo/A",index=list(1:3,1)) #pone en la primer columna los datos del 12-14
h5read("example.h5","foo/A") 

#Webscraping. extraccion programada de informacion desde codigo HTML





####
set.seed(13435)
x<-data.frame("var1"=sample(1:5),"var2"=sample(6:10),"var3"=sample(11:15))
x
x<- x[sample(1:5),]
x
x$var2[c(1,3)]=NA
x[,1] # "=" # x[,"var2"]
x$var2[c(1:2)]
x[1:2,"var2"]

subset(x,x$var1<=3 & x$var3>11)
x[x$var1<=3 & x$var3>11,] #hace lo mismo que la anterior

# & = y, &&= te da el resultado en ambas columnas o una o otra 
x$var1<=3 & x$var3>11
x$var1<=3 && x$var3>11

which(x$var2>8)
x[which(x$var2>8),] #extraer las filas con esas caracteristicas
sort(x$var1,decreasing = TRUE) #ordenar 
sort(x$var1)

sort(x$var2,decreasing = TRUE,na.last = FALSE)
sort(x$var2,na.last = FALSE)
sort(x$var2,decreasing = TRUE,na.last = TRUE)
sort(x$var2,na.last = TRUE)
?sort

order(x$var1) #posicion del valor ordenado

x[order(x$var1),] # ordena de acuerdo a la variable var1 

x[order(x$var2,decreasing = T,na.last = FALSE),]

#plyr 
library(plyr)
arrange(x,var1)
arrange(x,desc(var1)) #ordenar de forma decresiente
x$var4<-rnorm(5) # crea otra variable en x
x
cbind(x,rnorm(5))
x


