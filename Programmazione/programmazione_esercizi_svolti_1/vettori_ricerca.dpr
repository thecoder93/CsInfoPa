program vettori_ricerca;

{$APPTYPE CONSOLE}

uses
  SysUtils;

type vettore=array [1..5] of integer;
var
vet:vettore;
x,i,j:integer;
trovato:boolean;
begin
writeln('Inserisci il valore di x');
readln(x);
writeln('Inserisci i valori del vettore');

for i:=1 to 5 do
read(vet[i]);

trovato:=false;
j:=1;
while (trovato=false)and(j<=5) do
if x=vet[j] then
begin
trovato:=true;
writeln('elemento ',x,' trovato in posizione ',j)
end
else
j:=j+1;

readln;
readln;
end.
