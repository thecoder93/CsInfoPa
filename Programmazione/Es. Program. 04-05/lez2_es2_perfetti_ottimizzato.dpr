program perfetti;

{$APPTYPE CONSOLE}

uses
  SysUtils;
var
  i,n:longint;
  m,l:real;
function primi(x:longint):boolean;
  var
    a,b:longint;
    c:boolean;
  begin

    a:=trunc(sqrt(x));
    for b:=2 to a do begin
      if x mod b = 0 then
        c:=FALSE;
    end;
    primi:= c;

  end;

function potenza(x:longint;y:longint): real;
  var
    c,t:longint;
  begin
    c:=1;
    for t:=1 to y do
      c:=c*x;
    potenza:=c;
  end;

begin

  write('Inserisci il range: ');
  readln(n);
  writeln;
  writeln;
  writeln('Ed ecco a voi i numeri perfetti: ');
  writeln;
  for i:=1 to n do begin
   l:=(potenza(2,(i+1)))-1;
    if primi(trunc(l)) then begin
      m:=(potenza(2,i))*l;
      writeln(m:0:0);
    end;
  end;
  readln;
end.
