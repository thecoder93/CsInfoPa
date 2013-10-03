program funzioni_consecutivi;

{$APPTYPE CONSOLE}

uses
  SysUtils;

type vettore=array[1..5]of integer;
var
vett:vettore;
t:integer;
ris:boolean;
procedure caricamento(var a:vettore);
var i:integer;
begin
for i:=1 to 5 do begin
writeln('Inserisci elemento ',i);
readln(a[i]);
end;
end;

function consecutivi(a:vettore):boolean;
var
i:integer;
trovato:boolean;
begin
trovato:=FALSE;
i:=1;
repeat
if (a[i]*a[i+1])< t then
trovato:=TRUE
else
i:=i+1;
until
(trovato=TRUE) or (i=5) ;
consecutivi:=trovato;
end;

begin
caricamento(vett);
writeln('Inserisci il valore di t');
readln(t);
ris:=consecutivi(vett);
writeln(ris);
readln;
end.
