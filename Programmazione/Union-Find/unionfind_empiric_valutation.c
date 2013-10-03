#include <stdio.h>
#include <stdlib.h>
#include <time.h>
#define N 100

/* FORWARD DECLARATIONS */
int randint();
int quickfind();
int quickunion();
int quickunion_weighed();

/* MAIN */
int main()
{
	int p,q,				/* inserted couple values								*/
		i,					/* array index											*/
		r1,r2,r3,			/* temp variables to check new couples					*/
		*A,					/* array of integer [0..N] for quickfind				*/
		*B,					/* array of integer [0..N] for quickunion				*/
		*C,					/* array of integer [0..N] for quickunion_weighed		*/
		*Cpeso;				/* array of integer peso [0..N] for quickunion_weighed	*/
	int new_couples=0;		/* new couples counter									*/
	int inserted_couples=0;	/* new inserted counter									*/
//	clock_t start1,end1,	/* time counters for quickfind							*/
//		    start2,end2,	/* time counters for quickunion							*/
//			start3,end3;	/* time counters for quickunion_weighted				*/

	/* arrays initialization */
	A=(int *)malloc(N*sizeof(int));
	B=(int *)malloc(N*sizeof(int));
	C=(int *)malloc(N*sizeof(int));
	Cpeso=(int *)malloc(N*sizeof(int));
		
	for (i=0;i<N;i++)
	{
		A[i]=i;
		B[i]=i;
		C[i]=i;
		Cpeso[i]=1;
	}
	// generazione seme randomicità al tempo
	srand((unsigned)time(NULL));

	while (new_couples<(N-1))
	{
		r1=0;
		r2=0;
		r3=0;
		p=randint();
		while ((q=randint())==p);
		inserted_couples++;
	    r1= quickfind(A,p,q);
		r2= quickunion(B,p,q);
		r3= quickunion_weighed(C,Cpeso,p,q);
		// NON DOVREMMO AVERE L'INCREMENTO SOLO SE R1+R2+R3==3?
		if ((r1+r2+r3)==3)
			new_couples++;
		/*printf("r1= %d \n", r1);
		printf("r2= %d \n", r2);
		printf("r3= %d \n", r3);*/
	}
	printf("Coppie inserite = %d\nNuove coppie    = %d\n",inserted_couples,new_couples);
	return 0;
}

/* FUNCTIONS */
int randint()//dobbiamo passare N perchè lo facciamo variare
{
	// divisione modulare per generare intero r=rand()%N perchè il resto è sempre compreso tra 0 e N-1
	int random_number=(int)(N*((double)rand()/RAND_MAX));
	return random_number;
}

int quickfind(int *A,int p,int q)
{
	int j,tmp;
	// FIND
	if (A[p]==A[q])
		return 0;
	// UNION
	for (tmp=A[p],j=0;j<N;j++)
	{
		if (A[j]==tmp)
			A[j]=A[q];
	}
	return 1;
}

int quickunion(int *B,int p,int q)
{
	//FIND p
	while(p!=B[p])
		p=B[p];
	//FIND q
	while(q!=B[q])
		q=B[q];
	if(p==q)
		return 0;
	// UNION
	B[p]=q;
	return 1;
}

int quickunion_weighed(int *C,int *Cpeso,int p,int q)
{
	//FIND p
	while(p!=C[p])
		p=C[p];
	//FIND q
	while(q!=C[q])
		q=C[q];
	if(p==q)
		return 0;
	// UNION
	if(Cpeso[p]<Cpeso[q]){
		C[p]=q;
		Cpeso[q]+=Cpeso[p];
	}else{
		C[q]=p;
		Cpeso[p]+=Cpeso[q];
	}
	return 1;
}
