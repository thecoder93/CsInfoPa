/* Analizzatore lessicale che effettua soltanto il riconoscimento del lessico*/

    int contline=1;
	
/* regular definitions */

delim   [ \t]
ws      {delim}+
newline \n
letter  [a-zA-Z]
digit   [0-9]
id      {letter}({letter}|{digit})*
number	{digit}+
%x comment
%option noyywrap yylineno
%%
{ws}
{newline}	{contline++;}
"{"	BEGIN(comment);
<comment>[^}\n]*	;
<comment>\n	++contline;
<comment>"}"	BEGIN(INITIAL);
(PROGRAM|program)	|
(BEGIN|begin) 		|
(END|end) 		|
(IF|if) 		|
(THEN|then) 		|
(ELSE|else) 		|
(READ|read) 		|
(WRITE|write) 		|
(REPEAT|repeat) 		|
(UNTIL|until) 			{fprintf(yyout,"Line Number: %d\t Keyword: %s\n",contline,yytext);}
\;                  		{fprintf(yyout,"Line Number: %d\t Terminatore: %s\n",contline,yytext);}
{number} 			{fprintf(yyout,"Line Number: %d\t Numero: %s\n",contline,yytext);}
":="  				{fprintf(yyout,"Line Number: %d\t Assegnazione: %s\n",contline,yytext);}
[\+\-\*/] 			{fprintf(yyout,"Line Number: %d\t Operatore: %s\n",contline,yytext);}
"="|">"|"<"|"<="|">="|"<>"  	{fprintf(yyout,"Line Number: %d\t Oprel: %s\n",contline,yytext);}
{id} 				{fprintf(yyout,"Line Number: %d\t Identificatore: %s\n",contline,yytext);}
%% 

main(int argc, char *argv[])
 {
    int flag=0;
    ++argv, --argc;  /* skip over program name */
    switch (argc) {
		    case 0: yyin = stdin;   
			    yyout= stdout;  
               	            break;

                    case 2: yyin=fopen( argv[0], "r" );
			    if (yyin==NULL) {
					     printf("File di input inesistente!!");
					     flag=1;
                                            }
                            else yyout=fopen( argv[1], "w" );
			    break;
			    
                    default: printf("Indicazione file scorretta!!");
			     flag=1;
                   }
    
     if (flag==0) yylex();
 }
