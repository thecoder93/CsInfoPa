program es2_numeri_perfetti;

{$APPTYPE CONSOLE}

uses
  SysUtils;

var
    n,i,y,perf,x:integer;

begin

  write('Immetti un valore: ');
  readln(n);
  writeln;
  writeln;
  writeln('I numeri perfetti da 1 a ',n, ' sono:');
  writeln;




  for y:=2 to n do begin

  perf:=0;
  x:=y div 2;

    for i:=1 to x do begin
      if y mod i = 0 then
        perf:=perf+i;
    end;
    if perf=y then
    write(y, '  ');

  end;
  writeln;
  writeln;
  writeln('T H E    E N D ');


readln;

end.
