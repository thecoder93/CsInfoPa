program lez6_es1_procedura;

{$APPTYPE CONSOLE}

uses
  SysUtils;

var a: array[1..8] of integer;
    i:integer;

procedure paridispari(var a:array of integer);
  var i:integer;
      x:integer;
  begin
  x:=length(a);
    for i:=0 to x do begin
     if (a[i] mod 2 =0) then
      a[i]:=a[i]*2
     else
      a[i]:=-a[i];
    end;
  end;

begin

  //input dell'array

  for i:=1 to 8 do begin
    write('Inserisci il ',i,'^ elemento dell''array: ');
    readln(a[i]);
  end;

  //rikiamo procedura
  paridispari(a);

  //output
  writeln;
  writeln('VETTORE: ');
  writeln;
  for i:=1 to 8 do
    write(a[i],'  ');

readln;
end.
