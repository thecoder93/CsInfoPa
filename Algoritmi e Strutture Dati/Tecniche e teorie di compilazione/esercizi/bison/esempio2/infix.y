%{
#include <stdio.h>
#define YYSTYPE int
#include <math.h>
void yyerror (char const *);
%}
%token NUM PAR_AP PAR_CH NEWL
%left MENO PIU
%left PER DIV
%left NEG
%right POT

%start input

%%
input: 	/* empty */
	| input line ;
line: 	NEWL
	| exp NEWL { printf ("%d",$1); };
exp: 	NUM { $$ = $1; }
	| exp PIU exp  { $$ = $1 + $3; printf("PIU %d %d %d\n",$1,$3,$$); }
	| exp MENO exp { $$ = $1 - $3; printf("MENO %d %d\n",$1,$3);}
	| exp PER exp { $$ = $1 * $3; printf("PER %d %d\n",$1,$3);}
	| exp DIV exp { $$ = $1 / $3; printf("%d %d\n",yylval,$$);}
	/* Exponentiation */
	| exp POT exp { $$ = pow ($1, $3); printf("%d",yylval);}
	/* Unary minus */
	| MENO exp %prec NEG { $$ = -$2; }
	|PAR_AP exp PAR_CH  { $$ = $2;};
%%

#include <stdio.h>

/* Called by yyparse on error. */
void
yyerror (char const *s)
{
fprintf (stderr, "%s\n", s);
}

int main (void)
{
 return yyparse ();
}


