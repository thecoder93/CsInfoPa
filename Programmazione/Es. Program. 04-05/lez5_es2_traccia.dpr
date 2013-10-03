program lez5_es2_traccia;

{$APPTYPE CONSOLE}

uses
  SysUtils;

type
  matrice=array[1..3,1..3] of integer;

var
  mat:matrice;
  i,j,t:integer;
  simmetrica:boolean;

begin

  for i:=1 to 3 do
    for j:=1 to 3 do begin
      write('Inserisci l''elemento della riga ',i,' colonna ',j,': ');
      readln(mat[i,j]);
    end;

  //visualizza la matrice

  writeln;
  writeln('MATRICE: ');
  for i:=1 to 3 do begin
    writeln;
    for j:=1 to 3 do
      write(mat[i,j],' ');
  end;

  //calcola la traccia
  t:=0;
  for i:=1 to 3 do
    t:=t+mat[i,i];

  writeln;
  writeln;
  writeln('La traccia della matrice e'' uguale a: ',t);
  writeln;

  //stabilisce se è simmetrica
  simmetrica:=true;
  i:=1;
  j:=1;
  repeat
    repeat
      if mat[i,j]<>mat[j,i] then
        simmetrica:=false;
      j:=j+1;
    until (simmetrica=false) or (j>3);
    j:=1;
    i:=i+1;
  until (simmetrica=false) or (i>3);

  //stampa se è simmetrica
  if simmetrica=false then
    writeln('La matrice non e'' simmetrica.')
  else
    writeln('La matrice e'' simmetrica.');


readln;
end.
 