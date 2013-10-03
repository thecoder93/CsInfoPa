program ricorsione_euclide;

{$APPTYPE CONSOLE}

uses
  SysUtils;

var x,y,z:integer;
function mcd(a,b:integer):integer;
begin
if a mod b=0 then
mcd:=b
else
mcd:=mcd(b,a mod b);
end;
begin
writeln('Inserisci i due valori');
readln(x);
readln(y);
z:=mcd(x,y);
writeln('Il mcd tra ',x,' e ',y,' e'' ',z);
readln;
end.
