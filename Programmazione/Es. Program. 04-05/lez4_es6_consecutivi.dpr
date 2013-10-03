program lez4_es6_consecutivi;

{$APPTYPE CONSOLE}

uses
  SysUtils;

var
  a: array[1..5] of integer;
  i,t:integer;
  x:boolean;

begin

  for i:=1 to 5 do begin
    write('Scrivere il ',i,' valore dell''array: ');
    read(a[i]);
  end;
  writeln;

  write('Inserisci un valore intero: ');
  read(t);
  writeln;

  x:=false;

  for i:=1 to 4 do begin
    if a[i]*a[i+1]<t then
      x:=true;
  end;

  if x=true then
    writeln('Vi sono almeno 2 elementi consecutivi il cui prodotto e'' inferiore a ',t)
  else
    writeln('Non esistono due elementi consecutivi il cui prodotto e'' inferiore a ',t);

readln;
readln;
end.
 