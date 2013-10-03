#include <stdio.h>
#include <stdlib.h>
#include <time.h>

#define N 10

typedef struct nodo *pnodo;
struct nodo{
	int inf;
	pnodo next;
};

int randint(int X){
    return (rand()%X);
}

/****************************************************************************/
/*                            INSERIMENTO IN LISTA                            */
/****************************************************************************/
void inserisci_l_ord(pnodo *L_ord, pnodo *L_ins);
void inserisci_l(pnodo *L, int inf);
void inverti_l(pnodo *L);
void print_l(pnodo L);


/****************************************************************************/
/*                                   MAIN                                   */
/****************************************************************************/
int main(){
	pnodo lista_ord = NULL,
		  lista_ins = NULL;
	int i,x;

	srand((unsigned int) time (NULL));

	for(i=0;i<N;i++)
		inserisci_l(&lista_ord,i*7);

	for(i=0;i<N;i++){
		x = randint(100);
		inserisci_l(&lista_ins,x);
	}
	
	printf("Lista ordinata = \n");
	print_l(lista_ord);

	printf("Lista da inserire = \n");
	print_l(lista_ins);

	inserisci_l_ord(&lista_ord, &lista_ins);

	printf("Lista ordinata finale = \n");
	print_l(lista_ord);
	
	return 0;
}

/****************************************************************************/
/*                  INSERIMENTO LISTA IN LISTA ORDINATA                     */
/****************************************************************************/
void inserisci_l_ord(pnodo *L_ord, pnodo *L_ins)
{
	pnodo tmp  = NULL,		/* memorizza l'elemento staccato da l_ins		*/
		  head = NULL,		/* memorizza la testa di l_ord					*/
		  succ = NULL;
	while(L_ins){
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
// t_lista *inserisci_l_ord( t_lista *l_ord, t_lista *l_ins ){
//     t_lista *tmp,                /* memorizza l'elemento staccato da l_ins    */            
//             *head;                /* memorizza la testa di l_ord                */
//     while(l_ins){        
//         tmp = l_ins;            /* prende il primo elemento di l_ins        */
//         l_ins = l_ins->next;    /* lo memorizza in un puntatore tmp            */
//         tmp->next = NULL;        /* e lo stacca dalla lista l_ins            */
// 
//         if( tmp->inf < l_ord->inf ){    /* inserimento in testa                */
//             tmp->next = l_ord;
//             l_ord = tmp;
//         }else{
//             head = l_ord;
//             while( ( l_ord->next ) && ( tmp->inf > l_ord->next->inf ) )
//                 l_ord = l_ord->next;
//             tmp->next = l_ord->next;
//             l_ord->next = tmp;
//         }
//         l_ord = head;
//     }
//     return l_ord;
// }

/****************************************************************************/
/*                            INSERIMENTO IN LISTA                            */
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