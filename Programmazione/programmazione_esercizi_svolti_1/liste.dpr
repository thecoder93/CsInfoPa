program liste;

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
count,i,x:integer;
p:puntatore;
trovato:boolean;

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
var x:integer;
begin
writeln('Inserisci il valore da inserire');
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

function conta(p:puntatore;count:integer):integer;
begin
if p=nil then
conta:=count
else
conta:=conta(p^.next,count+1);
end;

procedure inserimento(var p:puntatore;indice:integer);
var paux:puntatore;
begin
if indice=i then begin
new(paux);
paux^.info:=x;
paux^.next:=p;
p:=paux;
end;
if p=nil then
writeln('Inserimento completato')
else
inserimento(p^.next,indice+1)
end;

procedure elimina(var p:puntatore;indice:integer);
var paux:puntatore;
begin
if p=nil then
writeln('Eliminazione completata')
else
if indice=i then begin
paux:=p;
p:=p^.next;
dispose(paux);
end
else
elimina(p^.next,indice+1)
end;

function cerca(p:puntatore):boolean;
begin
if p=nil then
cerca:=false
else
if p^.info=x then
cerca:=true
else
cerca:=cerca(p^.next);
end;

procedure elimina_elementi(var p:puntatore);
var paux:puntatore;
begin
if p=nil then
writeln('Cancellazione completata')
else
if p^.info=x then begin
paux:=p;
p:=p^.next;
dispose(paux);
elimina_elementi(p);
end
else
elimina_elementi(p^.next);
end;


begin
crea_lista(p);
stampa(p);
conta(p,0);
count:=conta(p,0);
writeln('Gli elementi della lista sono : ',count);
writeln('Inserisci la posizione di inserimento');
readln(i);
writeln('Inserisci il valore da inserire');
readln(x);
inserimento(p,1);
stampa(p);
writeln('Inserisci la posizione da eliminare');
readln(i);
elimina(p,1);
stampa(p);
writeln('Inserisci il valore da cercare');
readln(x);
trovato:=cerca(p);
writeln(trovato);
writeln('Inserisci il valore da eliminare dalla lista');
readln(x);
elimina_elementi(p);
stampa(p);
readln;
end.
