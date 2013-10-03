#include "..\A LIBRERIA\MyLibrary.h"

main(){
	int continua = 1,
		op1,op2;
	char c[5];
	t_pila *not_pol = NULL;
	
	while(continua){
		printf("inserisci operando o operatore: ");
		scanf("%s",&c);
		switch(*c){
		case '+':
			not_pol = pop(not_pol,&op2);
			not_pol = pop(not_pol,&op1);
			not_pol = push(not_pol,op1+op2);
			printf("%d + %d = %d\n",op1,op2,op1+op2);//fai due pop e somma
			break;
		case '-':
			not_pol = pop(not_pol,&op2);
			not_pol = pop(not_pol,&op1);
			not_pol = push(not_pol,op1-op2);
			printf("%d - %d = %d\n",op1,op2,op1-op2);//fai due pop e sottrai
			break;
		case '*':
			not_pol = pop(not_pol,&op2);
			not_pol = pop(not_pol,&op1);
			not_pol = push(not_pol,op1*op2);
			printf("%d * %d = %d\n",op1,op2,op1*op2);//fai due pop e moltiplica
			break;
		case '/':
			not_pol = pop(not_pol,&op2);
			not_pol = pop(not_pol,&op1);
			not_pol = push(not_pol,op1/op2);
			printf("%d / %d = %d\n",op1,op2,op1/op2);//fai due pop e dividi
			break;
		case 'q':
			continua = 0;
			break;
		default:
			not_pol = push(not_pol,atoi(c));
			break;
		}
	
	}

	return 0;
}