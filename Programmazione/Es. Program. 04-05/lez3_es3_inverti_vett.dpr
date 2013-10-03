program lez3_es3_inverti_vett;

{$APPTYPE CONSOLE}

uses
  SysUtils;

var
  a,b:array[1..4] of integer;
  x,i:integer;


begin

  for i:=1 to 4 do begin
    write('Inserisci il ',i,' elemento del vettore: ');
    read(a[i]);
  end;

  for i:=1 to 4 do begin
    b[i]:=a[5-i];
  end;

  writeln;
  writeln;
  writeln('VETTORE INVERSO');
  writeln;

  for i:=1 to 4 do begin
    writeln('Il ',i,' elemento del vettore inverso e'': ', b[i]);
  end;


readln;
readln;
end.
 