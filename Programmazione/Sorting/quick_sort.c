/* QUICKSORT 
 *
 * O(n log n) nel caso medio 
 * O(n^2) nel caso pessimo
 *
 *
 * partition prende O(n)
 * quicksort viene richiamato almeno log n volte
 *
 * t(n) =	n=0 n=1 -> b
 *			n>1		-> f(n) + (1/n) * SUM( from i=1 to n of T(i-1) ) + T(n-i)
 *
 */

#include <stdio.h>
#include <stdlib.h>
#include <malloc.h>

#define RANDINT(N) rand()%N

scambia(int *v, int i, int j){
	int tmp;
	tmp = v[i];
	v[i] = v[j];
	v[j] = tmp;
}

/* O(n) */
int partition(int *v,int l, int r){
	int i,j,pivot,app;
	i=l-1;
	j=r;
	pivot = v[r];

	while(i<j){
		j--;
		while((j>i) && (v[j]>pivot)) j--;
		i++;
		while((v[i]<pivot)) i++;
		if (i<j) scambia(&v[0],i,j);
	}
	if (v[i] > pivot) scambia (&v[0],i,r);

	return(i);
}


void quicksort(int *v,int l,int r){
	int i;
	if (l<r){
		i=partition(v,l,r);
		quicksort(v,l,i-1);
		quicksort(v,i+1,r);
	}
}

main(){
		int i,n,*v;
	printf("inserisci taglia: ");
		scanf("%d",&n);
	v=(int *)malloc(n*sizeof(int));
	printf("vettore iniziale: ");
	for (i=0;i<n;i++){
		v[i]=RANDINT(50);
		printf("%d ",v[i]);	
	}
	quicksort(v,0,n-1);
	printf("\nvettore finale  : ");
	for (i=0;i<n;i++)
		printf("%d ",v[i]);
	printf("\n");
	
}
