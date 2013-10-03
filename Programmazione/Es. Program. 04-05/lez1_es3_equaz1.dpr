program Project3;

{$APPTYPE CONSOLE}

uses
  SysUtils;

var a,b,x:integer;

begin

  writeln('Immetti il primo valore: ');
  read(a);
  writeln('Immetti il secondo valore: ');
  read(b);

  x:= (-b) div a;

  writeln('Il risultato e'': ',x);
  readln;
  readln;

end.
 