program lez2_es6_euclide;

{$APPTYPE CONSOLE}

uses
  SysUtils;

var a,b,q,r:integer;

begin

  write('Inserisci il dividendo: ');
  read(a);
  writeln;
  writeln;
  write('Inserisci il divisore: ');
  read(b);
  writeln;
  writeln;


  repeat
    q:=a div b;
    r:=a mod b;
      if r=0 then
        writeln('Il massimo comun divisore fra e'': ',b)
      else
        a:=b;
        b:=r;
  until
    r=0;


readln;
readln;
end.
