#include "..\A LIBRERIA\MyLibrary.h"

void main(){
	int n,m,M,
		*v,i;
	printf("Inserisci la taglia del vettore: ");
	scanf("%d",&n);
	v =	(int *) malloc (n*sizeof(int));

	printf("vettore generato di %d elementi\n",n);
	for (i=0;i<n;i++){
		v[i]=randint(1000);
	    printf("V[%d]=%d\n",i,v[i]);
	}
	

	minmax(v,n,&m,&M);
	printf("\n minimo:  %d\n",m);
	printf("\n massimo:  %d\n",M);
}
