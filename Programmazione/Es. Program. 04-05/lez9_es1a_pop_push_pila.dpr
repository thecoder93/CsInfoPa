program lez9_es1a_pop_push_pila;

{$APPTYPE CONSOLE}

uses
  SysUtils;

type
  puntatore=^ele;
  ele=record
    inf: integer;
    pun: puntatore;
    end;

var
  p: puntatore;


procedure crea_lista;
var i: integer;
    paus: puntatore;

begin

  write('Inserisci il primo elemento della pila (premere 0 per terminare): ');
  readln(i);

  if i=0 then begin
    p:=NIL;
    writeln;
    writeln('La pila non contiene nessun elemento.');
    readln;
    end
  else begin
    new(p);
    p^.inf:=i;
    p^.pun:=NIL;
    end;


  while i<>0 do begin
    write('Inserisci un elemento nella pila (premere 0 per terminare): ');
    readln(i);
    if i<>0 then begin
      new(paus);
      paus^.pun:=p;
      p:=paus;
      p^.inf:=i;
      end;
  end;

end;


procedure visualizza_lista (p: puntatore);
begin

  if p<>nil then begin
    writeln;
    write('INIZIO LISTA  -->  ');
    while p<>NIL do begin
      write(p^.inf);
      write(' --> ');
      p:=p^.pun;
      end;
    write('FINE LISTA.');

  end;
end;


procedure inserimento(var p: puntatore);
var e: integer;
    paus: puntatore;

begin

  write('Digitare l''elemento da inserire nella pila: ');
  readln(e);

  new(paus);
  paus^.pun:=p;
  p:=paus;
  p^.inf:=e;

end;


procedure eliminazione(var p:puntatore);
var paus: puntatore;

begin

  paus:=p;
  p:=paus^.pun;
  dispose(paus);

end;


procedure menu;
var x: integer;

begin
  if p<> NIL then begin
  writeln;
  writeln;
  writeln;
  writeln('MENU'' DI SELEZIONE');
  writeln;
  writeln('1.  Inserisci un elemento');
  writeln;
  writeln('2.  Elimina un elemento');
  writeln;
  writeln('0.  Esci');
  writeln;
  writeln;
  write('Selezionare l''operazione da svolgere: ');
  readln(x);
  writeln;
  case x of
    1:  begin
        inserimento(p);
        visualizza_lista(p);
        readln;
        end;
    2:  begin
        eliminazione(p);
        visualizza_lista(p);
        readln;
        end;
    0: exit;
  end;
  end;
end;



begin

  crea_lista;
  visualizza_lista(p);
  menu;



end.
 