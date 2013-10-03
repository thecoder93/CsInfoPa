program lez6_es5_funz_0consecutivi;

{$APPTYPE CONSOLE}

uses
  SysUtils;

type matrice=array [1..4,1..4] of integer;

var mat:matrice;
    i,j:integer;

function verifica1 (mat:matrice): boolean;
  var i,j:integer;
      boo:boolean;
  begin
    boo:=false;
    for i:=1 to 4 do
      for j:=1 to 3 do begin
        if (mat[i,j]=0) and (mat[i,j+1]=0) then
          boo:=true;
        end;
    verifica1:=boo;
  end;

function verifica2 (mat:matrice): boolean;
  var i,j:integer;
      boo:boolean;
  begin
    boo:=false;
    for i:=1 to 2 do
      for j:=1 to 4 do begin
        if (mat[i,j]=0) and (mat[i+1,j]=0) and (mat[i+2,j]=0) then
          boo:=true;
        end;
    verifica2:=boo;
  end;

begin

  //input della matrice
  for i:=1 to 4 do
    for j:=1 to 4 do begin
      write('Inserisci l''elemento di riga ',i,'^ e colonna ',j,'^ :');
      readln(mat[i,j]);
  end;

  //stampa della matrice presa in input
  writeln;
  writeln;
  writeln('STAMPA DELLA MATRICE:');
  writeln;
  for i:=1 to 4 do begin
    writeln;
    for j:=1 to 4 do
      write(mat[i,j],'  ');
  end;

  //funzione
  writeln;
  writeln;
  writeln;
  writeln('RISULTATO: ');
  writeln;
  writeln;
  if verifica1(mat) or verifica2(mat) then
    writeln('Esiste almeno una sequenza di 2 zero consecutivi per riga o 3 zero per colonna.')
  else
    writeln('Non esiste almeno una sequenza di 2 zero consecutivi per riga o 3 zero per colonna.');


  if verifica1(mat) or verifica2(mat) then begin
  writeln;
  writeln;
  writeln;
  writeln('GIUSTO PER ESSERE PIU'' PRECISI: ');
  writeln;
  writeln;
  if verifica1(mat) then
    writeln('Esiste almeno una sequenza di 2 zero consecutivi per riga.');
  if verifica2(mat) then
    writeln('Esiste almeno una sequenza di 3 zero consecutivi per colonna.');
  end;

  
readln;
end.
