program ricorsione_max_array;

{$APPTYPE CONSOLE}

uses
  SysUtils;

const
n=5;
type vettore=array[1..n]of integer;
var
vett:vettore;
indice,i,z:integer;

function max(vett:vettore;i,indicemax,massimo:integer):integer;
begin
if i>n then
max:=massimo
else
begin
if vett[i]>massimo then
begin
massimo:=vett[i];
indicemax:=i;
indice:=indicemax;
end;
max:=max(vett,i+1,indicemax,massimo);
end;
end;

begin
for i:=1 to n do
begin
writeln('Inserisci l'' elemento ',i,' del vettore');
readln(vett[i]);
end;
writeln('Premi un tasto per vedere il max del vettore');
readln;
z:=max(vett,1,1,0);
writeln('L'' elemento max del vettore e'' ',z);
writeln('L'' indice dell'' elemento max e''',indice);
readln;


end.
