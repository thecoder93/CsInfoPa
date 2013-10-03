/*
 * Analizzatore lessicale che effettua la conversione delle letterre
 maiuscole in minuscole lasciando intatti i commenti
 *
*/

	
/* regular definitions */
vocale 	[aeiou]
consonante   [b-df-hl-np-tv-z]
%option noyywrap
%%
 int i;
{vocale}[a-z]*	 	{fprintf(yyout,"%say",yytext) ;}
{consonante}[a-z]*	{for(i=1;i<yyleng;i++)
				fprintf(yyout,"%c",yytext[i]);
			 fprintf(yyout,"%cay",yytext[0]);	
				}	
%% 
main (int argc, char *argv[])
	{
	--argc;
	if (argc>0)
		{ 
		yyin=fopen(argv[1],"r");
		if (argc>1)
			yyout=fopen(argv[2],"w");
		else 
			yyout=stdout;
		}
	else 
		yyin=stdin;
	yylex();
	}
