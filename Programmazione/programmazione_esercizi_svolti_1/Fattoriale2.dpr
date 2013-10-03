program Project2;

{$APPTYPE CONSOLE}

uses
  SysUtils;

var
n,fatt,fatt1:real;
begin
writeln('Inserisci il valore di n');
readln(n);
fatt:=n;
while n<>1 do
begin
fatt1:=fatt*(n-1);
n:=n-1;
fatt:=fatt1
end;
writeln('Il fattoriale e...',fatt1);
readln;
end.
