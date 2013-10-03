program lez5_es3_max_somma;

{$APPTYPE CONSOLE}

uses
  SysUtils;

type
  matrice=array[1..3,1..4] of integer;

var
  mat:matrice;
  somma: array[1..3] of integer;
  i,j,max:integer;
  simmetrica:boolean;

begin

  for i:=1 to 3 do
    for j:=1 to 4 do begin
      write('Inserisci l''elemento della riga ',i,' colonna ',j,': ');
      readln(mat[i,j]);
    end;

  //visualizza la matrice

  writeln;
  writeln('MATRICE: ');
  for i:=1 to 3 do begin
    writeln;
    for j:=1 to 4 do
      write(mat[i,j],' ');
  end;

  //calcola la somma delle righe

  for i:=1 to 3 do
    somma[i]:=0;

  for i:=1 to 3 do
    for j:=1 to 4 do
    somma[i]:= somma[i]+mat[i,j];

  //output
  writeln;
  writeln;
  for i:=1 to 3 do
    writeln('Somma riga ',i,': ',somma[i]);

  writeln;

  max:=1;
  for i:=1 to 3 do
    if somma[i]>somma[max] then
      max:=i;
      writeln('La riga dai cui elementi si ottiene una maggiore somma e'' la: ',max,'^');

readln;
end.
