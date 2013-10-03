/****************************************************************************/
/*								LIBRERIE									*/
/****************************************************************************/
#include "MyLibrary.h"

/****************************************************************************/
/*								MAIN										*/
/****************************************************************************/
int main(){
	pnodo	*L	  = NULL,		/* lista delle adiacenze di G				*/
			P_in  = NULL;		/* pila con ordine dei vertici				*/
	FILE *file;
	int n,						/* numero di vertici/elementi nel file		*/
		n_adiacenti,			/* numero di adiacenti di ogni elemento		*/
		adiacente,				/* vertice adiacente						*/
		i,j,					/* indici di scorrimento					*/
		*c,						/* array dei colori dei vertici				*/
		*p,						/* precedente di un vertice					*/
		*d;						/* profondità di un vertice con BFS			*/


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

	/* nella BFS dobbiamo inviare la pila dei vertici */
	for(i=n-1;i>=0;i--)
		push(&P_in,i);

	/* allocazione strutture per la BFS */
	c = (int *) malloc (n*sizeof(int));
	p = (int *) malloc (n*sizeof(int));
	d = (int *) malloc (n*sizeof(int));

	/* === VISITA BFS ===================================================== */
	BFS(L,&P_in,n,c,p,d);
	/* =========================================== FINE VISITA BFS ======== */
	
	/* libero la memoria */
	free(L);
	free(c); free(p);

	return 0;
}
