#-------------------------------------------------------------------------------------
# Esempio di definizione della funzione di verosimiglianza per la v.c. binomiale
# (confronto tra la funzione di verosimiglianza nel caso sia noto il numero esatto
#  di successi nel campione vs il caso in cui sia noto solo un limite massimo di
#  successi)
#-------------------------------------------------------------------------------------

#------------------------------------------------------------------------------------
#ESERCIZIO: 
# Si supponga che 100 semi siano stati piantati. Il numero esatto di semi germogliati
# non è noto ma si sa solo che non più di 10 semi sono germogliati.
# 1) Costruire la funzione di verosimiglianza per tale problema assumendo l'indipedenza
# 2) Confrontare tale funzione con quella ottenuta nel caso in cui sia noto che 5 semi
# siano germogliati
#------------------------------------------------------------------------------------

#definisco le variabili dove imposto i valori forniti dalla traccia
numSemiGermogliati <- 5
numSemiSeminati <- 100
maxNumSemiGermogliati <- 10

#definisco un vettore di teta stabilendo una griglia di valori sullo spazio parametrico
teta <- seq(0, 1, by=0.01)

#PUNTO 1
#usando i comandi di R per la funzione di ripartizione di una v.c. binomiale
#calcolo la funzione di verosimiglianza sulla grigia di valori fissati per teta
ordinate1 <- pbinom(maxNumSemiGermogliati, numSemiSeminati, teta)
#normalizzo la funzione di verosimiglianza
ordinate1 <- ordinate1 / max(ordinate1)
#e la rappresento graficamente
plot(teta, ordinate1, type="l",
	xlab=expression(theta),
	ylab=expression(paste("L(",theta,")")))


#PUNTO 2
#usando la funzione di R per la distribuzione di probabilità di una v.c. binomiale
#calcolo la funzione di verosimiglianza sulla grigia di valori fissati per teta
ordinate2 <- dbinom(5, numSemiSeminati, teta)
#normalizzo la funzione di verosimiglianza
ordinate2 <- ordinate2 / max(ordinate2)
#e la rappresento graficamente
lines(teta, ordinate2, col="red")

