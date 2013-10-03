#include <stdio.h>
#include <stdlib.h>
#define N 10

int Q[N],
	H,
	T,
	check;


enqueue(void){
	int tmp;
	printf("Inserisci elemento: ");
	scanf("%d",&tmp);
	if(T==N-1){
		fprintf(stderr,"Errore di overflow\n");
		return 1;
	}
	else
	{
		T++;
		Q[T]=tmp;
	}
	return 0;
}

int dequeue(void){
	int tmp;
	if(T<H)
	{
		H=0;
		T=-1;
		fprintf(stderr,"Errore di underflow\n");
		return -1;
	}
	else
	{
		tmp = Q[H];
		H++;
	}
	return tmp;
}

main(){
	int i,choice;
	/* inizializzazione */
	for (i=0;i<N;i++)
		Q[i]=0;
	H=0;
	T=-1;
	check=1;
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
					system("cls");
					printf("\nEXIT!\n");
					check=0;
					break;
				}
			case 1:
				{
					system("cls");
					enqueue();
					break;
				}
			case 2:
				{
					system("cls");
					printf("Elemento eliminato dalla coda = %d\n",dequeue());
					break;
				}
		}
		printf("\nVettore: ");
		for (i=H;i<=T;i++)
			printf("%d ",Q[i]);
		printf("\n\n");

	}
	return 0;
}
