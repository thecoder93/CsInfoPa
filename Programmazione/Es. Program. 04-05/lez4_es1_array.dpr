program lez4_es1_array;

{$APPTYPE CONSOLE}

uses
  SysUtils;

var
  a:array[1..6] of integer;
  i,p,d:integer;

begin

  for i:=1 to 6 do begin
    write('Inserisci il ',i,' elemento dell''array: ');
    read(a[i]);
  end;
  writeln;

  p:=0;
  d:=0;

  for i:=1 to 6 do begin
    if i mod 2=0 then
      p:=p+a[i]
    else
      d:=d+a[i]
  end;

  writeln('Elementi di posto pari: ',a[2],' + ',a[4],' + ',a[6],' = ',p);
  writeln('Elementi di posto dispari: ',a[1],' + ',a[3],' + ',a[5],' = ',d);
  writeln;

  if p>d then
    writeln('La somma degli elementi di posto pari e'' maggiore degli elemtneti di posto dispari.')
  else
    if p<d then
      writeln('La somma degli elementi di posto dispari e'' maggiore degli elemtneti di posto pari.')
    else
      writeln('La somma degli elementi e'' uguale sia per i pari che per i dispari.');



readln;
readln;
end.
 