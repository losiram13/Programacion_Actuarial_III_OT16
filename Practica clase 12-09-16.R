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
