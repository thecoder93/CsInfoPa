#----------------------------------------------------------------------------------
# Esempio di definizione della funzione di verosimiglianza per la v.c. di Bernoulli
#----------------------------------------------------------------------------------

#------------------------------------------------------------------------------------
#ALTERNATIVA 1: 
#usando la variabile casuale binomiale e i comandi di R per la relativa distribuzione
#di probabilità
#------------------------------------------------------------------------------------

#imposto il numero di lanci e il numero di successi
nLanci 	  <- 100
nSuccessi <- 80
#NOTA: 
#cambiare il valore del numero di successi per verificare come cambia graficamente
#la funzione di verosimiglianza risultante

#calcolo la probabilità di osservare nSuccessi su nLanci nel caso in cui il parametro
#del modello sia pari a 0.5 oppure a 0.8
dbinom(nSuccessi, nLanci, 0.5)
dbinom(nSuccessi, nLanci, 0.8)
#posso calcolare entrambi con un solo comando
dbinom(nSuccessi, nLanci, c(0.5,0.8))

#imposto una sequenza che va da 0 a 1 con passo 0.01
teta=seq(0, 1, by=0.01)
#verifico come cambia la probabilità di ottenere nSuccessi su nLanci per differenti 
#valori del parametro: funzione di verosimiglianza
funzVerosim <- dbinom(nSuccessi, nLanci, teta)
#rappresento graficamente la funzione di verosimiglianza
plot(teta, funzVerosim, type="l")

#funz. verosimiglianza vs logverosimiglianza
teta=seq(0, 1, by=0.01)
#funzione di verosimiglianza
funzVerosim <- dbinom(nSuccessi, nLanci, teta)
#funzione di log-verosimiglianza
logVerosim <- log(funzVerosim)
#e relative rappresentazioni grafiche
par(mfrow=c(2,1))
plot(teta, funzVerosim, type="l")
plot(teta, logVerosim, type="l")
par(mfrow=c(1,1))


#------------------------------------------------------------------------------------
#ALTERNATIVA 2: 
#attraverso la creazione di una funzione in R per la distribuzione di Bernoulli
#e la produttoria sul campione osservato dei valori di tale funzione
#di probabilità
#------------------------------------------------------------------------------------

#definiamo la distribuzione di bernoulli
distrBernoulli <- function(x, teta){
	(teta ^ x) * ((1 - teta) ^ (1-x))
}
#prova di chiamata
distrBernoulli(0, 0.8)
distrBernoulli(1, 0.8)
distrBernoulli(c(0,1), 0.8)

#definisco il vettore del campione osservato
campioneOsservato <- c(1,0,1,1,1,0,1,1,1,1)

#funz. verosimiglianza nel punto teta=0.2
prod(distrBernoulli(campioneOsservato, 0.2))
#funz. verosimiglianza nel punto teta=0.5
prod(distrBernoulli(campioneOsservato, 0.5))
#definisco un vettore di valori per teta (da 0 a 1 con passo 0.01)
teta <- seq(0, 1, by=0.01)
#e mi calcolo la funzione di verosimiglianza in corrispondenza
#di ciascun valore di teta
ordinata <- numeric(length(teta))
for(i in 1:length(teta)){
	ordinata[i] <- prod(distrBernoulli(campioneOsservato, teta[i]))
}
#plot funzione verosimiglianza
plot(teta, ordinata, type="l")

#plot funzione verosimiglianza vs funzione di log-verosimiglianza
par(mfrow=c(2,1))
plot(teta, ordinata, type="l")
plot(teta, log(ordinata), type="l")
par(mfrow=c(1,1))


#------------------------------------------------------------------------------------
#ALTERNATIVA 3: 
#attraverso la creazione di una funzione in R che definisce 
#direttamente le funzioni di verosimiglianza e di logVerosimiglianza
#per un modello di Bernoulli
#------------------------------------------------------------------------------------
verosimBernoulli <- function(numSuccessi, numProve, p){
	(p ^ numSuccessi) * ((1-p)^(numProve-numSuccessi))
}

#prove di chiamata
verosimBernoulli(8, 10, 0.8)
verosimBernoulli(8, 10, 0.2)
verosimBernoulli(8, 10, c(0.2,0.8))

#definisco un vettore di valori per teta (da 0 a 1 con passo 0.01)
teta <- seq(0, 1, by=0.01)
#calcolo la funzione di verosimiglianza nel caso di un campione
#di 10 osservazioni su cui sono stati osservati 8 successi
ordinate <- verosimBernoulli(8, 10, teta)
#e la rappresento graficamente
plot(teta, ordinate, type="l")
#uso di espressioni matematiche nelle etichette degli assi
plot(teta, ordinate, type="l",
     xlab=expression(theta),
     ylab=expression(paste("L(",theta,")")))

#confronto tra verosimiglianza assolute
#
#andamento della funzione al variare della frequenza relativa
#osservata di successi
#
#funzione di verosimiglianza nel caso di 1 campione di 10 osservazioni
#su cui è osservato 1 successo
plot(teta, verosimBernoulli(1, 10, teta), type="l",
     xlab=expression(theta),
     ylab=expression(paste("L(",theta,")")))
#funzione di verosimiglianza nel caso di 1 campione di 10 osservazioni
#su cui sono osservati 3 successi
lines(teta, verosimBernoulli(3, 10, teta), type="l", col="red")
#funzione di verosimiglianza nel caso di 1 campione di 10 osservazioni
#su cui sono osservati 5 successi
lines(teta, verosimBernoulli(5, 10, teta), type="l", col="green")
#funzione di verosimiglianza nel caso di 1 campione di 10 osservazioni
#su cui sono osservati 7 successi
lines(teta, verosimBernoulli(7, 10, teta), type="l", col="blue")
#funzione di verosimiglianza nel caso di 1 campione di 10 osservazioni
#su cui sono osservati 9 successi
lines(teta, verosimBernoulli(9, 10, teta), type="l", col="magenta")

#confronto tra verosimiglianze normalizzate
#
#andamento della funzione al variare della frequenza relativa
#osservata di successi
#
#funzione di verosimiglianza nel caso di 1 campione di 10 osservazioni
#su cui è osservato un solo successo ...
ordinata <- verosimBernoulli(1, 10, teta)
#... e sua normalizzazione
ordinata <- ordinata / max(ordinata)
plot(teta, ordinata, type="l",
     xlab=expression(theta),
     ylab=expression(paste("L(",theta,")"),
         col=1))
#funzione di verosimiglianza nel caso di 1 campione di 10 osservazioni
#su cui sono osservati 3 successi ...
ordinata <- verosimBernoulli(3, 10, teta)
#... e sua normalizzazione
ordinata <- ordinata / max(ordinata)
lines(teta, ordinata, type="l", col=2)
#funzione di verosimiglianza nel caso di 1 campione di 10 osservazioni
#su cui sono osservati 5 successi ...
ordinata <- verosimBernoulli(5, 10, teta)
#... e sua normalizzazione
ordinata <- ordinata / max(ordinata)
lines(teta, ordinata, type="l", col=3)
#funzione di verosimiglianza nel caso di 1 campione di 10 osservazioni
#su cui sono osservati 7 successi ...
ordinata <- verosimBernoulli(7, 10, teta)
#... e sua normalizzazione
ordinata <- ordinata / max(ordinata)
lines(teta, ordinata, type="l", col=4)
#funzione di verosimiglianza nel caso di 1 campione di 10 osservazioni
#su cui sono osservati 10 successi ...
ordinata <- verosimBernoulli(9, 10, teta)
#... e sua normalizzazione
ordinata <- ordinata / max(ordinata)
lines(teta, ordinata, type="l", col=5)
#aggiungiamo una legenda al grafico
legend("left",c("FREQUENZA RELATIVA",
                expression(paste(hat(theta),"=0.1")),
                expression(paste(hat(theta),"=0.3")),
                expression(paste(hat(theta),"=0.5")),
                expression(paste(hat(theta),"=0.7")),
                expression(paste(hat(theta),"=0.9"))),                
             col=c(0,1:5),pch=15)

#confronto tra verosimiglianze normalizzate
#
#andamento della funzione mantenendo costante la frequenza relativa
#osservata di successi nel campione ma aumentando il numero di osservazioni
#
#funzione di verosimiglianza nel caso di 1 campione di 10 osservazioni
#su cui sono osservati 3 successi ...
ordinata <- verosimBernoulli(3, 10, teta)
#... e sua normalizzazione
ordinata <- ordinata / max(ordinata)
plot(teta, ordinata, type="l",
     xlab=expression(theta),
     ylab=expression(paste("L(",theta,")"),
         col=1))     
#funzione di verosimiglianza nel caso di 1 campione di 50 osservazioni
#su cui sono osservati 15 successi ...
ordinata <- verosimBernoulli(15, 50, teta)
#... e sua normalizzazione
ordinata <- ordinata / max(ordinata)
lines(teta, ordinata, type="l", col=2)
#funzione di verosimiglianza nel caso di 1 campione di 100 osservazioni
#su cui sono osservati 30 successi ...
ordinata <- verosimBernoulli(30, 100, teta)
#... e sua normalizzazione
ordinata <- ordinata / max(ordinata)
lines(teta, ordinata, type="l", col=3)
#funzione di verosimiglianza nel caso di 1 campione di 500 osservazioni
#su cui sono osservati 150 successi ...
ordinata <- verosimBernoulli(150, 500, teta)
#... e sua normalizzazione
ordinata <- ordinata / max(ordinata)
lines(teta, ordinata, type="l", col=4)
#funzione di verosimiglianza nel caso di 1 campione di 750 osservazioni
#su cui sono osservati 225 successi ...
ordinata <- verosimBernoulli(225, 750, teta)
#... e sua normalizzazione
ordinata <- ordinata / max(ordinata)
lines(teta, ordinata, type="l", col=5)
#funzione di verosimiglianza nel caso di 1 campione di 1000 osservazioni
#su cui sono osservati 300 successi ...
ordinata <- verosimBernoulli(300, 1000, teta)
#... e sua normalizzazione
ordinata <- ordinata / max(ordinata)
lines(teta, ordinata, type="l", col=6)

#aggiungiamo una legenda al grafico
legend("right",c(expression(paste(hat(theta)," = 0.3")),
                "n = 10",
                "n = 50",
                "n = 100",
                "n = 500",                 
                "n = 750",                
                "n = 1000"),
             col=c(0,1:6),pch=15)

#la funzione di log-verosimiglianza calcolata come logaritmo
#della funzione di verosimiglianza
#
#definisco un vettore di valori per teta (da 0 a 1 con passo 0.01)
teta <- seq(0, 1, by=0.01)
#calcolo la funzione di verosimiglianza nel caso di un campione
#di 10 osservazioni su cui sono stati osservati 8 successi
ordinateV <- verosimBernoulli(8, 10, teta)
#calcolo la funzione di log-verosimiglianza applicando la trasformazione
#logaritmica alla funzione di verosimiglianza
ordinateLV <- log(ordinateV)

par(mfrow=c(2,1))
#rappresentazione grafica della funzione di verosimiglianza
plot(teta, ordinateV, type="l",
     xlab=expression(theta),
     ylab=expression(paste("L(",theta,")")))
#e della funzione di log-verosimiglianza
plot(teta, ordinateLV, type="l",
     xlab=expression(theta),
     ylab=expression(paste("l(",theta,") = ln[L(",theta,")]")))
par(mfrow=c(1,1))

#la funzione di log-verosimiglianza calcolata attraverso la definizione
#di una funzione 
logVerosimBernoulli <- function(numSuccessi, numProve, p){
	(numSuccessi * log(p)) + ((numProve-numSuccessi) * log(1-p))
}

#prove di chiamata
logVerosimBernoulli(8, 10, 0.8)
logVerosimBernoulli(8, 10, 0.2)
logVerosimBernoulli(8, 10, c(0.2,0.8))

#definisco un vettore di valori per teta (da 0 a 1 con passo 0.01)
teta <- seq(0, 1, by=0.01)
#calcolo la funzione di verosimiglianza nel caso di un campione
#di 10 osservazioni su cui sono stati osservati 8 successi
ordinate <- logVerosimBernoulli(8, 10, teta)
#e la rappresento graficamente
plot(teta, ordinate, type="l",
     xlab=expression(theta),
     ylab=expression(paste("l(",theta,") = ln[L(",theta,")]")))     
