program lez5_es6_countingsort;

{$APPTYPE CONSOLE}

uses
  SysUtils;

var a,b:array [1..8] of char;
    count: array ['a'..'z'] of integer;
    i:integer;
    x:char;

begin

  //prende in input l'array

  for i:=1 to 8 do begin
    write('Inserisci il ',i,'^ elemento dell''array: ');
    readln(a[i]);
  end;
  writeln;

  //counting sort
  for x:='a' to 'z' do
    count[x]:=0;

  for i:=1 to 8 do
    count[a[i]]:=count[a[i]]+1;

  for x:='b' to 'z' do
    count[x]:=count[x]+count[pred(x)];

  for i:=8 downto 1 do begin
    b[count[a[i]]]:=a[i];
    count[a[i]]:=count[a[i]]-1;
  end;

  //stampiamo l' array
  writeln;
  writeln;
  writeln('VETTORE ORDINATO: ');
  writeln;
  for i:=1 to 8 do
    write(b[i],' ');

readln;
end.
 