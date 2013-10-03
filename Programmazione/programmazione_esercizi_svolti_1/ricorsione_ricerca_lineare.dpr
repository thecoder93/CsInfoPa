program ricorsione_ricerca_lineare;

{$APPTYPE CONSOLE}

uses
  SysUtils;

type vettore=array[1..5]of integer;
var
vett:vettore;
x,i:integer;
procedure ricerca(vett:vettore;i:integer);
begin
if vett[i]=x then
writeln('Elemento ',x,' presente in posizione ',i)
else
if i<=5 then
ricerca(vett,i+1)
else
writeln('Elemento ',x,' non presente nel vettore');
end;

begin
writeln('Inserisci l'' elemento da ricercare');
readln(x);
for i:=1 to 5 do
begin
writeln('Inserisci l'' elemento ',i,' del vettore');
readln(vett[i]);
end;
ricerca(vett,1);
readln;
end.
