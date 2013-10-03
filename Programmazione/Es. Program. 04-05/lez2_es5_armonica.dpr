program lez2_es5_armonica;

{$APPTYPE CONSOLE}

uses
  SysUtils;

var n,i,a,y:integer;
    x:real;

begin

  write('Inserisci un numero intero: ');
  readln(n);

  a:=1;

  repeat
    x:=0;
    for i:=1 to a do begin
      x:=x+(1/i);
      end;
    a:=a+1;
  until
    x>n;

  y:=a-1;

  writeln;
  writeln('Il numero di termini della serie armonica necessari per superare il vaolor ',n,' e'' uguale a: ',y);

readln;
end.
