program vettori_scambio;

{$APPTYPE CONSOLE}

uses
  SysUtils;

type vettore=array [1..5] of integer;
var
vet1,vet2:vettore;
i,aux:integer;
begin
writeln('Inserisci i valori del vettore 1');
for i:=1 to 5 do
readln(vet1[i]);

writeln('Inserisci i valori del vettore 2');
for i:=1 to 5 do
readln(vet2[i]);

for i:=1 to 5 do
if vet1[i]<vet2[i] then
begin
aux:=vet2[i];
vet2[i]:=vet1[i];
vet1[i]:=aux;
end;
write('Il nuovo vettore 1 e'': ');
for i:=1 to 5 do
write(' ',vet1[i]);
writeln;
write('Il nuovo vettore 2 e'': ');
for i:=1 to 5 do
write(' ',vet2[i]);
readln;
end.
 