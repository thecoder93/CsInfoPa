/****************************************************************************/
/*								LIBRERIE									*/
/****************************************************************************/
#include "MyLibrary.h"

/****************************************************************************/
/*								MAIN										*/
/****************************************************************************/
int main(){
	pnodo	*L	   = NULL,		/* lista delle adiacenze di G				*/
			*T     = NULL,		/* puntatore alla coda di L[i]				*/
			*Lt    = NULL,		/* lista delle adiacenze di Gt				*/
			*Tt    = NULL;		/* puntatore alla coda di Lt[i]				*/

	FILE *file;
	int i,j,					/* indici di scorrimento					*/
		n,						/* numero di vertici/elementi nel file		*/
		n_adj,					/* numero di adiacenti di ogni elemento		*/
		adj,					/* vertice adiacente						*/
		*c,						/* array dei colori dei vertici				*/
		*d, *f,					/* tempi d e f di visita di un vertice		*/
		*p;						/* precedente di un vertice					*/

	pnodo	P_in  = NULL,		/* pila con ordine dei vertici				*/
			P_out = NULL;	 /* output della prima DFS, input della seconda */

	/* === LETTURA DA FILE ================================================ */
	file = fopen("grafo_dfs.txt","rt");
	fscanf(file,"%d",&n);
	L  = (pnodo *) malloc (n*sizeof(struct nodo));
	T  = (pnodo *) malloc (n*sizeof(struct nodo));
	Lt = (pnodo *) malloc (n*sizeof(struct nodo));
	Tt = (pnodo *) malloc (n*sizeof(struct nodo));
	for(i=0;i<n;i++){
		L[i]  = T[i]  = Lt[i] = Tt[i] = NULL;
	}
	for(i=0;i<n;i++){
		fscanf(file,"%d",&n_adj);
		for(j=0;j<n_adj;j++){
			fscanf(file,"%d",&adj);
			enqueue(&T[i],adj);
			if(L[i]  == NULL)
				L[i] = T[i];
			enqueue(&Tt[adj],i);
			if(Lt[adj] == NULL)
				Lt[adj] = Tt[adj];
		}
	}
	free(T); free(Tt);		/* libero la memoria dei puntatori alle code	*/
	fclose(file);
	/* =========================================== FINE LETTURA DA FILE === */

	printf("ADIACENZE L\n");
	for(i=0;i<n;i++){
		printf("%d: ",i);
		print_l(L[i]);
	}
	printf("ADIACENZE Lt\n");
	for(i=0;i<n;i++){
		printf("%d: ",i);
		print_l(Lt[i]);
	}

	/* nella DFS dobbiamo inviare la pila dei vertici */
	for(i=n-1;i>=0;i--)
		push(&P_in,i);

	/* allocazione strutture per la DFS */
	c = (int *) malloc (n*sizeof(int));
	d = (int *) malloc (n*sizeof(int));
	f = (int *) malloc (n*sizeof(int));
	p = (int *) malloc (n*sizeof(int));

	/* === VISITA DFS === ALBERI DI VISITA DFS ============================ */
	printf("\nAlberi di visita DFS di G:\n");
	DFS(L, &P_in, &P_out, n, c, d, f, p);
	/* =========================================== FINE VISITA DFS ======== */
	
	/* === VISITA DFS === COMPONENTI FORTEMENTE CONNESSE ================== */
	printf("\nComponenti fortemente connesse di G:\n");
	DFS(Lt, &P_out, &P_in, n, c, d, f, p);
	/* =========================================== FINE VISITA DFS ======== */

	/* libero la memoria */
	free(L); free(Lt);
	free(c); free(d); free(f); free(p);

	return 0;
}
