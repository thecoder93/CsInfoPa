#include <stdio.h>
#include <stdlib.h>
#include <malloc.h>

#define N 100

int search (int *v, int k);
int maximum (int *v);
int minimum (int *v);
void visita(int *v, int i);
void inserisci(int *v, int t);



main()
{
	int *v; /* carichiamo il vettore di tipo int */
	int n,i,k,t;
	FILE *f;

	/* lettura da file biniario */
	f=fopen("input.bin","rb");
	fread(&n,sizeof(int),1,f);
	v = (int *) malloc (N*sizeof(int));
	fread(v,sizeof(int),n,f);
	/*for( i=0;i<n;i++)
		printf("%d ",v[i]);*/
	fclose(f);
	/*fine lettura da file binario */

	/*creo nodi fittizi inserendo -1*/
	for (i=n; i<N;i++)
		v[i]=-1;
	for( i=0;i<2*n;i++)
		printf("%d ",v[i]);

	/*cerco l'elemento utilizzando la procedura search*/
	printf("\nInserisci elemento da cercare: ");
	scanf("%d",&k);
	i=search(v,k); //passo il vettore e l'elemento da cercare
	if (i==-1)
		printf("\nElemento non trovato\n");
	else
		printf("\nElemento trovato in posizione=%d\n",i);
	
	/*Restituisce il valore minimo*/
	i=minimum(v);
	printf("\nL'elemento piu' piccolo e'= %d\n ",v[i]);

    /*Restituisce il valore massimo*/
	i=maximum(v);
	printf("\nL'elemento piu' grande e'= %d\n ",v[i]);

	printf("\n");
	/*Effettua una visita simmetrica ovvero figlio sx, padre, figlio dx*/
	visita(v,0);
	printf("\n");

	/*Inserisce l'elemento da noi richiesto*/
	printf("\nInserisci elemento da inserire: ");
	scanf("%d",&t);
	inserisci(v,t); 
	
	/*Effettuiamo nuovamente la visita con l'elemento inserito*/
	printf("\n");
	/*Effettua una visita simmetrica ovvero figlio sx, padre, figlio dx*/
	visita(v,0);
	printf("\n");
}
int search (int *v, int k)
{
	int i=0;

	while ((v[i]!=-1)||(v[i]!=k)||(i<N)) //esce non appena si verifica una sola delle condizioni
	{
		if (v[i]==k) //se trovo l'elemento..
			return i;
		else
			if (v[i] > k) // se l'elemento che cerchiamo è più piccolo*/
				i=(i*2)+1;
				
			if (v[i] < k) // se l'elemento che cerchiamo è più grande
				i=(i*2)+2;
		if (v[i]==-1) //se non trovo l'elemento
		{
			i=-1;
			return i;
		}
	}	
	
}
				
int maximum (int *v)
{ 
	int i=0;
	while (v[i]!=-1) //ci spostiamo più a destra possibile e ci fermiamo non appena troviamo un nodo fittizio
	{
		i=(i*2)+2;
	}
	return ((i-1)/2);
}

int minimum (int *v)
{ 
	int i=0;
	while (v[i]!=-1) //ci spostiamo più a sinistra possibile e ci fermiamo non appena troviamo un nodo fittizio
	{
		i=(i*2)+1;
		
	}
	return ((i-1)/2);
}

 
void visita(int *v, int i)
{
	if (v[i]!=-1)
	{
		visita(v,((2*i)+1));  //figlio sinistro
		printf("%d ",v[i]);   //stampa elemento
		visita(v, ((2*i)+2)); //figlio destro	
	}
}
  
void inserisci(int *v, int t)
{ 
	int i=0;
	while (v[i]!=-1)
	{
		if (v[i]>=t)
			i=(2*i)+1;
		else
			i=(2*i)+2;
	}
	v[i]=t;
}



		


