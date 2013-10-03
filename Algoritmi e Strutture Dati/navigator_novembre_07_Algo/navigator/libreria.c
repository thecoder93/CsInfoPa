#include "libreria.h"
#define ARROTONDA(x)((float)(((int)(x*100))/100.0f))
const float PI=3.141592653589793;


void check_date(char *date)
{
  int gg,mm,aaaa;

  gg   = atoi((char*)(&date[0]));
  mm   = atoi((char*)(&date[3]));
  aaaa = atoi((char*)(&date[6]));
  
  if((aaaa>1900)&&(aaaa<3000)&&(gg>0))
  {
    if(((mm==1)||(mm==3)||(mm==5)||(mm==7)||(mm==8)||(mm==10)||(mm==12))&&(gg<32)) return;
    if(((mm==4)||(mm==6)||(mm==9)||(mm==11))&&(gg<31))                             return;
	if(mm==2)
	{
	  /* controllo anno bisestile */
      if(((aaaa % 4 == 0 && aaaa % 100 != 0) || aaaa % 400 == 0)&&(gg<30))         return;
	  if(gg<29)                                                                    return;
    }
  }
  yyerror("ERRORE: Data non valida!");
}

void SetSpeed(t_car *veicolo, float new_speed, int if_bool)
{
  if(if_bool)
  {
    veicolo->speed = new_speed;
    (veicolo->time)++;
  }
}

void SetAngle(t_car *veicolo, float new_angle, char flag, int if_bool)
{
  if(if_bool) 
  {
    if(flag == 'g') /* caso gradi */
      /* riconduco in radianti */
      new_angle /= 180;
    veicolo->angle = new_angle*PI;
    (veicolo->time)++;
  }
}

void MoveVehicle(t_car *veicolo, float space_time, char flag, int if_bool)
{
  if(if_bool)
  {
    if(veicolo->speed != 0)
    {
      if(flag == 's') /* spostamento temporale */
      /* riconduto lo spostamento temporale in spaziale */
        space_time *= veicolo->speed;

      /* spostamento spaziale    */
      (veicolo->space) += space_time;
      (veicolo->posX)  += space_time * (cos(veicolo->angle));
      (veicolo->posY)  += space_time * (sin(veicolo->angle));

      (veicolo->time)  += (space_time / veicolo->speed); 
    }
  }
}

void AcquireData(t_car *veicolo, float time, int if_bool)
{
  if(if_bool)
    (veicolo->time) += time;
}

int check_cond(t_car *veicolo, char flag, char relop, float valore)
{
  float control_value = (flag == 's')?veicolo->time:veicolo->space;
  return((relop == '<')?(control_value<valore):(control_value>valore));  
}

void Report(t_car* veicolo, int error)
{
  if(error)
    fprintf(stdout,"Sintassi non corretta \n");
  else
  {
    fprintf(stdout,"Sintassi corretta\n");
	fprintf(stdout,"Posizione finale: X = %.2f\tY =%.2f.\n",ARROTONDA(veicolo->posX),ARROTONDA(veicolo->posY));
	fprintf(stdout,"Tempo trascorso: %.2f sec\n",veicolo->time);
  }
}
