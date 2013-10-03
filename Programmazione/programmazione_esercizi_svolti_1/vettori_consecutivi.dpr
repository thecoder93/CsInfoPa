program vettori_consecutivi;

{$APPTYPE CONSOLE}

uses
  SysUtils;

type vettore=array [1..5] of integer;
var
vet:vettore;
i,t:integer;
begin
writeln('Inserisci i valori del vettore 1');
for i:=1 to 5 do
readln(vet[i]);

writeln('Inserisci il valore t');
readln(t);

for i:=1 to 4 do
if t>vet[i]*vet[i+1] then
writeln(vet[i]*vet[i+1],' e'' minore di ',t)
else
writeln(vet[i]*vet[i+1],' non e'' minore di ',t);
readln;
end.
