program Pari_O_Dispari;

{$APPTYPE CONSOLE}

uses
  SysUtils;

var
n:integer;
begin
writeln('Inserisci il numero intero n');
readln(n);
if n mod 2=0
then
writeln('Il numero e'' pari')
else
writeln('Il numero e'' dispari');
readln;
end.
 