program vettori_pari_dispari;

{$APPTYPE CONSOLE}

uses
  SysUtils;

type vettore=array [1..5] of integer;
var
vet:vettore;
i,pari,dispari:integer;
begin
writeln('Inserisci i valori del vettore');
for i:=1 to 5 do
readln(vet[i]);

dispari:=0;
pari:=0;
for i:=1 to 5 do
if (i mod 2)=0 then
pari:=pari+vet[i]
else
dispari:=dispari+vet[i];
writeln('La somma degli elementi di posto pari e'':' ,pari);
writeln('La somma degli elementi di posto dispari e'':' ,dispari);
readln;
end.
 