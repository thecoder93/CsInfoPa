program es_array;

{$APPTYPE CONSOLE}

uses
  SysUtils;

var
  a: array [1..6] of integer;
  b: array of integer;
  x,i,k,y : integer;

begin
  for i:=1 to 6 do begin
    write('Inserisci il ',i,' valore dell''array: ');
    readln(a[i]);
  end;
  writeln;

  write('Inserisci il valore da eliminare: ');
  readln(x);
  writeln;

  k:=0;

  for i:=1 to 6 do
    if a[i] <> x then
      k:=k+1;

  setlength (b,k);

  y:=1;

  for i:=1 to 6 do begin
    if a[i] <> x then begin
      b[y]:= a[i];
      y:=y+1;
    end;
  end;

  writeln;
  for i:=1 to k do
    write(b[i],' ');

readln;
end.
