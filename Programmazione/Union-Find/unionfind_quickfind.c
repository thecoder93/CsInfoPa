#include <stdio.h>
#define n 5
main()
{int v[n],i,app,p,q,r;
	for (i=0;i<n;i++)
		v[i]=i;
	printf("\n inserisci p e q:");
	while(scanf ("%d %d",&p ,&q)==2)
	{	if (v[p]==v[q]){
			printf("\n inserisci p e q:");
			continue;// find
		}
		printf("\n %d e %d costituiscono una nuova coppia",p,q);
			// union
			for(r=v[p],i=0;i<n;i++)
			{if (v[i]==r) 
				v[i]=v[q];
				printf(" %d ",v[i]);
			}
		printf("\n inserisci p e q:");
	}
}
