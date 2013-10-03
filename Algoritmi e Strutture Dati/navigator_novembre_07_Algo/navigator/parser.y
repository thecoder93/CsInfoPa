/*******************************************************************************
 *                                                                             *
 *                 TESINA DI TEORIE E TECNICHE DI COMPILAZIONE                 *
 *                                Novembre 2007                                *
 *                                                                             *
 *=============================================================================*
 *                                  NAVIGATOR                                  *
 *                           Analizzatore Sintattico                           *
 *=============================================================================*
 *                                                                             *
 *                                             a cura di Gaspare Di Giovanna   *         
 *                                     relatore prof.ssa Marinella Sciortino   *
 *                                                                             *
 ******************************************************************************/
%{
#include "libreria.h"
int if_bool = 1;
int error;
t_car veicolo = {0,0,0,0,0,0};
%}

%union{
  float real;
  char flag;
}

%token TARGA COMMENTO DATA
%token SPEED ANGLE MOVE ACQUIREDATA IF
%token PI M S

%token <real> REALE_POS REALE_NEG

%type  <real> reale angolo
%type  <flag> spazio_tempo gradi_radianti relop

%start root

%%
root
        : TARGA DATA comment '%' first_statement      {Report(&veicolo,error);} 
	;
comment
        : /* empty */
        | COMMENTO
        ;
first_statement
        : /* empty */
        | speed_action statements 
        ;
statements
        : /* empty */
        | if_case statements
        | actions statements
	;
if_case
        : IF '(' condition ')' '[' if_statements ']'    {if_bool = 1;}
        ;
condition
        : spazio_tempo relop reale  {if_bool = check_cond(&veicolo,$1,$2,$3);}
        ;
if_statements
        : /* empty */
        | actions if_statements 
        ;
actions
        : speed_action
        | move_action
        | angle_action
        | acquire_action speed_action
        ;
angolo
        : reale                 {$$ = $1;}
        | reale '/' REALE_POS   {$$ = ($1/$3);}
	;
reale
        : REALE_POS             {$$ = $1;}
        | REALE_NEG             {$$ = $1;}
        ;
gradi_radianti
        : /* empty */           {$$ = 'g';}
        | PI                    {$$ = 'r';}
        ;
spazio_tempo
        : M                     {$$ = 'm';}
        | S                     {$$ = 's';}
        ;
relop
        : '<'                   {$$ = '<';}
        | '>'                   {$$ = '>';}
        ;
speed_action
        : SPEED '(' REALE_POS ')' ';'                {SetSpeed(&veicolo,$3,if_bool);      }
        ;
move_action
        : MOVE '(' REALE_POS spazio_tempo ')' ';'    {MoveVehicle(&veicolo,$3,$4,if_bool);}
        ;
angle_action
        : ANGLE '(' angolo gradi_radianti ')' ';'    {SetAngle(&veicolo,$3,$4,if_bool);   }
        ;
acquire_action
        : ACQUIREDATA '(' REALE_POS ')' ';'          {AcquireData(&veicolo,$3,if_bool);   }
        ;
%%

int yyerror(char* s){
  fprintf(stderr,"%s\n",s);
  error++;
}

int main(void)
{
  yyparse();
  return 0;
}
