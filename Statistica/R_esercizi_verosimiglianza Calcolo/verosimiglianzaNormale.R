#----------------------------------------------------------------------------------
# Possibile (ma non necessariamente unica) soluzione del compito 6 assegnato
#----------------------------------------------------------------------------------

#----------------------------------------------------------------------------------
# TRACCIA - ESERCIZIO 1
# Sia X una variabile casuale normale con media mu e varianza pari ad 1.
# Si osserva il valore x = 2.45        
#    ● Scrivere la formulazione analitica della funzione di verosimiglianza 
#    ● Costruire e rappresentare la funzione di verosimiglianza basata 
#	sull'osservazione di x = 2.45
#    ● Scrivere la formulazione analitica della funzione di log-verosimiglianza 
#    ● Costruire e rappresentare la funzione di log-verosimiglianza basata 
#	sull'osservazione di x = 2.45
#----------------------------------------------------------------------------------

#definisco un vettore di teta stabilendo una griglia di valori sullo spazio parametrico
#NOTA: posso sfruttare quanto noto sulla distribuzione normale, ovvero che circa il
# 99.9% dei valori si trova tra (mu - 3 sigma) e (mu + 3 sigma)
teta <-seq(-1.55, 6.45, by=0.1)

# nel caso di una sola osservazione la funzione di verosimiglianza coincide
# con la funzione di densità
# è quindi possibile sfruttare la funzione dnorm
ordinate1 <- dnorm(2.45, teta, 1)
ordinate1 <- ordinate1 / max(ordinate1)

#rappresento graficamente la funzione di verosimiglianza ottenuta
plot(teta, ordinate1,type="l",
	xlab=expression(theta),
	ylab=expression(paste("L(",theta,")")))

#funzione di log-verosimiglianza
logOrdinate1 <- log(dnorm(2.45, teta, 1))
#in alternativa posso sfruttare il parametro log 
#(definito in ogni funzione di probabilità/densità di R)
logOrdinate1 <- dnorm(2.45, teta, 1, log=T)
#normalizzo la log-verosimiglianza
logOrdinate1 <- logOrdinate1 - max(logOrdinate1)
#e la rappresento graficamente
plot(teta, logOrdinate1,type="l",
	xlab=expression(theta),
	ylab=expression(paste("log L(",theta,")")))

#########################################################################################
# ALTERNATIVA 2
# definisco una funzione e non sfrutto dnorm
# non considero i fattori additivi (che non dipendono dal parametro)
#########################################################################################

#in alternativa posso definire una funzione aggiuntiva
#versione completa
verosimNormale <- function(x,media,sqm){
      fattore1  <- 1/(sqm*sqrt(2*pi))
      esponente <- 1/2*((x-media)/sqm)^2
      fattore1 * exp(-esponente)
}

#versione definita a meno del fattore moltiplicativo
#che non dipende dal parametro mu
#NOTA: si suppone che la varianza sia nota
verosimNormaleProporz <- function(x,media,sqm){
      esponente <- 1/2*((x-media)/sqm)^2
      exp(-esponente)
}

#calcolo e normalizzo la funzione di verosimiglianza "completa"
ordinateCompleta <- verosimNormale(2.45, teta, 1)
ordinateCompleta <- ordinateCompleta / max(ordinateCompleta)

#calcolo e normalizzo la funzione di verosimiglianza definita
#a meno del fattore di proporzionalità
ordinateProporz <- verosimNormale(2.45, teta, 1)
ordinateProporz <- ordinateProporz / max(ordinateProporz)

#rappresento sullo stesso grafico la funzione di verosimiglianza "completa" 
# (sia quella ottenuta sfruttando dnorm che quella ottenuta con la nuova
# funzione definita) e quella definita a meno del fattore moltiplicativo
plot(teta, ordinate1, type="l", 
	xlab=expression(theta),
	ylab=expression(paste("L(",theta,")")), col=1)
lines(teta, ordinateCompleta, type="p", pch=15, col=2)
lines(teta, ordinateProporz, type="p", pch=14, col=3)
#aggiungo una legenda al grafico
legend("topright",c("dnorm","verosimNormale","verosimNormaleProporz"),col=c(1:3),pch=15)

# NOTA:
# lo stesso procedimento può essere seguito per la funzione di log-verosimiglianza,
# ovvero, invece di sfruttare dnorm è possibile definire una funzione aggiuntiva
# Anche in questo caso si può eliminare il fattore additivo che non dipende dal
# parametro mu

#----------------------------------------------------------------------------------
# TRACCIA - ESERCIZIO 2
# Sia X una variabile casuale normale con media mu e varianza pari ad 1.
# Si osserva un valore di x ed è noto che: 0.9 < x < 4.
#    ● Costruire e rappresentare la funzione di verosimiglianza
#    ● Costruire e rappresentare la funzione di log-verosimiglianza
#----------------------------------------------------------------------------------

#in questo caso la verosimiglianza è definita attraverso la differenza tra le
#funzioni di ripartizione calcolate nei due estremi dell'intervallo
ordinate2 <- pnorm(4, teta, 1) - pnorm(0.9, teta, 1)
ordinate2 <- ordinate2 / max(ordinate2)
plot(teta, ordinate2, type="l",
	xlab=expression(theta),
	ylab=expression(paste("L(",theta,")")))

#funzione di log-verosimiglianza e sua normalizzazione
logOrdinate2 <- log(ordinate2)
logOrdinate2 <- logOrdinate2 - max(logOrdinate2)
plot(teta, logOrdinate2, type="l",
	xlab=expression(theta),
	ylab=expression(paste("log L(",theta,")")))

#----------------------------------------------------------------------------------
# TRACCIA - ESERCIZIO 3
# Sia X una variabile casuale normale con media mu e varianza pari ad 1.
# Si osserva il seguente campione di 5 osservazioni:
#	-0.34  		1.40 		2.38 		4.16  		4.65
#    ● Scrivere la formulazione analitica della funzione di verosimiglianza
#    ● Costruire e rappresentare la funzione di verosimiglianza per il campione 
#	di 5 osservazioni
#    ● Scrivere la formulazione analitica della funzione di log-verosimiglianza
#    ● Costruire e rappresentare la funzione di log-verosimiglianza per il campione 
#	di 5 osservazioni
#----------------------------------------------------------------------------------
#definisco un vettore per il campione osservato
campioneOsservato <-c(-0.34,1.40,2.38,4.16,4.65)

##################################################
# metodo "brutale"
# calcolo la funzione di densità in corrispondenza
# di ogni elemento del campione e poi ne faccio
# la produttoria
##################################################

#inizializzo a 1 la variabile dove vado a memorizzare il risultato finale
ordinateVerosimBrutale <- 1

#per ogni elemento del campione
for(i in 1:length(campioneOsservato)){
  #aggiorno la verosimiglianza facendo il prodotto tra il valore precedente
  #e quello calcolato per l'osservazione corrente
  ordinateVerosimBrutale <- ordinateVerosimBrutale * dnorm(campioneOsservato[i], teta, 1)
}

#normalizzo la funzione di verosimiglianza
ordinateVerosimBrutale <- ordinateVerosimBrutale / max(ordinateVerosimBrutale)
#e la rappresento
plot(teta, ordinateVerosimBrutale, type="l")
#il valore più verosimile coincide con la media del campione osservato
abline(v=mean(campioneOsservato))

##################################################
# metodo "elegante"
# definisco una funzione con il funzionale
# della funzione di verosimiglianza
##################################################
verosimElegante <- function(campione, media, sqm){
      fattore1  <- (1/(sqm*sqrt(2*pi))) ^ length(campione)
      esponente <- 1 / (2*sqm^2) * sum((campione - media)^2)
      fattore1 * exp(-esponente)
}

#versione definita a meno del fattore moltiplicativo che
#non dipende dal parametro incognito mu
verosimEleganteProporz <- function(campione, media, sqm){
      esponente <- 1/(2*sqm^2) * sum((campione - media)^2)
      exp(-esponente)
}

#calcolo la funzione di verosimiglianza usando la funzione "elegante"
ordinate3 <- numeric(length(teta))
for(i in 1:length(teta)){
  ordinate3[i] <- verosimElegante(campioneOsservato, teta[i], 1)
}
ordinate3 <- ordinate3 / max(ordinate3)

ordinate3Proporz <- numeric(length(teta))
for(i in 1:length(teta)){
  ordinate3Proporz[i] <- verosimEleganteProporz(campioneOsservato, teta[i], 1)
}
ordinate3Proporz <- ordinate3Proporz / max(ordinate3Proporz)

#rappresento sullo stesso grafico la funzione di verosimiglianza "completa" 
# (sia quella ottenuta con il metodo brutale che quella con il metodo elegante)
# e quella definita a meno del fattore moltiplicativo
plot(teta, ordinateVerosimBrutale, type="l", 
	xlab=expression(theta),
	ylab=expression(paste("L(",theta,")")), col=1)
lines(teta, ordinate3, type="p", pch=15, col=2)
lines(teta, ordinate3Proporz, type="p", pch=14, col=3)
#aggiungo una legenda al grafico
legend("topright",c("METODO","brutale","elegante","elegante e proporzionale"),col=c(0:3),pch=15)

#######################################################################
# funzione di log-verosimiglianza
# NOTA: anche in questo caso è possibile sfruttare il metodo brutale,
# quello elegante e quello elegante a meno del fattore additivo
# 
# è riportato solo il secondo dei tre
#######################################################################

#definisco la funzione di log-verosimiglianza per un campione di 
#osservazioni i.i.d. estratto da una v.c. normale
logVerosimElegante <- function(campione, media, sqm){
      addendo1 <- -length(campione)/2 * log(sqm^2)
      addendo2 <- - 1/(2*sqm^2) * sum((campione - media)^2)
      addendo1 + addendo2
}

#e calcolo la funzione di log-verosimiglianza per il campione osservato
logOrdinate3 <- numeric(length(teta))
for(i in 1:length(teta)){
  logOrdinate3[i] <- logVerosimElegante(campioneOsservato, teta[i], 1)
}
logOrdinate3 <- logOrdinate3 - max(logOrdinate3)
plot(teta, logOrdinate3, type="l", 
	xlab=expression(theta),
	ylab=expression(paste("log L(",theta,")")))
#----------------------------------------------------------------------------------
# TRACCIA - ESERCIZIO 4
# Confrontare le tre funzioni di verosimiglianza e le tre funzioni di 
# log-verosimiglianza ottenute negli esercizi precedenti.
#----------------------------------------------------------------------------------

#rappresento sullo stesso grafico le funzione di verosimiglianze per i tre casi:
# - CASO 1: è nota una sola osservazione e si sa che è pari a 2.45
# - CASO 2: è nota che una sola osservazione e si sa solo che si trova tra 0.9 e 4
# - CASO 3: è noto un campione di 5 osservazioni (la cui media è pari a 2.45)
plot(teta, ordinate1, type="l", 
	xlab=expression(theta),
	ylab=expression(paste("L(",theta,")")), col=1)
lines(teta, ordinate2, type="l", col=2)
lines(teta, ordinate3, type="l", col=3)
#aggiungo una legenda al grafico
legend("topright",c("valore 1 osservazione","intervallo 1 osservazione","campione dimensione 5"),col=c(1:3),pch=15)

#lo stesso per le tre funzioni di log-verosimiglianza
plot(teta, logOrdinate1, type="l", 
	xlab=expression(theta),
	ylab=expression(paste("log L(",theta,")")), col=1)
lines(teta, logOrdinate2, type="l", col=2)
lines(teta, logOrdinate3, type="l", col=3)
#aggiungo una legenda al grafico
legend("topright",c("valore 1 osservazione","intervallo 1 osservazione","campione dimensione 5"),col=c(1:3),pch=15)


