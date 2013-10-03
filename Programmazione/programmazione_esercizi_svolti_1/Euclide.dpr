program Euclide;

{$APPTYPE CONSOLE}

uses
  SysUtils;

var
a,b,x,y,mcd:integer;
begin
writeln('inserisci a');
readln(a);
writeln('inserisci b');
readln(b);
x:=a mod b;
if x=0 then
writeln('IL MCD tra ',a,' e ',b,' e'' ',b)
else
begin
y:=b mod x;
if y=0 then
writeln('IL MCD tra ',a,' e ',b,' e'' ',x)
else
begin
repeat
mcd:=x mod y;
x:=y;
y:=mcd;
until mcd=0;
writeln('IL MCD tra ',a,' e ',b,' e'' ',x);
end;
end;
readln;
end.
