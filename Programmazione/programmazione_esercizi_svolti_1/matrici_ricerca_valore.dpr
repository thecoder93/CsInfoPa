program Project2;

{$APPTYPE CONSOLE}

uses
  SysUtils;
var
matrice:array[1..5,1..5]of integer;
i,j,x:integer;
trovato:boolean;
begin
for i:=1 to 5 do
  for j:=1 to 5 do begin
  writeln('Inserisci elemento di riga ',i,' e colonna ',j);
  readln(matrice[i,j]);
  end;
writeln('Inserisci il valore da cercare nella matrice');
readln(x);
i:=1;
trovato:=false;
repeat
j:=1;
  repeat
  if matrice[i,j]=x then begin
  trovato:=true;
  writeln('Elemento presente nella matrice')
  end
  else
  j:=j+1;
  until (trovato=true)or(j=6);
i:=i+1;
if i=6 then
writeln('Elemento non presente nella matrice');
until (trovato=true)or(i=6);
readln;
end.
