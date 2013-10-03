/****************************************************************************/
/*									LIBRERIE								*/
/****************************************************************************/
#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include <time.h>

/****************************************************************************/
/*								DICHIARAZIONE TIPI							*/
/****************************************************************************/
typedef struct t_arco{
	int v;	/* nodo partenza */
	int w;	/* nodo arrivo */
	int p;	/* peso dell'arco */
}t_arco;

/* LISTA - CODA - PILA */
typedef struct nodo *pnodo;
struct nodo{
	int inf;
	pnodo next;
};

typedef struct t_lista{
	int inf;
	struct t_lista *next;
}t_lista;

/****************************************************************************/
/*									SORTING									*/
/****************************************************************************/
int  compare(void *a, void *b);			/* ! scegliere quello appropriato !	*/
void heapsort(void **p, int size);
void mergesort(void **p, int dim);
void quicksort(void **v,int l,int r);

/****************************************************************************/
/*									MACRO									*/
/****************************************************************************/
int randint(int N);

/****************************************************************************/
/*									UNION-FIND								*/
/****************************************************************************/
int quickfind(int *A,int p,int q, int dim);
int quickunion(int *B,int p,int q);
int quickunion_pesata(int *C,int *Cpeso,int p,int q);

/****************************************************************************/
/*									MIN MAX									*/
/****************************************************************************/
void minmax(int *v,int dim,int *m, int *M);
void minmax_index(int *v, int dim, int *m, int *M, int **m_idx, int **M_idx);

/****************************************************************************/
/*									LISTE									*/
/****************************************************************************/
//t_lista *inserisci_l_ord( t_lista *l_ord, t_lista *l_ins );
void inserisci_l_ord(pnodo *L_ord, pnodo L_ins);
void inserisci_l(pnodo *L, int inf);
void inverti_l(pnodo *L);
void print_l(pnodo L);

/****************************************************************************/
/*									CODE									*/
/****************************************************************************/
void enqueue(pnodo *T, int queue_in);
int  dequeue(pnodo *Q);
void print_q(pnodo Q);

/****************************************************************************/
/*									PILE									*/
/****************************************************************************/
void push(pnodo *P, int pila_in);
int  pop(pnodo *P);
void print_p(pnodo P);

/****************************************************************************/
/*								GRAFI E FILES								*/
/****************************************************************************/
void DFS_search(int v, pnodo *L, pnodo *P_out, int *c, int *d, int *f, int *p, int *count);
void DFS(pnodo *L, pnodo *P_in, pnodo *P_out, int n, int *c, int *d, int *f, int *p);
void BFS_search(int v, pnodo *L, int *c,int *p, int *d);
void BFS(pnodo *L, pnodo *P_in, int n, int *c, int *p, int *d);