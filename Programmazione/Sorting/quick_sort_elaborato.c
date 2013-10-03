#include <stdio.h>
#include <stdlib.h>
#include <malloc.h>
#include <time.h>

/*void scambia(void *a,void *b)
{
	void *temp;
	temp=*a;
	*a=*b;
	*b=temp;
}*/

int randint(int N)
{
	int rand_num = rand()%N;
	return rand_num;
}

int partition(int **v,int l, int r){
	int i, j, app; //pivot,
	i = l - 1;
	j = r + 1; // PIVOT = *v[r];
	for(;;)
	{
		while( (*v[--j] > *v[r]) );
		while( (*v[++i] < *v[r]) );
		if( j == 1 ) break;
		if( i >= j ) break;
		app = *v[i];
		*v[i] = *v[j];
		*v[j] = app;
	}
	app = *v[i];
	*v[i] = *v[r];
	*v[r] = app;
	return(i);
}

void quicksort(int **v,int l,int r){
	int i;
	if ( l < r ){
		i = partition(v,l,r);
		quicksort(v,l,i-1);
		quicksort(v,i+1,r);
	}
}

main(){
	int i,n,*v,**p;
	srand( (unsigned)time(NULL) );
	printf("inserisci taglia: ");
	scanf("%d",&n);
	v = (int *)malloc(n*sizeof(int));
	p = (int **)malloc(n*sizeof(int *));
	printf("vettore iniziale: ");
	for ( i=0 ; i<n ; i++ ){
		v[i] = randint(50);
		p[i] = &v[i];
		printf("%d ",*p[i]);	
	}
	
	quicksort(p,0,n-1);
	printf("\nvettore finale  : ");
	for ( i=0 ; i<n ; i++ )
		printf("%d ",*p[i]);
}
