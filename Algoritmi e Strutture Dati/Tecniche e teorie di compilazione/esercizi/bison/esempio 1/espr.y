/*
 * Analizzatore sintattico per espressioni aritmetiche
 * (versione che effettua soltanto il riconoscimento della correttezza
 * sintattica della stringa di input: l'output e' "SYNTAX ERROR" se 
 * c'e' un errore sintattico, altrimenti l'output e' nullo.)
 *
 * Questo file (espr.y) e' da usare insieme all'analizzatore lessicale
 * realizzato con FLEX a partire da espr.fl.
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
 *     flex espr.fl
 *     bison -d espr.y
 *     gcc lex.yy.c espr.tab.c -o espr
 */

%{
#include <stdio.h>
%}

%token NUM PIU MENO PER DIVISO PAR_AP PAR_CH

%start Expr

%%
Expr: Expr PIU Term | Expr MENO Term | Term 

Term: Term PER Factor | Term DIVISO Factor | Factor

Factor: NUM | PAR_AP Expr PAR_CH
%% 

main()
{
  yyparse();
}

yyerror (char *s) 
     
{
  printf ("SYNTAX ERROR\n");
}

