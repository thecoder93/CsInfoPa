#include "..\A LIBRERIA\MyLibrary.h"

void main(){
	int n,
		min,Max,
		*m_idx,*M_idx,
		i,*v;
	printf("Inserisci la taglia del vettore: ");
	scanf("%d",&n);
	v = (int *) malloc (sizeof(int));
	printf("vettore generato di %d elementi\n",n);
	for (i=0;i<n;i++){
		v[i]=randint(1000);
	    printf("V[%d]=%d\n",i,v[i]);
	}
	minmax_index(v,n,&min,&Max,&m_idx,&M_idx);
	printf("\n minimo:  %d in posizione %d\n",min,m_idx-v);
	printf(" massimo:  %d in posizione %d\n",Max,M_idx-v);
}
