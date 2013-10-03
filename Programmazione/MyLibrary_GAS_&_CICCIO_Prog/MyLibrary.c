/****************************************************************************/
/*                                LIBRERIE                                  */
/****************************************************************************/
#include "MyLibrary.h"

/****************************************************************************/
/*                                 MACRO                                    */
/****************************************************************************/
#define SWAP(a,b) {void *tmp; tmp = *a; *a = *b; *b = tmp;}
//#define COMPARE(a,b) ( (*(int *)a > *(int *)b) )               /* INT    */
#define COMPARE(a,b) ( ( strcmp((char *)a , (char *)b) ) > 0 ) /* CHAR   */
//#define COMPARE(a,b) ( (*(t_arco *)a).p > (*(t_arco *)b).p )   /* T_ARCO */
#define RANDINT(N) (rand()%N)
#define RANDDOUBLE(N) (N*((double)rand()/RAND_MAX))

/****************************************************************************/
/*                                HEAPSORT                                  */
/****************************************************************************/
void heapify(void **v, int i, int size){
    int l,        /* index figlio sx	*/
        r,        /* index figlio dx	*/
        m;
    l = (2*i)+1;
    r = (2*i)+2;
	m = i;
    if ( ( l < size ) && ( COMPARE(v[l],v[i]) ) ) m = l;
    if ( ( r < size ) && ( COMPARE(v[r],v[m]) ) ) m = r;
    if ( m != i ){
		SWAP(&v[i],&v[m]);
        heapify(v,m,size);
    }
}

void buildheap(void **p, int size){
    int i;
    for( i=(size/2-1); i>=0; i--)
        heapify(p,i,size);
}

void heapsort(void **p, int size){
    int i;
    buildheap(p,size);
    for(i=(size-1);i>=0;i--){
		SWAP(&p[0],&p[i]);
        heapify(p,0,i);
    }    
}

/****************************************************************************/
/*                                MERGESORT                                 */
/****************************************************************************/
void merge(void **s1,void **s2, int dim1,int dim2){
    int k=0,i=0,j=0;
    void **S = (void **) malloc ( (dim1+dim2)*sizeof(void *) );
    while ( k < dim1+dim2 ){
        if ( i >= dim1 ){ S[k++] = s2[j++]; continue; }
        if ( j >= dim2 ){ S[k++] = s1[i++]; continue; }
        if (!(COMPARE (s1[i],s2[j])))
            S[k++] = s1[i++];
        else
            S[k++] = s2[j++];
    }
    for (k=0;k<(dim1+dim2);k++)
        s1[k] = S[k];
    free(S);
}

void mergesort(void **v,int dim)
{
    void **s1,**s2;
    if (dim>1){
        s1 = &v[0];
        s2 = &v[dim/2];
        mergesort(s1,dim/2);
        mergesort(s2,dim-(dim/2));
        merge(s1,s2,dim/2,dim-(dim/2));
    }
}

/****************************************************************************/
/*                                QUICKSORT                                 */
/****************************************************************************/
int partition(void **S,int l,int r)
{
    int i,j;
    i = l - 1;
    j = r + 1;
    for(;;){
        while( COMPARE(S[r],S[++i]) );
        while( COMPARE(S[--j],S[r]) )
            if(j==1) break;
        if(i>=j) break;
        SWAP(&S[i],&S[j]);
    }
	SWAP(&S[r],&S[i]);
    return i;
}

void quicksort(void **v,int l,int r){
    int i;
    if (r<=l) return;
    i = partition(v,l,r);
    quicksort(v,l,i-1);
    quicksort(v,i+1,r);
}

/****************************************************************************/
/*                             QUICK-FIND                                   */
/****************************************************************************/
int quickfind(int *A,int p,int q, int dim)
{
    int j,tmp;
    if (A[p]==A[q]) return 0;    // FIND
    for (tmp=A[p],j=0;j<dim;j++) // UNION
    {
        if (A[j]==tmp)
            A[j]=A[q];
    }
    return 1;
}

/****************************************************************************/
/*                             QUICK-UNION                                  */
/****************************************************************************/
int quickunion(int *B,int p,int q)
{
    while( p != B[p] ) p = B[p]; // FIND p
    while (q != B[q] ) q = B[q]; // FIND q
    if( p == q )  return 0;      // !coppia_nuova
    B[p] = q;                    // UNION
    return 1;
}

/****************************************************************************/
/*                          QUICK-UNION PESATA                              */
/****************************************************************************/
int quickunion_pesata(int *C,int *Cpeso,int p,int q)
{
    while( p != C[p] ) p = C[p]; // FIND p
    while( q != C[q] ) q = C[q]; // FIND q
    if( p == q ) return 0;       // !coppia_nuova
    if( Cpeso[p] < Cpeso[q] ){
		C[p] = q;
        Cpeso[q] += Cpeso[p];
    }
    else{
        C[q] = p;
        Cpeso[p] += Cpeso[q];
    }
    return 1;
}

/****************************************************************************/
/*                                 MIN-MAX                                  */
/****************************************************************************/
void minmax(int *v,int dim,int *m, int *M)
{
    int m1,m2,M1,M2,
		dim1,dim2;
    if (dim<2){
        *m = v[0];
        *M = v[0];
    }else{
		dim1 = dim/2;
		dim2 = dim - dim1;
        minmax(&v[0],    dim1, &m1, &M1);
        minmax(&v[dim1], dim2, &m2, &M2);
        *m = (m1<m2)? m1: m2;    /* min tra m1 e m2 */
        *M = (M1<M2)? M2: M1;    /* max tra M1 e M2 */
    }
}

/****************************************************************************/
/*                            MIN-MAX INDEX                                 */
/****************************************************************************/
void minmax_index(int *v, int dim, int *m, int *M, int **m_idx, int **M_idx)
{
    int m1,m2,M1,M2,*m1_idx,*m2_idx,*M1_idx,*M2_idx,
		dim1,dim2;
    if (dim<2){
        *m = v[0]; *m_idx = &v[0];
        *M = v[0]; *M_idx = &v[0];
    }else{
		dim1 = dim/2;
		dim2 = dim - dim1;
        minmax_index(&v[0],    dim1, &m1, &M1, &m1_idx, &M1_idx);
        minmax_index(&v[dim1], dim2, &m2, &M2, &m2_idx, &M2_idx);
        if(m1<m2){ *m = m1; *m_idx = m1_idx; }
		else     { *m = m2; *m_idx = m2_idx; }
        if(M1>M2){ *M = M1; *M_idx = M1_idx; }
		else     { *M = M2; *M_idx = M2_idx; }    
    }
}

/****************************************************************************/
/*                            INSERIMENTO IN LISTA                          */
/****************************************************************************/
void inserisci_l(pnodo *L, int list_in)
{
	pnodo aus = NULL,
		  tmp = NULL;
    if (( aus = (pnodo) malloc (sizeof(struct nodo) ) ) == NULL )
        fprintf(stderr,"ERRORE overflow %d\n");
	else{
		aus->inf  = list_in;
		aus->next = NULL;
		if(*L == NULL)
			*L = aus;
		else{
			tmp = *L;
			while(tmp->next)
				tmp = tmp->next;
			tmp->next = aus;
		}
	}
}

/****************************************************************************/
/*                  INSERIMENTO LISTA IN LISTA ORDINATA                     */
/****************************************************************************/
void inserisci_l_ord(pnodo *L_ord, pnodo *L_ins)
{
	pnodo tmp  = NULL,		/* memorizza l'elemento staccato da l_ins		*/
		  head = NULL,		/* memorizza la testa di l_ord					*/
		  succ = NULL;
	while(*L_ins){
		tmp = *L_ins;
		*L_ins = (*L_ins)->next;
		tmp->next = NULL;

		if( tmp->inf < (*L_ord)->inf){ /* inserimento in testa				*/
			tmp->next = *L_ord;
			*L_ord = tmp;
		}else{
			head = *L_ord;
			succ = (*L_ord)->next;
			while( ((*L_ord)->next ) && (tmp->inf > succ->inf ) ){
				*L_ord = (*L_ord)->next;
				succ = (*L_ord)->next;
			}
			tmp->next = (*L_ord)->next;
			(*L_ord)->next = tmp;
		}
		*L_ord = head;
	}
}

/****************************************************************************/
/*                              INVERTI LISTA                               */
/****************************************************************************/
void inverti_l(pnodo *L)
{
	pnodo rev  = NULL,
		  tmp1 = NULL,
		  tmp2 = NULL;
	tmp1 = *L;
	while(tmp1){
		tmp2 = tmp1->next;
		tmp1->next = rev;
		rev = tmp1;
		tmp1 = tmp2;
	}
	*L = rev;
}

/****************************************************************************/
/*                              STAMPA LISTA                                */
/****************************************************************************/
void print_l(pnodo L){
    while (L != NULL){
        printf("%d -> ",L->inf);
        L = L->next;
    }
    printf("NULL\n");
}

/****************************************************************************/
/*                               ENQUEUE                                    */
/****************************************************************************/
void enqueue(pnodo *T, int queue_in)
{
    pnodo aus;
    if (( aus = (pnodo) malloc (sizeof(struct nodo) ) ) == NULL )
        fprintf(stderr,"\nERRORE overflow \n");
    else{
        aus->inf  = queue_in;
        aus->next = NULL;
        if(*T == NULL)
            *T = aus;
        else{
            (*T)->next = aus;
            *T = (*T)->next;
        }
    }
}

/****************************************************************************/
/*                               DEQUEUE                                    */
/****************************************************************************/
int dequeue(pnodo *Q)
{
    int queue_out = -1;
    pnodo aus;
    if( *Q == NULL)
        fprintf(stderr,"\nERRORE di underflow\n");
    else{
        aus = *Q;
        queue_out = aus->inf;
        *Q = (*Q)->next;
        free(aus);
    }
    return queue_out;
}

/****************************************************************************/
/*                              STAMPA CODA                                 */
/****************************************************************************/
void print_q(pnodo Q){
    while (Q != NULL){
        printf("%d -> ",Q->inf);
        Q = Q->next;
    }
    printf("NULL\n");
}

/****************************************************************************/
/*                                PUSH                                      */
/****************************************************************************/
void push(pnodo *P, int pila_in){
    pnodo aus,
          head;
    if (( aus = (pnodo) malloc (sizeof(struct nodo) ) ) == NULL )
        fprintf(stderr,"ERRORE overflow %d\n");
    else{
        aus->inf = pila_in;
        head = *P;
        aus->next = head;
        *P = aus;
    }
}

/****************************************************************************/
/*                                 POP                                      */
/****************************************************************************/
int pop(pnodo *P)
{
    pnodo aus;
    int pop_out = -1;
    if (*P == NULL)
        fprintf(stderr,"ERRORE di underflow %d\n");
    else{
        aus = *P;
        pop_out = aus->inf;
        *P = (*P)->next;
        free(aus);
    }
    return pop_out;
}

/****************************************************************************/
/*                              STAMPA PILA                                 */
/****************************************************************************/
void print_p(pnodo P){
    while (P != NULL){
        printf("%d -> ",P->inf);
        P = P->next;
    }
    printf("NULL\n");
}

/****************************************************************************/
/*									DFS										*/
/****************************************************************************/
void DFS_search(int v,			/* vertice che stiamo visitando			*/
				pnodo *L,		/* lista delle adiacenze				*/
				pnodo *P_out,	/* pila di output						*/
				int *c,			/* colore vertici						*/
				int *d, int *f,	/* tempi di visita iniziale e finale	*/
				int *p,			/* precedente di un vertice				*/
				int *count		/* contatore del tempo di visita		*/
				)
{
	pnodo aus;		/* lista delle adiacenze	*/
	int w;			/* adiacente				*/
	c[v] = 1;
	d[v] = *count;
	(*count)++;
	aus = L[v];
	while(aus != NULL){
		w = aus->inf;
		if(c[w] == 0){
			printf("%d ",w);
			DFS_search(w,L,P_out,c,d,f,p,count);
			p[w] = v;
		}
		aus = aus->next;
	}
	f[v] = *count;
	(*count)++;
	c[v] = 2;
	push(P_out,v);
}

void DFS(pnodo *L,			/* lista delle adiacenze				*/
		 pnodo *P_in,		/* pila per ordine visita				*/
		 pnodo *P_out,		/* pila di output						*/
		 int n,				/* numero di vertici					*/
		 int *c,			/* colore vertici						*/
		 int *d, int *f,	/* tempi di visita iniziale e finale	*/
		 int *p				/* precedente di un vertice				*/
		 )
{
	int i,
		v,					/* vertice								*/
		count = 0;			/* contatore del tempo di visita		*/

	for(i=0;i<n;i++){
		c[i] = d[i] = f[i] = 0;
		p[i] = -1;
	}
	while(*P_in){
		v = pop(P_in);
		if(c[v] == 0){
			printf("%d ",v);
			DFS_search(v, L, P_out, c, d, f, p, &count);
			printf("\n");
		}
	}
}

/****************************************************************************/
/*									BFS										*/
/****************************************************************************/
void BFS_search(int v, pnodo *L, int *c,int *p, int *d){
	pnodo aus;
	pnodo	Q = NULL,	/* head della coda per la visita BFS	*/
			T = NULL;	/* tail della coda						*/
	int w;				/* adiacente							*/

	enqueue(&T,v);
	if(Q == NULL) Q = T;
	c[v] = 1;
	d[v] = 0;

	while(Q){
		if( (w = dequeue(&Q)) != -1){
			if(Q == NULL) T = Q;
			aus = L[w];
			while(aus){
				if(c[aus->inf] == 0){
					c[aus->inf] = 1;
					p[aus->inf] = w;
					d[aus->inf] = d[w] + 1;
					printf(" -> %d (d = %d, p = %d)",aus->inf,d[aus->inf],p[aus->inf]);
					enqueue(&T,aus->inf);
					if(Q == NULL) Q = T;
				}
				aus = aus->next;
			}
			c[w] = 2;
		}
	}
}

void BFS(pnodo *L,		/* lista delle adiacenze		*/
		 pnodo *P_in,	/* pila ordine visita			*/
		 int n,			/* numero di vertici			*/
		 int *c,		/* colore vertici				*/
		 int *p,		/* precedente di un vertice		*/
		 int *d			/* depth del vertice nella BFS	*/
		 )
{
	int v, i;
	for(i=0;i<n;i++){
		c[i] = 0;
		p[i] = d[i] = -1;
	}
	while(*P_in){
		v = pop(P_in);
		if( c[v] == 0){
			printf("%d (d = 0, p = -1)",v);
			BFS_search(v, L, c, p, d);
			printf("\n");
		}
	}
}