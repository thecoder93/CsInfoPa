#include <stdio.h>
#define N 10

main(){
	int A[N],i,p,q,p_old,q_old,inserimenti;
	printf("Vettore iniziale: ");
	for (i=0;i<N;i++){
		A[i]=i;
		printf("%d ",A[i]);
	}
	printf("\nInserisci una coppia: ");
	while((scanf("%d %d",&p,&q)==2)&&(inserimenti<(N-1))){
		p_old=p;
		q_old=q;
		//FIND p
		while(A[p]!=p)
			p=A[p];
		//FIND q
		while(A[q]!=q)
			q=A[q];
		//UNION
		if(p!=q){
			A[p]=q;
			printf("%d e %d costituiscono coppia nuova\n",p_old,q_old);
			inserimenti++;
		}
		for (i=0;i<N;i++){
			printf("%d ",A[i]);
		}
		printf("\nInserisci una coppia: ");
	}
}
