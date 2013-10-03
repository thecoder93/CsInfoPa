program lez6_es2_funz_min20;

{$APPTYPE CONSOLE}

uses
  SysUtils;

var a:array[1..8] of integer;
    i:integer;

function verifica(a:array of integer): boolean;
  var i,x:integer;
      boo:boolean;
  begin
    x:=length(a);
    boo:=false;
    for i:=1 to x-1 do
      if (a[i]*a[i+1])<20 then
        boo:=true;

    verifica:=boo;
  end;

begin

  //input
  for i:=1 to 8 do begin
    write('Inserisci il ',i,'^ elemento dell''array: ');
    readln(a[i]);
  end;

  //output
  writeln;
  writeln('RESPONSO:');
  writeln;
  if verifica(a) then
    writeln('Esistono almeno 2 valori consecutivi il cui prodotto e'' < 20.')
  else
    writeln('Non esistono almeno 2 valori consecutivi il cui prodotto e'' < 20.');

readln;
end.
 