#include <stdio.h>
#include <stdlib.h>
#define N 10

int Q[N],
	H,
	T,
	check;

int enqueue(){
	int tmp;
	printf("Inserisci elemento: ");
	scanf("%d",&tmp);
	if( H == ( (T+1)%N ) ){
		fprintf(stderr,"Errore di overflow\n");
		return -1;
	}
	else
	{
		if ( H == -1)
			H = 0;
		T = (T+1)%N;
		Q[T] = tmp;
	}
	return 0;
}

int dequeue(){
	int tmp;
	if( H == -1 )
	{
		fprintf(stderr,"Errore di underflow\n");
		return -1;
	}
	else
	{
		if (H == T){
			H = -1; 
			T = -1;
		}
		else
			H = (H+1)%N;
		tmp = Q[H];
	}
	return tmp;
}

void stampa(){
	int i;
	printf("H = %d\t T= %d\n",H,T);
	printf("\nVettore: { ");
	if (H!=-1)
	{
		if (H<=T)
		{
			for (i=H;i<=T;i++)
				printf("%d ",Q[i]);
		}
		else
		{
			for (i=H;i<N;i++)
				printf("%d ",Q[i]);
			for (i=0;i<=T;i++)
				printf("%d ",Q[i]);
		}
	}
	printf("}\n\n");
	
}

int main(){
	int i,choice;
	/* inizializzazione */
	for (i=0;i<N;i++)
		Q[i]=0;
	H = -1;
	T = -1;
	check = 1;
	/* enqueue */
	while(check){
		printf("MENU\n");
		printf("0 -> Esci\n");
		printf("1 -> Enqueue\n"); 
		printf("2 -> Dequeue\n");
		printf("Inserisci scelta: ");
		scanf("%d",&choice);
		switch(choice){
			case 0:
			{
				printf("\nEXIT!\n");
				check=0;
				break;
			}
			case 1:
			{
				enqueue();
				break;
			}
			case 2:
			{
				printf("Elemento eliminato dalla coda = %d\n",dequeue());
				break;
			}
		}
		stampa();
	}
	return 0;
}
