/****************************************************************************/
/*								LIBRARIES									*/
/****************************************************************************/
#include "MyLibrary.h"

/****************************************************************************/
/*									MAIN									*/
/****************************************************************************/
int main(){
	int choice,						/* menu choice variable					*/
		check = 1,					/* menu loop variable					*/
		queue_in,					/* input element to enqueue				*/
		dequeue_out;				/* output element from dequeue			*/

	pnodo Q = NULL;					/* queue head pointer					*/
	pnodo T = NULL;					/* queue tail pointer					*/
	
	while(check){
		printf("\nMENU\n");
		printf("0 -> Esci\n");
		printf("1 -> Enqueue\n"); 
		printf("2 -> Dequeue\n");
		printf("Inserisci scelta: ");
		scanf("%d",&choice);
		switch(choice){
			case 0:
				printf("\nEXIT!\n");
				check=0;
				break;
			case 1:
				printf("Inserisci elemento: ");
				scanf("%d",&queue_in);				
				enqueue(&T,queue_in);
				if (Q == NULL)
				{
					printf("prima volta\n");
					Q = T;
				}
				break;
			case 2:
				dequeue_out = dequeue(&Q);
				if(dequeue_out != -1)
					printf("\nElemento eliminato: %d\n",dequeue_out);
				if (Q == NULL)
					T = NULL;
				break;
			default:
				fprintf(stderr,"\nERRORE, scelta non consentito!\n");
				break;
		}
		print_q(Q);
	}
	return 0;
}
