#include "MyLibrary.h"

#define N 10

/****************************************************************************/
/*                                   MAIN                                   */
/****************************************************************************/
int main(){
	pnodo L = NULL;
	int list_in,
		choice,						/* menu choice variable					*/
		check = 1;					/* menu loop variable					*/

	while(check){
		printf("\nMENU\n");
		printf("0 -> Esci\n");
		printf("1 -> Inserisci elemento\n"); 
		printf("2 -> Inverti lista\n");
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
				scanf("%d",&list_in);
				inserisci_l(&L,list_in);				
				break;
			}
			case 2:
			{
				inverti_l(&L);
				break;
			}
		}
		print_l(L);
	}
	return 0;
}
