program lez3_es2_confronto_vett;

{$APPTYPE CONSOLE}

uses
  SysUtils;

var
  a,b:array[1..4] of integer;
  i,x:integer;
  y:boolean;

begin

  for i:=1 to 4 do begin
    write('Inserisci il ',i,' elemento del primo vettore: ');
    read(a[i]);
  end;

  writeln;

  for i:=1 to 4 do begin
    write('Inserisci il ',i,' elemento del primo vettore: ');
    read(b[i]);
  end;

  writeln;
  writeln;

  x:=1;
  y:=false;

  repeat
    if a[x]<>b[x] then begin
      y:=true;
    end;

      x:=x+1;
  until
    (x>4) or (y=true);

  if y=true then
    write('I due array non sono uguali.')
  else
    write('I due array sono uguali.');


readln;
readln;
end.
 