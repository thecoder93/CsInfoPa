program celle_consecutive;

{$APPTYPE CONSOLE}

uses
  SysUtils;

type puntatore=^cella;
cella=record
info:char;
next:puntatore;
end;

var
testa:puntatore;
x:char;
z:boolean;

procedure stampa(testa:puntatore);
begin
if testa=nil then
writeln('-->NIL')
else begin
write(testa^.info);
write('-->');
stampa(testa^.next);
end;
end;

procedure inserimento_lista(var testa:puntatore);
begin
writeln('Inserisci elemento della lista');
readln(x);
if x=('0') then
testa:=nil
else begin
new(testa);
testa^.info:=x;
testa^.next:=nil;
inserimento_lista(testa^.next);
end;
end;

function booleana(testa:puntatore):boolean;
begin
if (testa=nil) or (testa^.next=nil) then begin
writeln('Controllo completato');
booleana:=false;
end
else
if testa^.info=testa^.next.info then begin
writeln('Controllo completato');
booleana:=true;
end
else
booleana:=booleana(testa^.next);
end;

begin
inserimento_lista(testa);
stampa(testa);
z:=booleana(testa);
writeln(z);
readln;
end.
