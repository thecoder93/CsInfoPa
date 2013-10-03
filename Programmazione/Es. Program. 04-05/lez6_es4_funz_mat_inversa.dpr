program lez6_es4_funz_mat_inversa;

{$APPTYPE CONSOLE}

uses
  SysUtils;

type
  matrice= array [1..3,1..3] of integer;

var
  matA: matrice;
  i,j:integer;

procedure inversa (matA:matrice);
  var b:matrice;
      i,j:integer;

  begin
    for i:=1 to 3 do
      for j:=1 to 3 do
        b[i,4-j]:=matA[i,j];

  writeln;
  writeln;
  writeln;
  writeln('MATRICE B (inversa della matrice A): ');
  writeln;

  for i:=1 to 3 do begin
    writeln;
    for j:=1 to 3 do
      write(b[i,j],'  ');
  end;

  end;

begin

  //inizializza matrice
  for i:=1 to 3 do
    for j:=1 to 3 do begin
      write('Inserisci l''elemento della ',i,'^ riga, ',j,'^ colonna: ');
      readln(matA[i,j]);
    end;

  //stampa matrice originale
  writeln;
  writeln;
  writeln('MATRICE A: ');
  writeln;
  for i:=1 to 3 do begin
    writeln;
    for j:=1 to 3 do
      write(matA[i,j],'  ');
  end;


   //procedura
  inversa(matA);

readln;
end.
