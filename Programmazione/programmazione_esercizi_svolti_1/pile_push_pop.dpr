program pile_push_pop;

{$APPTYPE CONSOLE}

uses
  SysUtils;

type
puntatore=^cella;
cella=record
info:integer;
next:puntatore;
end;
var
p:puntatore;
x:integer;

procedure stampa(p:puntatore);
begin
if p=nil then
writeln('-->NIL')
else begin
write('-->',p^.info);
stampa(p^.next);
end;
end;

procedure crea_lista(var p:puntatore);
begin
writeln('Inserisci il valore da inserire (0 per terminare)');
readln(x);
if x=0 then
p:=nil
else begin
new(p);
p^.info:=x;
p^.next:=nil;
crea_lista(p^.next);
end;
end;

procedure push(var p:puntatore);
var paux:puntatore;
begin
writeln('Inserisci il valore da inserire (0 per terminare)');
readln(x);
if x=0 then
writeln('Inserimento terminato')
else begin
new(paux);
paux^.info:=x;
paux^.next:=p;
p:=paux;
push(p);
end;
end;

procedure pop(var p:puntatore);
var x:char;
paux:puntatore;
begin
writeln('Inserisci ''e'' per eliminare, ''t'' per terminare');
readln(x);
if x='t' then
writeln('Eliminazione terminata')
else
if x='e' then begin
if p=nil then
writeln('Impossibile eliminare, pila vuota')
else begin
paux:=p;
p:=p^.next;
dispose(paux);
stampa(p);
pop(p);
end;
end;
end;

begin
crea_lista(p);
stampa(p);
push(p);
stampa(p);
pop(p);
readln;
end.
