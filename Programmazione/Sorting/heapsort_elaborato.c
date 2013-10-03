// abbiamo un vettore che contiene i puntatori agli elementi del vettore originale
#include <stdio.h>
#include <stdlib.h>

int randint(int N)
{
	int random_number=rand()%N;
	return random_number;
}

heapift(int **v, int i, int size) //a partire da 2heap costruisco quello finale avente i come padre (forse)
{
	int l,		//index figlio sx
		r,		//index figlio dx
		max,	//max tra padre e figli
		*tmp,m;
	l = (2*i)+1;
	r = (2*i)+2;
	if (( l < size )&&( *v[l] > *v[i] ))
		m = l;
	else
		m = i;
	if ((r < size )&&( *v[r] > *v[m] ))
		m = r;
	if ( m != i )
	{
		tmp = v[i];
		v[i] = v[m];
		v[m] = tmp;
		heapift(v,m,size);
	}
}

buildheap(int **p, int size) //costruice un heap a partire da un vett casuale
{
	int i;
	for( i=(size/2-1); i>=0; i--)
		heapift(p,i,size);
	printf("\nbuild con size %d: ",size);
	for( i=0; i<size; i++)
		printf("%d ",*p[i]);	
}

heapsort(int **p, int size) //procedure of sort
{
	int i,*tmp,k;
	buildheap(p,size);
	for(i=(size-1);i>=0;i--)
	{ 	//for(k=0; k<size; k++)
			//printf("%d ",v[k]);	
		tmp=p[0];
		p[0]=p[i];
		p[i]=tmp;
		heapift(p,0,i);
	}	
}

main(){
	int i,n,*v,**p;
	printf("inserisci taglia: ");
		scanf("%d",&n);
	v=(int *)malloc(n*sizeof(int));
	p=(int **)malloc(n*sizeof(int *));
	
	printf("vettore iniziale: ");
	for (i=0;i<n;i++){
		v[i]=randint(50);
		printf("%d ",v[i]);
		p[i]=&v[i];		//vettore di puntatori che puntano a v
	}
	heapsort(p,n);
	printf("\nvettore finale  : ");
	for (i=0;i<n;i++){
		printf("%d ",*p[i]);	
	}
}
