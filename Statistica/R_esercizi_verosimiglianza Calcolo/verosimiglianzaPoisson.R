#----------------------------------------------------------------------------------
# Possibile (ma non necessariamente unica) soluzione del compito 7 assegnato
#----------------------------------------------------------------------------------

#----------------------------------------------------------------------------------
# TRACCIA
# Sia X una variabile casuale di Poisson con parametro lambda.
# Il numero di incidenti stradali osservati in 10 giornate senza pioggia scelte 
# a caso sulla strada Casilina è stato di:
#			4 0 6 5 2 1 2 0 4 3
# ● Costruire e rappresentare la funzione di verosimiglianza per tale campione 
#	di osservazioni
# ● Costruire e rappresentare la funzione di log-verosimiglianza per tale campione 
#	di osservazioni
#----------------------------------------------------------------------------------

#funzione di verosimiglianza della v.c. di Poisson
verosimPoisson <- function(teta, campione){
	n <- length(campione)
	fattore1 <- exp(-n * teta)
	fattore2 <- teta ^ sum(campione)
	fattore1 * fattore2
}

#in alternativa le 4 istruzioni usate potevano essere scritte su una sola riga
#come nella seguente versione della stessa funzione
#
#	verosimPoisson <- function(teta, campione){
#		exp(-length(campione) * teta) * (teta^sum(campione))
#	}

#funzione di log-verosimiglianza della v.c. di Poisson
logVerosimPoisson <- function(teta, campione){
	n <- length(campione)
	addendo1 <- -n * teta
	addendo2 <- sum(campione) * log(teta)
	addendo1 + addendo2
}

#in alternativa le 4 istruzioni usate potevano essere scritte su una sola riga
#come nella seguente versione della stessa funzione
#
#	logVerosimPoisson <- function(teta, campione){
#		(-length(campione) * teta) + (sum(campione) * log(teta))
#	}

#vettore dove memorizzo il campione osservato
campioneOsservato <- c(4, 0, 6, 5, 2, 1, 2, 0, 4, 3)

#prove di chiamate per la funzione di verosimiglianza
verosimPoisson(5, campioneOsservato)
verosimPoisson(7, campioneOsservato)
verosimPoisson(c(5, 7), campioneOsservato)

#prove di chiamate per la funzione di log-verosimiglianza
logVerosimPoisson(5, campioneOsservato)
logVerosimPoisson(7, campioneOsservato)
logVerosimPoisson(c(5, 7), campioneOsservato)

#definisco un vettore di teta stabilendo una griglia di valori sullo spazio parametrico
ascisse <- seq(0, 10, by=0.1)

#calcolo e normalizzo la funzione di verosimiglianza su tale griglia
ordinate <- verosimPoisson(ascisse, campioneOsservato)
ordinate <- ordinate / max(ordinate)
#
#rappresento graficamente la funzione di verosimiglianza ottenuta
plot(ascisse, ordinate, type="l",
	xlab=expression(theta),
	ylab=expression(paste("L(",theta,")")))

#calcolo e normalizzo la funzione di verosimiglianza sulla griglia
#costruita sullo spazio parametrico
logOrdinate <- logVerosimPoisson(ascisse, campioneOsservato)
logOrdinate <- logOrdinate - max(logOrdinate)
#
#rappresento graficamente la funzione di log-verosimiglianza ottenuta
plot(ascisse, logOrdinate, type="l",
	xlab=expression(theta),
	ylab=expression(paste("L(",theta,")")))


#rappresento graficamente la funzione di verosimiglianza e la funzione di log-verosimiglianza
#sullo stesso grafico
par(mfrow=c(2,1))
plot(ascisse, ordinate, type="l",
	xlab=expression(theta),
	ylab=expression(paste("L(",theta,")")))
plot(ascisse, logOrdinate, type="l",
	xlab=expression(theta),
	ylab=expression(paste("L(",theta,")")))
par(mfrow=c(1,1))

