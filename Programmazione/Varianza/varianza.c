#include <stdio.h>
#include <stdlib.h>
#define n 5

int main(){
	int i,x[n];
	float m=0;
	float s=0;
	for (i=0;i<n;i++){
		printf("\n inserisci elemento %d: ",i+1);
		scanf("%d",&x[i]);
		m += x[i];
		s += ( x[i] * x[i] );
	}
	m /= n;
	s = s/n - (m*m);
	printf("\n varianza %3.3f",s);
	printf("\n media %3.3f\n",m);
	return 0;
}
