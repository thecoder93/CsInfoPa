program Fattoriale;

{$APPTYPE CONSOLE}

uses
  SysUtils;

var n,i,fatt:real;
begin
writeln ('Inserisci il valoe di n');
readln(n);
i:=1;
fatt:=(n);
while
n-i>=1
do
begin
fatt:=fatt*(n-i);
i:=i+1;
end;
writeln ('Il fattoriale vale',fatt);
readln;
end.
 