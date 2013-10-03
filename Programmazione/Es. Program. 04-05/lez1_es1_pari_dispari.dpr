program pari_dispari;

{$APPTYPE CONSOLE}

uses
  SysUtils;

var n:integer;

begin

  write('Inserisci un numero intero: ');
  readln(n);

  if n mod 2 = 0 then
  writeln('Il numero immesso e'' pari')

  else
  writeln('Il numero immesso e'' dispari');

  readln;


end.
