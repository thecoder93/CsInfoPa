program fattoriale;

{$APPTYPE CONSOLE}

uses
  SysUtils;

var n,i,fatt:integer;

begin

  writeln('Immettere un valore:  ');
  readln(n);

  fatt:=1;

  for i:=0 to n-1 do
    fatt:=fatt*(n-i);

  writeln('Il fattoriale del numero e'': ',fatt);

readln;
end.
 