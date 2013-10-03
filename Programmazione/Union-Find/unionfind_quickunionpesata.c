#include <stdio.h>
#define N 10

main(){
	int A[N][2],i,p,q,p_old,q_old,inserimenti;
	printf("Vettore iniziale: ");
	for (i=0;i<N;i++){
		A[i][1]=i;
		A[i][2]=1;
		printf("%d ",A[i][1]);
	}
	printf("\nCardin. iniziale: ");
	for (i=0;i<N;i++){
		printf("%d ",A[i][2]);
	}
	printf("\nInserisci una coppia: ");
	while((scanf("%d %d",&p,&q)==2)&&(inserimenti<(N-1))){
		p_old=p;
		q_old=q;
		//FIND p
		while(A[p][1]!=p)
			p=A[p][1];
		//FIND q
		while(A[q][1]!=q)
			q=A[q][1];
		//UNION PESATA
		if(p!=q){
			printf("%d e %d costituiscono coppia nuova\n",p_old,q_old);
			inserimenti++;
			if(A[p][2]<=A[q][2])
			{
				A[p][1]=q;
				A[q][2]+=A[p][2];
			}
			else
			{
				A[q][1]=p;
				A[p][2]+=A[q][2];
			}
		}
		printf("\nVettore modific.: ");
		for (i=0;i<N;i++){
			printf("%d ",A[i][1]);
		}
		printf("\nCardin. modific.: ");
		for (i=0;i<N;i++){
			printf("%d ",A[i][2]);
		}
		printf("\nInserisci una coppia: ");
	}
}
