program lez4_es2_scambio;

{$APPTYPE CONSOLE}

uses
  SysUtils;

var
  a: array[1..5] of integer;
  b: array[1..5] of integer;
  i,aus: integer;

begin

  for i:=1 to 5 do begin
    write('Inserisci il ',i,' elemento del primo array: ');
    readln(a[i]);
  end;

  writeln;

   for i:=1 to 5 do begin
    write('Inserisci il ',i,' elemento del secondo array: ');
    readln(b[i]);
  end;

  writeln;

  for i:=1 to 5 do begin
    if a[i]<b[i] then begin
      aus:=a[i];
      a[i]:=b[i];
      b[i]:=aus;
      end;
  end;

  write('Il primo array e'' costituito dai seguenti elementi: ');
  for i:=1 to 5 do
    write(a[i], '  ');

  writeln;

  write('Il secondo array e'' costituito dai seguenti elementi: ');
  for i:=1 to 5 do
    write(b[i], '  ');

readln;
end.
