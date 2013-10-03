program vettori_contrario_senza_aus;

{$APPTYPE CONSOLE}

uses
  SysUtils;

type vettore=array[1..5] of integer;
var
a:vettore;
j,i,aux:integer;
begin
for i:=1 to 5 do begin
writeln('Inserisci il valore ',i,' del vettore A');
readln(a[i]);
end;
writeln('I valori del nuovo vettore B sono:');
j:=1;
for i:=5 downto (5 div 2)+1 do begin
aux:=a[j];
a[j]:=a[i];
a[i]:=aux;
j:=j+1;
end;
for i:=1 to 5 do
writeln(a[i]);
readln;
end.
