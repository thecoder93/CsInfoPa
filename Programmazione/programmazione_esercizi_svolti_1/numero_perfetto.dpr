program numero_perfetto;

{$APPTYPE CONSOLE}

uses
  SysUtils;

var
n,i,j,x,sum:integer;
begin
writeln('Inserisci il numero fino a cui controlare quali sono tutti i numeri perfetti');
readln(n);
for i:=1 to n do
begin
sum:=0;
for j:=1 to i-1 do
begin
x:=i mod j;
if x=0 then
sum:=sum+j;
end;
if sum=i then
begin
writeln;
writeln(i);
end;
end;
writeln('Questi sono tutti i numeri perfetti da 1 a ' ,n);
readln;
end.

