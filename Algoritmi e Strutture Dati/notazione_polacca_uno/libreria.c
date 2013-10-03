/****************************************************************************/
/*                                LIBRERIE                                  */
/****************************************************************************/
#include "libreria.h"

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
