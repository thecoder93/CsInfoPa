program lez7_es1_proc_ricors_euclide;

{$APPTYPE CONSOLE}

uses
  SysUtils;

procedure euclide (var a,b,mcd:integer);
  var q,r:integer;

  begin
    q:=a div b;
    r:=a mod b;
      if r=0 then
        mcd:=b
      else
        euclide (b,r,mcd);

  end;

var a,b,mcd:integer;

begin
  mcd:=0;
  write('Inserisci il dividendo: ');
  read(a);
  writeln;
  writeln;
  write('Inserisci il divisore: ');
  read(b);
  writeln;
  writeln;

  euclide(a,b,mcd);
  writeln('Il massimo comun divisore fra ',a,' e ',b,' e'': ',mcd);


readln;
readln;
end.
