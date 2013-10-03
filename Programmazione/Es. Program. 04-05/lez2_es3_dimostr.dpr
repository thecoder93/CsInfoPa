program lez2_es3_dimostr;

{$APPTYPE CONSOLE}

uses
  SysUtils;

  var n,a,b,c,x,q1,q2,q3:integer;

begin

  write('Inserisci un intero fra 150 e 410: ');
  readln(n);

  //calcolo della prima cifra
  a:= n div 100;

  //calcolo della terza cifra
  b:= n mod 10;

  //calcolo della seconda cifra
  x:= n div 10;
  c:= x mod 10;

  //calcolo del cubo
  q1:=sqr(a)*a;
  q2:=sqr(b)*b;
  q3:=sqr(c)*c;



  writeln('La prima cifra e'': ',a);
  writeln('La seconda cifra e'': ',c);
  writeln('La terza cifra e'': ',b);
  writeln;
  writeln;



  if (n=q1+q2+q3) then
    writeln('Il numero ',n, ' e'' uguale alla somma dei cubi del numero stesso');


readln;
end.
