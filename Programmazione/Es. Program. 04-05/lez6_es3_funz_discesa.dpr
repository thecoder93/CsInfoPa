program lez6_es3_funz_discesa;

{$APPTYPE CONSOLE}

uses
  SysUtils;

var a:array[1..6] of integer;
    i:integer;

function discesa(a:array of integer): integer;
  var i,x,j:integer;

  begin
    x:=0;
    j:=length(a);
    for i:=0 to j-1 do
      if a[i]>a[i+1] then
        x:=x+1;

    discesa:=x;
  end;


begin

  //input
  for i:=1 to 6 do begin
    write('Inserisci il ',i,'^ elemento dell''array: ');
    readln(a[i]);
  end;

  //output
  writeln;
  writeln('Il numero di discese e'': ',discesa(a));
  writeln;

readln;
end.
 