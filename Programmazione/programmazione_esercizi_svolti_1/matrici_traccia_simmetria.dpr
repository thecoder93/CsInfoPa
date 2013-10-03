program matrici_traccia_simmetria;

{$APPTYPE CONSOLE}

uses
  SysUtils;

var
matrice:array[1..3,1..3]of integer;
i,j,trax:integer;
trovato:boolean;
begin
for i:=1 to 3 do
for j:=1 to 3 do begin
writeln('Inserisci l''elemento di riga ',i,' e colonna ',j);
readln(matrice[i,j]);
end;
j:=1;
i:=1;
trax:=0;
while (i<=3) or (j<=3)do begin
trax:=trax+matrice[i,j];
i:=i+1;
j:=j+1;
end;
writeln('La traccia della matrice e'': ',trax);
i:=1;
repeat
j:=1;
repeat
if matrice[i,j]=matrice[j,i] then begin
trovato:=true;
j:=j+1;
end
else begin
trovato:=false;
writeln('Matrice non simmetrica');
end;
until (trovato=false)or(j=4);
i:=i+1;
if (i=4)and(trovato=true)then
writeln('Matrice simmetrica');
until(trovato=false)or(i=4);

readln;

end.
