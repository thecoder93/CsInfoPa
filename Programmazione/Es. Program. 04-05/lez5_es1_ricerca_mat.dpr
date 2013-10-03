program lez5_es1_ricerca_mat;

{$APPTYPE CONSOLE}

uses
  SysUtils;

type
  matrice=array[1..3,1..2] of integer;

var
  mat:matrice;
  i,j,n:integer;
  trovato:boolean;

begin

  for i:=1 to 3 do
    for j:=1 to 2 do begin
      write('Inserisci l''elemento della riga ',i,' colonna ',j,': ');
      readln(mat[i,j]);
    end;

  //visualizza la matrice

  writeln;
  writeln('MATRICE: ');
  writeln;
  for i:=1 to 3 do begin
    writeln;
    for j:=1 to 2 do
      write(mat[i,j],' ');
  end;

  //inserisce l'elemento da cercare
  writeln;
  writeln;
  write('Inserisci l''elemento da cercare: ');
  readln(n);
  writeln;

  //ricerca dell'elemento

  trovato:=false;
    for i:=1 to 3 do
      for j:=1 to 2 do
        if mat[i,j]=n then begin
          writeln('L''elemento cercato si trova nella posizione corrispondente alla riga ',i,' colonna ',j);
          trovato:=true;
        end;

  if trovato=false then
    write('L''elemento non e'' contenuto nella matrice.');

readln;
end.
 