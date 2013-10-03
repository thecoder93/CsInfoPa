program crea_due_liste;

{$APPTYPE CONSOLE}

uses
  SysUtils;

type puntatore=^cella;
cella=record
info:char;
next:puntatore;
end;
var testa,a,b:puntatore;
x:char;

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

procedure crea_liste(var a,b:puntatore;testa:puntatore);
var paux:puntatore;
begin
if testa=nil then begin
writeln('Creazione lista completata');
a:=nil;
b:=nil;
end
else
case testa^.info of
'a','e','i','o','u':
begin
new(paux);
paux^.info:=testa^.info;
a:=paux;
paux^.next:=nil;
crea_liste(a^.next,b,testa^.next)
end
else begin
new(paux);
paux^.info:=testa^.info;
b:=paux;
paux^.next:=nil;
crea_liste(a,b^.next,testa^.next);
end;
end;
end;

begin
inserimento_lista(testa);
stampa(testa);
crea_liste(a,b,testa);
stampa(a);
stampa(b);
readln;
end.
