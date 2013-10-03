program Project1;

{$APPTYPE CONSOLE}

uses
  SysUtils;

var a,b,c:integer;
    x0,x1,x2,d:integer;

begin

  writeln('Inserisci il primo valore: ');
  read(a);
  writeln('Inserisci il secondo valore: ');
  read(b);
  writeln('Inserisci il terzo valore: ');
  read(c);

  d:= sqr(b) - (4*a*c);
  x0:= (-b) div (2*a);
  x1:= ((-b)+d ) div (2*a);
  x2:= ((-b)-d ) div (2*a);

  if d<0 then
    writeln('Non ci sono soluzioni reali')
  else
    if d=0 then
      writeln('Vi sono due soluzioni coincidenti, corrispondenti a: ', x0)
    else
      if d>0 then
        writeln('Vi sono due soluzioni corrispondenti a: ',x1, ' e ', x2);

readln;
readln;

end.
 