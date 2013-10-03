program Somma;
{$APPTYPE CONSOLE}
uses
  SysUtils;

var
x,y,z:integer;
begin
writeln('Inserisci x');
readln(x);
writeln('Inserisci y');
readln(y);
While x<>0 do
begin
x:=pred(x);
y:=succ(y);
end;
z:=y;
writeln('La somma:  ');
writeln(z);
readln;
end.
