program liste_circolari;

{$APPTYPE CONSOLE}

uses
  SysUtils;

type
puntatore=^cella;
cella=record
info:char;
next:puntatore;
end;
sentinella=record
testa:puntatore;
coda:puntatore;
end;

var testa,coda:puntatore;
count,n:integer;

procedure stampa(testa:puntatore;i:integer);
begin
if count=0 then
writeln('Impossibile stampare: lista vuota')
else
if i=count+1 then
writeln('Stampa lista completata')
else begin
write(testa^.info);
write('-->');
stampa(testa^.next,i+1);
end;
end;

procedure crea_lista_circolare(var testa,coda:puntatore);
var paux:puntatore;
x:char;
begin
writeln('Digita 0 per terminare oppure digita il carattere da inserire');
readln(x);
if x<>('0') then begin
if testa=nil then begin
new(paux);
paux^.info:=x;
testa:=paux;
coda:=paux;
paux^.next:=testa;
count:=count+1;
crea_lista_circolare(testa,coda);
end
else begin
new(paux);
paux^.info:=x;
coda^.next:=paux;
coda:=paux;
paux^.next:=testa;
count:=count+1;
crea_lista_circolare(testa,coda);
end;
end
end;

procedure cicla(var testa,coda:puntatore;n:integer);
begin
if n=0 then
writeln('Ciclo completato')
else begin
testa:=testa^.next;
coda:=coda^.next;
cicla(testa,coda,n-1);
end;
end;

begin
writeln('Questa programma cicla una lista');
writeln;
count:=0;
crea_lista_circolare(testa,coda);
stampa(testa,1);
if count=0 then
writeln('Impossibile ciclare: lista vuota')
else begin
writeln('Inserisci il numero di cicli');
readln(n);
cicla(testa,coda,n);
stampa(testa,1);
end;
readln;
end.
