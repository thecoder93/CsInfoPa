program funzioni_matrice_invertita;

{$APPTYPE CONSOLE}

uses
  SysUtils;

type
matrice=array[1..3,1..3]of integer;
var
mat,mat1,mat2:matrice;
procedure crea_matrice(var mat:matrice);
var i,j:integer;
begin
for i:=1 to 3 do
for j:=1 to 3 do begin
writeln('Inserisci l''elemento di riga ',i,' e colonna ',j);
readln(mat1[i,j]);
end;
end;
procedure nuova_matrice(var mat2:matrice;mat1:matrice);
var i,j,m,n:integer;
begin
m:=1;
for i:=1 to 3 do begin
n:=3;
for j:=1 to 3 do begin
mat2[i,j]:=mat1[m,n];
n:=n-1;
end;
m:=m+1;
end;
end;
procedure stampa_matrice(mat:matrice);
var i,j:integer;
begin
for i:=1 to 3 do begin
writeln;
for j:=1 to 3 do
write(mat[i,j]:5)
end;
end;
begin
crea_matrice(mat);
nuova_matrice(mat2,mat1);
stampa_matrice(mat2);
readln;
end.
