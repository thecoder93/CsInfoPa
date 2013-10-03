program vettori_confronto;

{$APPTYPE CONSOLE}

uses
  SysUtils;

type vettore=array[1..5] of integer;
var
u,v:vettore;
x:boolean;
i:integer;
begin
for i:=1 to 5 do begin
writeln('Inserisci il valore ',i,' del primo vettore');
readln(u[i]);
end;
for i:=1 to 5 do begin
writeln('Inserisci il valore ',i,' del secondo vettore');
readln(v[i]);
end;

i:=1;
repeat
if u[i]=v[i] then begin
x:=true;
if i=5 then begin
x:=false;
writeln('I due vettori sono uguali!!');
end;
end
else begin
x:=false;
writeln('I due vettori non sono uguali!!');
end;
i:=i+1;
until x=false;

readln;
end.
