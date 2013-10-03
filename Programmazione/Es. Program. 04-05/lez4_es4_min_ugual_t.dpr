program lez4_es4_min_ugual_t;

{$APPTYPE CONSOLE}

uses
  SysUtils;

var
  a:array[1..5] of integer;
  t,i,x:integer;

begin

  for i:=1 to 5 do begin
    write('Inserisci il ',i,' elemento dell''array: ');
    readln(a[i]);
  end;

  writeln;
  write('Inserisci un intero: ');
  read(t);
  writeln;

  x:=0;

  for i:=1 to 5 do begin
    if a[i]<= t then
      x:=x+1;
  end;

  writeln('Gli elementi dell''array che sono minori o uguali a ',t,' sono: ',x);


readln;
readln;
end.
 