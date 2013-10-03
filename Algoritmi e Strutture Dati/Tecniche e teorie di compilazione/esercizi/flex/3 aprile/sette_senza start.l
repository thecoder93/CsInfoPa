	
  #ifndef FALSE  
  #define FALSE 0
  #endif

  #ifndef TRUE 
  #define TRUE 1
  #endif
  #include <ctype.h>
%option noyywrap
%%

[A-Z] putchar(tolower(*yytext));
"/*"  {
	char c;
	int done=FALSE;
	ECHO;
	do /*Fintanto che done è false */
	  {
	   while  ((c=input())!='*')
		putchar(c);
	   putchar(c); /* c è * */
	   while ((c=input())=='*')
		putchar(c);
	   putchar(c); /*il primo carattere diverso da * */
	   if (c='/') done=TRUE;
	  }
	while (!done);
	}

%%
main(int argc,char *argv[])
            {
    --argc;  /* skip over program name */
    if ( argc > 0 )
            yyin = fopen( argv[1], "r" );
    else
            yyin = stdin;

    yylex();
    printf("ciao");

    }
