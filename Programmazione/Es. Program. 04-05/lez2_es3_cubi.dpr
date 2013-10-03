program lez2_es3_cubi;

{$APPTYPE CONSOLE}

uses
  SysUtils;

var i,a,b,c,x,q1,q2,q3:integer;

begin

  for i:=150 to 410 do begin

  //calcolo della prima cifra
  a:= i div 100;

  //calcolo della terza cifra
  b:= i mod 10;

  //calcolo della seconda cifra
  x:= i div 10;
  c:= x mod 10;

  //calcolo del cubo
  q1:=sqr(a)*a;
  q2:=sqr(b)*b;
  q3:=sqr(c)*c;

    if (i=q1+q2+q3) then begin
      writeln;
      writeln('Il numero ',i, ' e'' uguale alla somma dei cubi delle cifre che lo compongono.');
      writeln;
    end;

  end;



readln;
end.
