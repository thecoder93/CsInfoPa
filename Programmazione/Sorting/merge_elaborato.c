// abbiamo un vettore che contiene i puntatori agli elementi del vettore originale
#include <stdio.h>
#include <stdlib.h>

int randint(int N)
{
	int random_number=rand()%N;
	return random_number;
}



merge(int **s1,int **s2, int dim1,int dim2){
	int k=0,i=0,j=0;
	int **S=(int **)malloc ((dim1+dim2)*sizeof(int *));
	while (k<dim1+dim2){
		if (i>=dim1){
			S[k++]=s2[j++];
			continue;
		}
		if (j>=dim2){
			S[k++]=s1[i++];
			continue;
		}
		if (*s1[i]<*s2[j])
			S[k++]=s1[i++];
		else
			S[k++]=s2[j++];
	}
	for (k=0;k<(dim1+dim2);k++)
		s1[k]=S[k];
	free(S);
}

mergesort(int **v,int dim)
{
	int **s1,**s2;
	if (dim>1){
		s1=&v[0];
		s2=&v[dim/2];
		mergesort(s1,dim/2);
		mergesort(s2,dim-(dim/2));
		merge(s1,s2,dim/2,dim-(dim/2));
	}
}
main()
{int n,i;
	printf("Inserisci la taglia del vettore\n");
	scanf("%d",&n);
	int v[n];int *p[n];
	for (i=0;i<n;i++){
		v[i]=randint(1000);
		printf("V[%d]:%d\n",i,v[i]);	
		p[i]=&v[i];
	}
	printf("\n\n");
	mergesort(p,n);

	for (i=0;i<n;i++)
		printf("V[%d]:%d\n",i,*p[i]);
}
