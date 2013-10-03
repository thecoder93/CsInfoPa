/****************************************************************************/
/*								LIBRERIE									*/
/****************************************************************************/
#include "MyLibrary.h"

/****************************************************************************/
/*								MAIN										*/
/****************************************************************************/
int main(){
	pnodo	*L	  = NULL,		/* lista delle adiacenze di G				*/
			P_in  = NULL,		/* pila con ordine dei vertici				*/
			P_out = NULL;		/* output della prima DFS, input della seconda */
	FILE *file;
	int n,						/* numero di vertici/elementi nel file		*/
		n_adiacenti,			/* numero di adiacenti di ogni elemento		*/
		adiacente,				/* vertice adiacente						*/
		i,j,					/* indici di scorrimento					*/
		*c,						/* array dei colori dei vertici				*/
		*d, *f,					/* tempi d e f di visita di un vertice		*/
		*p,						/* precedente di un vertice					*/
		count = 0;				/* contatore per i tempi di visita			*/



	/* === LETTURA DA FILE ================================================ */
	file = fopen("grafo_dfs.txt","rt");
	fscanf(file,"%d",&n);
	L  = (pnodo *) malloc (n*sizeof(struct nodo));
	for(i=0;i<n;i++)
		L[i]  = NULL;

	for(i=0;i<n;i++){
		fscanf(file,"%d",&n_adiacenti);
		for(j=0;j<n_adiacenti;j++){
			fscanf(file,"%d",&adiacente);
			inserisci_l(&L[i],adiacente);
		}
	}
	fclose(file);
	/* =========================================== FINE LETTURA DA FILE === */

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
	
	/* libero la memoria */
	free(L);
	free(c); free(d); free(f); free(p);

	return 0;
}
