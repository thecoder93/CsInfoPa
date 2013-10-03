/****************************************************************************/
/*								LIBRARIES									*/
/****************************************************************************/
#include "MyLibrary.h"

/****************************************************************************/
/*									MAIN									*/
/****************************************************************************/
int main()
{
	int choice,						/* menu choice variable					*/
	check = 1,						/* menu loop variable					*/
	pila_in,						/* input element to put in the pila		*/
	pop_out;						/* output element from pop				*/
	pnodo P = NULL;					/* pila head pointer					*/
	
	while(check){
		printf("\nMENU\n");
		printf("0 -> Esci\n");
		printf("1 -> Push\n"); 
		printf("2 -> Pop\n");
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
				printf("Inserisci elemento: ");
				scanf("%d",&pila_in);				
				push(&P,pila_in);
				break;
			}
			case 2:
			{
				pop_out = pop(&P);
				if(pop_out != -1)
					printf("\nElemento eliminato = %d\n",pop_out);
				break;
			}
		}
		print_p(P);
	}
	return 0;
}
