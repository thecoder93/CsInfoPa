program Project2;

{$APPTYPE CONSOLE}

uses
  SysUtils;

var a,b,c:real;

begin

  write('Immetti il primo valore: ');
  read(a);
  write('Immetti il secondo valore: ');
  read(b);
  write('Immetti il terzo valore: ');
  read(c);


  if (a<(b+c)) and (b<(a+c)) and (c<(a+b)) then begin
    writeln('I valori immessi sono i lati di un triangolo.');
      if ((a=b) and (b=c)) then
        writeln('Il tringolo e'' equilatero.')
      else
        if (sqr(a)=sqr(b)+sqr(c)) or (sqr(b)=sqr(c)+sqr(a)) or (sqr(c)=sqr(a)+sqr(b)) then
          writeln('Il triangolo e'' rettangolo.')
        else
          if (a=b) or (a=c) or (b=c) then
            writeln('Il triangolo e'' isoscele (forse).')
          else
            if (a<>b) and (a<>c) and (b<>c) then
              writeln('Il triangolo e'' scaleno.');
   end
   else
    writeln('I valori immessi non sono i lati di un tringolo.');


readln;
readln;

end.

