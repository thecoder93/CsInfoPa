program trasposta;
{$APPTYPE CONSOLE}
uses
  SysUtils;

type matrice=  array [1..100,1..100]of integer;
 var i, j, n, m:integer; mat:matrice;
 begin
  writeln('inserisci il numero di righe');
  readln (n);
  writeln ('inserisci il numero di colonne');
  readln(m);
  writeln ('inserisci gli elementi');
  for i:=1 to n do
  for J:= 1 to m do
  readln(mat[i,j]);
  for j:=1 to m do
  begin
  for i:=1 to n do
  write( mat[i,j]:4);
  writeln
  end;
  readln
end.