/****************************************************************************/
/*								LIBRARIES									*/
/****************************************************************************/
#include <stdio.h>
#include <stdlib.h>

/****************************************************************************/
/*							STRUCT DECLARATION								*/
/****************************************************************************/
typedef struct oggetto{
	char name;						/* nome dell'oggetto					*/
	int s;							/* spazio occupato (unità )				*/
	int v;							/* valore oggetto						*/
} oggetto;

/****************************************************************************/
/*							 GLOBAL VARIABLES								*/
/****************************************************************************/
#define N 5							/* numero di oggetti					*/
#define M 15						/* spazio massimo del sacco				*/
int indexes[M+1],					/* vettore scelte indici oggetti		*/
	count_rec = 0,
	count_din = 0,
	*Tab;							/* tabella memorizzazioni scelte ottime	*/
oggetto O[N] = {	{'A',  4, 10},
					{'B',  7, 25},
					{'C',  9, 13},
					{'D', 10, 25},
					{'E',  2,  8},	};

/****************************************************************************/
/*							FORWARD DECLARATIONS							*/
/****************************************************************************/
int knapsack_rec(int r);			/* versione ricorsiva					*/
int knapsack_din(int r);			/* versione ricorsiva dinamica			*/

/****************************************************************************/
/*									MAIN									*/
/****************************************************************************/
int main () {
	int i;
	Tab = (int *) malloc ((M+1) * sizeof(int));
	/* inizializzazione tabella */
	for(i=0;i<=M;i++)
		Tab[i] = -1;
	printf("\n---------------------------\n-      LISTA OGGETTI     -\n---------------------------\n");
	printf(" OGGETTO  VALORE\t  SPAZIO\n");
	for(i=0;i<N;i++)
		printf("\t%c\t\t  %2d\t\t%2d\n",O[i].name,O[i].v,O[i].s);

	knapsack_rec(M);
	printf("\nIl massimo valore ottenuto e' %d\n",knapsack_din(M));
	printf("\nNumero di ricorsioni con knapsack_rec = %d\n",count_rec);
	printf("Numero di ricorsione con knapsack_din = %d\n",count_din);
	
	printf("\n---------------------------\n-  LISTA OGGETTI SCELTI  -\n---------------------------\n");
	printf(" OGGETTO  VALORE\t  SPAZIO\n");
/*	for(i=M; i >= 1;i-O[indexes[i]].s)
		printf("   %c\t%2d\t%2d\n",O[indexes[i]].name,O[indexes[i]].v,O[indexes[i]].s);*/
	
	i=M;
	while(i)
	{
		printf("\t%c\t\t  %2d\t\t%2d\n",O[indexes[i]].name,O[indexes[i]].v,O[indexes[i]].s);
		i=i-O[indexes[i]].s;
	}
	return 0;
}

/****************************************************************************/
/*							  KNAPSACK RECURSIVE							*/
/****************************************************************************/
int knapsack_rec(int r){
	int i,t,max = 0;
	for(i=0;i<N;i++)
	{
		count_rec++;		
		if((r - O[i].s) >= 0)
			if( (t = O[i].v + knapsack_rec((r - O[i].s))) > max)
				max = t;
	}
	return max;
}

/****************************************************************************/
/*							   KNAPSACK DINAMIC								*/
/****************************************************************************/
int knapsack_din(int r){
	int i,t,max = 0;
	if(Tab[r] != -1)
		return Tab[r];
	else
	{
		count_din++;
		for(i=0;i<N;i++)
			if((r - O[i].s) >= 0)
				if( (t = O[i].v + knapsack_din(r - O[i].s) ) > max)
				{
					max = t;
					indexes[r] = i;
					Tab[r] = max;
				}
		return max;
	}
}
