program code_enqueue_dequeue;

{$APPTYPE CONSOLE}

uses
  SysUtils;

type

puntatore=^cella;
cella=record
info:integer;
next:puntatore;
end;



var x:integer;
testa,coda:puntatore;
risp:char;

procedure stampa(testa:puntatore);
begin
if testa=nil then
writeln('NIL')
else begin
write(testa^.info);
write('-->');
stampa(testa^.next);
end;
end;

procedure enqueue(var testa:puntatore;var coda:puntatore;x:integer);
var paux:puntatore;
begin
new(paux);
paux^.info:=x;
paux^.next:=nil;
if coda=nil then
begin
coda:=paux;
testa:=paux;
end
else
coda^.next:=paux;
coda:=paux;
end;

procedure dequeue(var testa:puntatore);
var paux:puntatore;
begin
if testa=nil then
writeln('Lista vuota')
else
begin
paux:=testa;
testa:=testa^.next;
dispose(paux);
end;
end;

begin
repeat
writeln('Inserisci l''elemento da inserire nella coda ');
readln(x);
enqueue(testa,coda,x);
stampa(testa);
writeln('Vuoi cancellare?');
readln(risp);
if risp='s' then begin
dequeue(testa);
stampa(testa);
end;
writeln('Vuoi uscire?');
readln(risp)
until risp='s';

readln;
end.
