program lez2_es4_armonica;

{$APPTYPE CONSOLE}

uses
  SysUtils;

var i,n,y:integer;
    x:real;

begin

  write('Inserisci un valore: ');
  read(n);
  writeln;
  writeln('I primi n termini della serie armonica sono: ');
  writeln;

  x:=0;

  for i:=1 to n do begin
    x:=x+(1/i);
    write(' 1/',i);
      if i<>n then
        write(' + ')
      else
          write(' ');

  end;

  writeln;
  writeln;
  writeln('La somma dei primi n termini della serie armonica e'': ',x:0:4);
  writeln;

readln;
readln;
end.
