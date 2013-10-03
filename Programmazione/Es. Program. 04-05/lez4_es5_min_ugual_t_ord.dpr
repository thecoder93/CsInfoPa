program lez4_es5_min_ugual_t_ord;

{$APPTYPE CONSOLE}

uses
  SysUtils;

var
  a:array[1..5] of integer;
  t,i:integer;
  x:boolean;


begin

  for i:=1 to 5 do begin
    write('Inserisci il ',i,' elemento dell''array: ');
    readln(a[i]);
  end;

  writeln;
  write('Inserisci un intero: ');
  read(t);
  writeln;

  x:=true;
  i:=1;

  repeat
    if a[i]>t then
      x:=false
    else
      i:=i+1;
  until
    x=false;


  writeln('Gli elementi dell''array che sono minori o uguali a ',t,' sono: ',i-1);


readln;
readln;

end.
