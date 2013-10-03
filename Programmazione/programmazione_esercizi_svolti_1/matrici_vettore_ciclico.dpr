program matrici_vettore_ciclico;

{$APPTYPE CONSOLE}

uses
  SysUtils;

type
vettore=array[1..3]of char;
matrice=array[1..3,1..3]of char;
var
vet:vettore;
mat:matrice;
i,j:integer;
begin
for i:=1 to 3 do begin
writeln('Inserisci l''elemento ',1,' del vettore');
readln(vet[i]);
end;
i:=1;

for j:=1 to 3 do
mat[i,j]:=vet[j];

for i:=2 to 3 do
for j:=1 to 3 do
if j=1 then
mat[i,j]:=mat[i-1,j+2]
else
mat[i,j]:=mat[i-1,j-1];

writeln('La matrice e'' formata dai seguenti elementi :');

for i:=1 to 3 do begin
writeln;
for j:=1 to 3 do
write(mat[i,j]:5);
end;
readln;
end.
 