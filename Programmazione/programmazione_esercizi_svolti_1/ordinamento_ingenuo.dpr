program ordinamento_ingenuo;

{$APPTYPE CONSOLE}

uses
  SysUtils;

type vettore=array [1..5] of integer;
var
vet:vettore;
i,j,aux:integer;
begin
writeln('Inserisci i valori del vettore 1');
for i:=1 to 5 do
readln(vet[i]);

aux:=0;
for j:=1 to 4 do
for i:=(j+1) to 5 do
if vet[j]>vet[i] then
begin
aux:=vet[j];
vet[j]:=vet[i];
vet[i]:=aux;
end;

for i:=1 to 5 do
writeln(vet[i]);
readln;
end.
