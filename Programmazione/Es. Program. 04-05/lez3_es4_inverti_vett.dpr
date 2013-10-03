program lez3_es4_inverti_vett;

{$APPTYPE CONSOLE}

uses
  SysUtils;

var a:array[1..6] of integer;
    i:integer;

begin

  for i:=1 to 6 do begin
    write('Inserisci il ',i,' elemento del vettore: ');
    read(a[i]);
  end;

  for i:=1 to (6 div 2) do begin
    a[i]:=a[i]+a[7-i];
    a[7-i]:=a[i]-a[7-i];
    a[i]:= a[i]-a[7-i];
  end;

  writeln;
  writeln('VETTORE INVERTITO');
  writeln;

  for i:=1 to 6 do
  writeln('Il ',i, ' elemento del vettore invertito e'': ',a[i]);

readln;
readln;
end.
 