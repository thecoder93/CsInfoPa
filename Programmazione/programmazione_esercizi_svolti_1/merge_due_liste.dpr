program merge_due_liste;

{$APPTYPE CONSOLE}

uses
  SysUtils;

type puntatore=^cella;
cella=record
info:integer;
next:puntatore;
end;
var testa,testa2,testa3:puntatore;
x:integer;

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
writeln('Inserisci elemento della lista,premi zero per terminare');
readln(x);
if x=0 then
testa:=nil
else begin
new(testa);
testa^.info:=x;
testa^.next:=nil;
inserimento_lista(testa^.next);
end;
end;

procedure merge(testa,testa2:puntatore;var testa3:puntatore);
begin
if (testa=nil) and (testa2=nil)then
writeln('Merge Completata')
else
 if (testa=nil) or (testa2=nil) then begin
 if testa<>nil then
     begin
     new(testa3);
     testa3^.info:=testa^.info;
     testa3^.next:=nil;
     merge(testa^.next,testa2,testa3^.next);
     end
 else
 if testa2<>nil then
     begin
     new(testa3);
     testa3^.info:=testa2^.info;
     testa3^.next:=nil;
     merge(testa,testa2^.next,testa3^.next);
     end
 end

 else
 if testa^.info<=testa2^.info then
     begin
     new(testa3);
     testa3^.info:=testa^.info;
     testa3^.next:=nil;
     merge(testa^.next,testa2,testa3^.next);
     end
  else
  if testa^.info>testa2^.info then
     begin
     new(testa3);
     testa3^.info:=testa2^.info;
     testa3^.next:=nil;
     merge(testa,testa2^.next,testa3^.next);
     end;

end;


begin
inserimento_lista(testa);
writeln('Lista 1 formata da:');
stampa(testa);
inserimento_lista(testa2);
writeln('Lista 2 formata da:');
stampa(testa2);
if (testa=nil)and(testa2=nil) then
writeln('Liste entrambe vuote!! Impossibile effettuare il merge!!')
else begin
merge(testa,testa2,testa3);
writeln('Lista 3 formata da:');
stampa(testa3);
end;
readln;
end.
