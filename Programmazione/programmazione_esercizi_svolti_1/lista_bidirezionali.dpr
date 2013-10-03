program lista_bidirezionali;

{$APPTYPE CONSOLE}

uses
  SysUtils;

type
puntatore=^cella;
cella=record
info:integer;
next:puntatore;
pred:puntatore;
end;
var testa:puntatore;
x,count:integer;

procedure stampa(testa:puntatore);
begin
if testa=nil then
writeln('-->NIL')
else begin
write(testa^.info);
write('<-- -->');
stampa(testa^.next);
end;
end;

procedure crea_lista(var testa:puntatore);
var paux:puntatore;
x:integer;
begin
writeln('Inserisci un elemento della lista');
readln(x);
if x=0 then begin
writeln('La lista e'' formata da ',count,' elementi!');
testa:=nil;
end
else begin
new(paux);
paux^.info:=x;
paux^.next:=nil;
testa:=paux;
paux^.pred:=testa;
count:=count+1;
crea_lista(testa^.next);
end;
end;

procedure ricerca(testa:puntatore);
begin
if testa=nil then writeln('Lista vuota')
else
if testa^.info=x then
writeln('Elemento trovato')
else
if (testa^.next=nil) then
writeln('Elemento non presente nella lista')
else
ricerca(testa^.next);
end;

procedure cancella(var testa:puntatore);
begin
if testa=nil then writeln('Lista vuota')
else begin
if (testa^.info<>x)and(testa^.next=nil) then
writeln('Elemento non presente nella lista');
if (testa^.info<>x)then
cancella(testa^.next)
else begin
if testa^.next=nil then begin
testa:=nil;
count:=count-1;
writeln('La lista e'' formata da ',count,' elementi!');
end
else
begin
testa^.next.pred:=testa^.pred;
testa:=testa^.next;
count:=count-1;
writeln('La lista e'' formata da ',count,' elementi!');
end;
end;
end;
end;

procedure inserisci(var testa:puntatore;i:integer);
var paux:puntatore;
x:integer;
begin
if testa=nil then begin
writeln('Inserisci il valore da inserire');
readln(x);
if x=0 then writeln('Elemento non valido')
else begin
new(paux);
paux^.info:=x;
paux^.next:=nil;
testa:=paux;
paux^.pred:=testa;
count:=count+1;
writeln('La lista e'' formata da ',count,' elementi!');
end;
end
else
if (count mod 2)<>0 then
writeln('Impossibile inserire elemento nel mezzo,numero elemeti lista dispari')
else
if i<=(count div 2) then
inserisci(testa^.next,i+1)
else
begin
writeln('Inserisci il valore da inserire');
readln(x);
new(paux);
paux^.info:=x;
paux^.next:=testa;
paux^.next.pred:=testa^.pred;
testa^.pred:=paux^.pred;
testa:=paux;
count:=count+1;
writeln('La lista e'' formata da ',count,' elementi!');
end;
end;


begin
count:=0;
crea_lista(testa);
stampa(testa);

writeln('Inserisci l''elemento da cercare nella lista');
readln(x);
ricerca(testa);

writeln('Inserisci l''elemento da elminare nella lista');
readln(x);
cancella(testa);
stampa(testa);

inserisci(testa,1);
stampa(testa);

readln;
end.


