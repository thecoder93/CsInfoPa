#include <stdio.h>
#include <stdlib.h>

int randint(int N)
{
	int random_number=rand()%N;
	return random_number;
}

heapift(int *v, int i, int size) //a partire da 2heap costruisco quello finale avente i come padre (forse)
{
	int l,		//index figlio sx
		r,		//index figlio dx
		max,	//max tra padre e figli
		tmp,m;
	l = (2*i)+1;
	r = (2*i)+2;
	if (( v[l] > v[i] ) && ( l < size ))
		m = l;
	else
		m = i;
	if (( v[r] > v[m] ) && (r < size ))
		m = r;
	if ( m != i )
	{
		tmp = v[i];
		v[i] = v[m];
		v[m] = tmp;
		heapift(v,m,size);
	}
}

buildheap(int *v, int size) //costruice un heap a partire da un vett casuale
{
	int i;
	for( i=(size/2-1); i>=0; i--)
		heapift(v,i,size);
	printf("\nbuild con size %d: ",size);
	for( i=0; i<size; i++)
		printf("%d ",v[i]);	
}

heapsort(int *v, int size) //procedure of sort
{
	int i,tmp,k;
	buildheap(v,size);
	for(i=(size-1);i>=0;i--)
	{ 	//for(k=0; k<size; k++)
			//printf("%d ",v[k]);	
		tmp=v[0];
		v[0]=v[i];
		v[i]=tmp;
		heapift(v,0,i);
	}	
}

main(){
	int i,n,*v;
	printf("inserisci taglia: ");
		scanf("%d",&n);
	v=(int *)malloc(n*sizeof(int));
	printf("vettore iniziale: ");
	for (i=0;i<n;i++){
		v[i]=randint(50);
		printf("%d ",v[i]);	
	}
	heapsort(v,n);
	printf("\nvettore finale  : ");
	for (i=0;i<n;i++){
		printf("%d ",v[i]);	
	}
}
