program procedure_array_modifica;

{$APPTYPE CONSOLE}

uses
  SysUtils;

type vettore=array[1..5]of integer;
var
vett:vettore;
procedure caricamento(var a:vettore);
var i:integer;
begin
for i:=1 to 5 do begin
writeln('Inserisci elemento ',i);
readln(a[i]);
end;
end;

procedure modifica(var a:vettore);
var i:integer;
begin
for i:=1 to 5 do begin
if (a[i] mod 2) <>0 then
a[i]:=(a[i])-(2*a[1])
else
a[i]:=2*a[i];
end;
end;

procedure stampa(a:vettore);
var i:integer;
begin
for i:=1 to 5 do
write(' ',a[i]);
end;
begin
caricamento(vett);
modifica(vett);
stampa(vett);
readln;
end.
