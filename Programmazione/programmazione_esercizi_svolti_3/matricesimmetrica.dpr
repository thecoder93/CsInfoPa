program matricesimmetrica;
{$APPTYPE CONSOLE}
uses
  SysUtils;

const nmax =50;
 type matrice = array [1..nmax, 1..nmax] of integer;
 var n, riga, colonna: integer; sim :boolean; mat: matrice;
begin
  writeln ('inserisci il numero di righe della matrice');
  readln (n);
  writeln ('inserisci gli elementi della matrice');
  for riga:=1 to n  do
  for colonna:=1 to n do
  readln (mat [riga, colonna]);
  sim := true;
  riga:=1; colonna:=n;
  while sim and (riga < n) do
        if mat [riga, colonna] <> mat [colonna, riga]
        then sim := false
        else
        begin
        colonna := colonna - 1;
                if colonna = riga then
                begin
                riga := riga +1;
                colonna := n;
                end
        end;
  writeln (sim);
  readln
end. 