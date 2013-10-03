#include <stdio.h>
#include <stdlib.h>
/*	stringa utilizzata	*/
/*	4 5 + 6 2 - * 3 +	*/

typedef struct t_nodo{
	char *inf;
	struct t_nodo *sx;
	struct t_nodo *dx;
}t_nodo;

t_nodo *create_nodo(t_nodo *nodo, char **s, int i){
	nodo = (t_nodo *) malloc (sizeof(t_nodo));
	nodo->inf = s[i];
	nodo->sx = NULL;
	nodo->dx = NULL;
	return nodo;
}

t_nodo *ins_nodo_prefissa(t_nodo *nodo, char **s, int *idx){	
	(*idx)++;
	nodo = create_nodo(nodo ,s , *idx);
	if((nodo->inf[0] == '+')||(nodo->inf[0] == '*')||(nodo->inf[0] == '/')||(nodo->inf[0] == '-')){
		nodo->sx = ins_nodo_prefissa( nodo->sx, s, idx );
		nodo->dx = ins_nodo_prefissa( nodo->dx, s, idx );
	}
	return nodo;
}

t_nodo *ins_nodo_postfissa(t_nodo *nodo, char **s, int *idx){	
	(*idx)--;
	nodo = create_nodo(nodo ,s , *idx);
	if((nodo->inf[0] == '+')||(nodo->inf[0] == '*')||(nodo->inf[0] == '/')||(nodo->inf[0] == '-')){
		nodo->dx = ins_nodo_postfissa( nodo->dx, s, idx );
		nodo->sx = ins_nodo_postfissa( nodo->sx, s, idx );
	}
	return nodo;
}

void print_preorder(t_nodo *nodo){
	if(nodo != NULL){
		printf("%s ",nodo->inf);
		print_preorder(nodo->sx);
		print_preorder(nodo->dx);
	}
}

void print_postorder(t_nodo *nodo){
	if(nodo != NULL){
		print_postorder(nodo->sx);
		print_postorder(nodo->dx);
		printf("%s ",nodo->inf);
	}
}

void print_inorder(t_nodo *nodo){
	if(nodo != NULL){
		print_inorder(nodo->sx);
		printf("%s ",nodo->inf);
		print_inorder(nodo->dx);
	}
}

int calcola(t_nodo *nodo){
	switch(*nodo->inf){
	case '+':	return (calcola(nodo->sx) + calcola(nodo->dx)); break;
	case '-':	return (calcola(nodo->sx) - calcola(nodo->dx)); break;
	case '*':	return (calcola(nodo->sx) * calcola(nodo->dx)); break;
	case '/':	return (calcola(nodo->sx) / calcola(nodo->dx)); break;
	default:	return atoi(nodo->inf); break;
	}
}

int main(int argc, char **argv){
	t_nodo *albero = NULL;
	int idx = 0;
	int max = argc;
	int result;

	albero = ins_nodo_prefissa(albero,argv,&idx);
	albero = ins_nodo_postfissa(albero,argv,&max);
	
	result = calcola(albero);

	printf("\npreorder: \n");
	print_preorder(albero);
	printf("\npostorder: \n");
	print_postorder(albero);
	printf("\ninorder: \n");
	print_inorder(albero);

	printf("\nRisultato = %d\n",result);

	return 0;
}