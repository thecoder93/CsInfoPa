#include <stdlib.h>
#include <stdio.h>
#include <math.h>

typedef struct s_car{
  float time;
  float space;
  float speed;
  float angle;
  float posX;
  float posY;
} t_car;

void check_date(char *date);
int  check_cond  (t_car *veicolo, char flag, char relop, float real);

void SetSpeed    (t_car *veicolo, float new_speed,             int if_bool);
void SetAngle    (t_car *veicolo, float new_angle,  char flag, int if_bool);
void MoveVehicle (t_car *veicolo, float space_time, char flag, int if_bool);
void AcquireData (t_car *veicolo, float time,                  int if_bool);

void Report(t_car* veicolo, int error);
