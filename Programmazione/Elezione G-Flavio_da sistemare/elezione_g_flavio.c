#include "MyLibrary.h"

#define N 10
#define M 3

t_lista *inserisci_l_circolare(t_lista *l, int inf){
	if (l == NULL){
		l = create_l(l,inf);
		l ->next = l;
	}else{
		t_lista *tmp = NULL;
		tmp = create_l(tmp, inf);
		tmp->next = l->next;
		l->next = tmp;
		l=l->next;
    }
    return l;
}

void print_l_circolare(t_lista *l){
    t_lista *h;
	h = l;
	printf(" %d ->",h->inf);
	h = h->next;
	while( h!=l ){
        printf(" %d ->",h->inf);
        h = h->next;
    }
	printf(" NULL\n");
}

t_lista *flavio_el(t_lista *l){
	t_lista *tmp;
	int i;
	while(l!=l->next){
		/* M-2 perchè ci dobbiamo fermare prima dell'elemento */
		/* da cancellaree si comincia a contare da 0 */
		for(i=0;i<M-2;i++)
			l= l->next;
		tmp = l->next;
		l->next = tmp->next;
		tmp->next = NULL;
		printf("elemento eliminato = %d\n",tmp->inf);
		free(tmp);
		print_l_circolare(l);
	}
	printf("Elemento estratto = %d\n",l->inf);
	return l;
}

main(){
	int x,i;
	t_lista *flavio = NULL;
	srand((unsigned int) time (NULL));
	for(i=0;i<10;i++){
		x = randint(100);
		printf("x = %d\n",x);
		flavio = inserisci_l_circolare(flavio,x);
	}
	flavio = flavio->next;

	printf("Lista iniziale = \n");
	print_l_circolare(flavio);

	flavio = flavio_el(flavio);

	return 0;
}