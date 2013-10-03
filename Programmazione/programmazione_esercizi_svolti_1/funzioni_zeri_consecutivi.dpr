program funzioni_zeri_consecutivi;

{$APPTYPE CONSOLE}

uses
  SysUtils;

type
matrice=array[1..4,1..4]of 0..1;
var
x,y,t:boolean;
mat:matrice;
procedure crea_matrice(var mat:matrice);
var i,j:integer;
begin
for i:=1 to 4 do
for j:=1 to 4 do begin
writeln('Inserisci l''elemento di riga ',i,' e colonna ',j);
readln(mat[i,j]);
end;
end;

function riga(mat:matrice):boolean;
var trovato:boolean; i,j,count:integer;
begin
count:=0;
trovato:=false;
i:=1;
repeat
if trovato=true then
count:=count+1;
j:=1;
trovato:=false;
repeat
if (mat[i,j]=0)and(mat[i,j+1]=0)then
trovato:=true
else
j:=j+1;
until (trovato=true)or(j=3);
i:=i+1;
if count=4 then
trovato:=true;
until (trovato=true)or(i=4);
riga:=trovato;
end;

function colonna(mat:matrice):boolean;
var trovato:boolean; i,j,count:integer;
begin
count:=0;
trovato:=false;
j:=1;
repeat
if trovato=true then
count:=count+1;
i:=1;
trovato:=false;
repeat
if (mat[i,j]=0)and(mat[i+1,j]=0)and(mat[i+2,j]=0)then
trovato:=true
else
i:=i+1;
until (trovato=true)or(i=2);
j:=j+1;
if count=4 then
trovato:=true;
until (trovato=true)or(i=4);
colonna:=trovato;
end;

procedure stampa_matrice(mat:matrice);
var i,j:integer;
begin
for i:=1 to 4 do begin
writeln;
for j:=1 to 4 do
write(mat[i,j]:5)
end;
end;
begin
crea_matrice(mat);
stampa_matrice(mat);
writeln;
x:=riga(mat);
y:=colonna(mat);
writeln('Premi INVIO per il responso');
if (x and y)=false then
t:=false
else
t:=true;
readln;
writeln(t);
readln;
end.
