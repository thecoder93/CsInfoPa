program Somma_Di_Cubi2;

{$APPTYPE CONSOLE}

uses
  SysUtils;

var
i,j,k,x:integer;
begin
writeln('Premi INVIO per trovare i numeri');
readln;
for x:=150 to 410 do begin
i:=(x div 100);
j:=(x div 10)-(i*10);
k:=x-(i*100)-(j*10);
if x=(i*i*i)+(j*j*j)+(k*k*k) then
writeln(x);
end;
writeln('Questi sono i numeri....!!!!');
readln;
end.
