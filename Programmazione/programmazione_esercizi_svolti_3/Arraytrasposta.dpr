program Arraytrasposta;
{$APPTYPE CONSOLE}
uses
  SysUtils;

type matrice=array[1..100,1..100]of integer;
var
i,j,n,m:integer;
a:matrice;
begin
write('inserisci numero di righe ');
read(n);
write('inserisci numero di colonne ');
read(m);
write('inserisci valori prima matrice');
FOR I :=1 TO n do
for j:=1 to m do
readln(a[i,j]);
for j:=1 to m do
for i:=1 to n do
write(a[i,j]:4);
readln
end.