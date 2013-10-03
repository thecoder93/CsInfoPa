/****************************************************************************/
/*								 LIBRARIES									*/
/****************************************************************************/
#include <stdio.h>
#include <stdlib.h>
#include <time.h>

#define randint(x) (rand()%x)
/****************************************************************************/
void scambia(int *a, int *b){
	int tmp;
	tmp = *a;
	*a = *b;
	*b = tmp;
}
/****************************************************************************/
int *permuta(int *permutazione, int dim){
	int i,j,k;
	if(permutazione == NULL)
		permutazione = (int *) malloc (dim*sizeof(int));
	
	for(i=0;i<dim;i++)
		permutazione[i] = i;

	for(i=0;i<10000;i++){
		k = randint(dim);
		j = randint(dim);
		scambia(&permutazione[k],&permutazione[j]);
	}

	return permutazione;
}


/****************************************************************************/
/*									MAIN									*/
/****************************************************************************/
int main(){
	int *permutazione = NULL,
		i,dim;

	srand((unsigned int)time(NULL));

	printf("Inserisci la dimensione della permutazione :");
	scanf("%d",&dim);

	permutazione = permuta(permutazione,dim);

	printf("permutazione = \n[");
	for (i=0;i<dim;i++)
		printf("%2d ",permutazione[i]);
	printf("]\n\n");

	free(permutazione);
	return 0;
}