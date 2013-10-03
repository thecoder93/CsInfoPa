program matrici_somma_riga;

{$APPTYPE CONSOLE}

uses
  SysUtils;

var
matrice:array[1..3,1..3]of integer;
i,j,somma,sum,riga:integer;

begin
for i:=1 to 3 do
for j:=1 to 3 do begin
writeln('Inserisci l''elemento di riga ',i,' e colonna ',j);
readln(matrice[i,j]);
end;
sum:=0;
i:=1;
riga:=i;
repeat
j:=1;
somma:=0;
repeat
somma:=somma+matrice[i,j];
j:=j+1;
until j>3;
if somma>sum then begin
sum:=somma;
riga:=i;
end;
i:=i+1;
if i>3 then writeln('La somma maggiore e'': ',sum,' e si trova alla riga ',riga);
until i>3;
readln;
end.
 