#include <stdio.h>
#include <stdlib.h>
#include <math.h>

int main(){
	long unsigned int N,*vett,i,j;
	printf("Digita N: ");
	scanf("%d",&N);
	vett = (int *) malloc ((N+1)*sizeof(int));
	for(i=0;i<=N;i++)
		vett[i]=i;

	/* applichiamo l'algo		*/
	for(i=2;i<=sqrt(N);i++)
	/* for(i=2;i<=N;i++) */
		if(vett[i])
			for(j=i;i*j<=N;j++)
				vett[i*j]=0;

	/* stampiamo i primi interi <= N */
	for(i=0;i<=N;i++)
		if(vett[i])
			printf(" %d",vett[i]);
	printf("\n");
	return 0;
}