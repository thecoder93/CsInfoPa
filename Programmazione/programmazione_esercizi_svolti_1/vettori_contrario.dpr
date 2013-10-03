program vettori_contrario;

{$APPTYPE CONSOLE}

uses
  SysUtils;

type vettore=array[1..5] of integer;
var
a:vettore;
i:integer;
begin
for i:=1 to 5 do begin
writeln('Inserisci il valore ',i,' del vettore A');
readln(a[i]);
end;
writeln('I valori del nuovo vettore B sono:');
for i:=5 downto 1 do
write(' ',a[i]);
readln;
end.
