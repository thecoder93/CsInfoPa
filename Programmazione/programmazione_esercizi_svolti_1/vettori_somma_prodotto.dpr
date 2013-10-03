program vettori_somma_prodotto;

{$APPTYPE CONSOLE}

uses
  SysUtils;

type vettore=array[1..5] of integer;
var
u,v:vettore;
i,somma,prod:integer;
begin
for i:=1 to 5 do begin
writeln('Inserisci il valore ',i,' del primo vettore');
readln(u[i]);
end;
for i:=1 to 5 do begin
writeln('Inserisci il valore ',i,' del secondo vettore');
readln(v[i]);
end;
writeln('Il vettore somma e'' dato da:');
for i:=1 to 5 do begin
somma:=u[i]+v[i];
write(' ',somma);
end;
writeln;
writeln('Il vettore prodotto e'' dato da:');
for i:=1 to 5 do begin
prod:=u[i]*v[i];
write(' ',prod);
end;
readln;
end.
