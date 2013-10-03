#include "MyLibrary.h"

#define N 5
#define M 7

/* MAIN */
int main()
{
	int i,
		T[N],			/* vettore dei vertici				*/
		Tpeso[N],		/* peso dei vertici					*/
		Archi_presi[M],	/* memorizzazione archi scelti		*/
		peso_tot = 0;	/* peso totale dell' MST			*/
	t_arco	*E = NULL,	/* vettore degli archi				*/
			**p;		/* puntatore al vettore degli archi	*/
	int n_a; /* numero archi */

	/* carica gli archi da file */
	FILE *f=fopen("grafo_kruskal.txt","rt");
	fscanf(f,"%d",&n_a);
	E = (t_arco *) malloc (n_a * sizeof(t_arco));
	for(i=0;i<n_a;i++)
		fscanf ( f , "%d %d %d" , &E[i].v, &E[i].w, &E[i].p);
	fclose(f);
	
	/* allocazione puntatori agli archi	*/
	p = (t_arco **) malloc (M*sizeof(t_arco *));
	/* assegnazione dei puntatori */
	for (i=0;i<M;i++){
		p[i]=&E[i];
	}
	/* ordinamento degli archi secondo i pesi */
	quicksort(p,0,M-1);

	/* vettore ordinato degli archi */
	printf("Archi ordinati per peso:\n");
	for(i=0;i<M;i++)
		printf(" v=%d <--> w=%d peso=%d\n",p[i]->v,p[i]->w,p[i]->p);
	
	for(i=0;i<N;i++){
		T[i]=i;				/* set di vertici */
		Tpeso[i]=1;			/* peso per la quickunion_pesata */
		Archi_presi[i]=0;	/* arco scelto per l'albero di ricoprimento */
	}

	/* preso ogni arco che collega due vertici	*/
	/* dobbiamo fare il find su questi			*/
	for(i=0;i<M;i++)
		if(quickunion_pesata(T,Tpeso,p[i]->v,p[i]->w)){
			Archi_presi[i]=1;
			peso_tot += p[i]->p;
		};

	printf("\nArchi scelti: [");
	for(i=0;i<M;i++)
		if(Archi_presi[i]==1)
			printf(" %d",i);
	printf("]\n");
	
	printf("\n PESO TOTALE MST = %d\n",peso_tot);
	return 0;
}
