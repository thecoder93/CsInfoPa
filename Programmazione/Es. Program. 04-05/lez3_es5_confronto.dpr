program lez3_es5_confronto;

{$APPTYPE CONSOLE}

uses
  SysUtils;


var i:integer;
    V:array[1..6] of integer;


begin

  for i:=1 to 6 do begin
    write('Inserisci il ',i, ' elemento del vettore: ');
    read(V[i]);
  end;

  writeln;

  for i:=1 to 6 do begin
    if V[i]>i then
      writeln('V[i]>i')
    else
      if V[i]=i then
        writeln('V[i]=i')
      else
        writeln('V[i]<i');
  end;

readln;
readln;
end.
 