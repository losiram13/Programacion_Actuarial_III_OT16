#clase 25/08/16
#crear vectores con la funci�n vector
x <- vector(mode="numeric", length = 5L)
x

#crear vectores con la funci�n c
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



#orden de coacci�n/cohersion explicita
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


z<- c("programaci�n", "actuarial","III")
as.numeric(z)
as.logical(z)
as.complex(z)


#lista (es como un vector... pero con vectores y c/u tiene su propia clase)

x <- list(1,"a",TRUE, 1+4i)
x
class(x)

#Matr�ces
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

