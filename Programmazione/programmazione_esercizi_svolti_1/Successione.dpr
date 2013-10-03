program Successione;

{$APPTYPE CONSOLE}

uses
  SysUtils;

var
i,n:integer;
succ:real;
begin
writeln('Inserisci n');
readln(n);
succ:=0;
for i:=1 to n do
succ:=succ+1/i;
writeln('La somma dei primi ',n,' termini della serie armonica e''');
writeln(succ);
readln;
end.
