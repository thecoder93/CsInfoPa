program vettori_ai_i;

{$APPTYPE CONSOLE}

uses
  SysUtils;

const
n=5;
var
i:integer;
a:array[1..n] of integer;
x:boolean;
begin
for i:=1 to n do begin
writeln('Inserisci il valore ',i,' del vettore A');
readln(a[i]);
end;
x:=false;
i:=1;
repeat
if (a[i]<=i)and (i=5) then begin
writeln('Non esiste a[i]>i');
x:=true;
end
else
if a[i]>i then begin
writeln('Esiste a[i]>i');
x:=true;
end;
i:=i+1;
until x=true;
readln;
end.
