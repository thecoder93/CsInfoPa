/*
 * Analizzatore sintattico per espressioni aritmetiche
 * (versione che effettua soltanto il riconoscimento della correttezza
 * sintattica della stringa di input: l'output e' "SYNTAX ERROR" se 
 * c'e' un errore sintattico, altrimenti l'output e' nullo.)
 *
 * Questo file (espr2.y) e' da usare insieme all'analizzatore lessicale
 * realizzato con FLEX a partire da espr2.fl.
 *
 * Riconosce espressioni aritmetiche secondo la seguente grammatica:
 *
 *   E -> E + T | E - T | T
 *   T -> T * F | T / F | F
 *   F -> ( E ) | numero
 *
 *
 * Sequenza di comandi per generare l'analizzatore sintattico:
 *
 *     flex espr2.fl
 *     bison -d espr2.y
 *     gcc lex.yy.c espr2.tab.c -o espr2
 */

%{
#include <stdio.h>
%}

%token NUM PIU PER PAR_AP PAR_CH NEWL

%start Input

%%
Input: 	/* empty */
	| Input Line ;

Line: NEWL
      | Expr NEWL {printf("%d",$1);}

Expr: Expr PIU Term	{$$=$1+$3;} 
      | Term  { $$ = $1; }
       ; 

Term: Term PER Factor	{$$=$1*$3;}  
      | Factor { $$ = $1; }
      ;
Factor: NUM	 
      | PAR_AP Expr PAR_CH
      ;
%% 

main()
{
  yyparse();
}

yyerror (char *s) 
     
{
  printf ("SYNTAX ERROR\n");
}
