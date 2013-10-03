program Project2;

{$APPTYPE CONSOLE}

uses
  SysUtils;

var x,y:integer;

begin

  writeln('Inserisci il primo valore: ');
  readln(x);
  writeln('Inserisci il secondo valore: ');
  readln(y);

  if x=y then
    writeln('I numeri immessi sono uguali')
  else

      if x>y then
        writeln('Il numero ', x, ' e'' maggiore del numero ',y)
      else
        writeln('Il numero ', y, ' e'' maggiore del numero ',x);

readln;

end.
 