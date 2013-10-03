program lez9_es2_lista_bidirezionale;

{$APPTYPE CONSOLE}

uses
  SysUtils,Windows;

type
  lista=^ele;
  ele=record
    inf: integer;
    pun: lista;
    pred: lista;
  end;

var p: lista;
    x: integer;


//procedura pulisci schermo
procedure clear;
var
   CoordScr: TCoord;
   hConsole: THandle;
   dwLength, noCharsWritten: DWORD;
   csbi: CONSOLE_SCREEN_BUFFER_INFO;
begin
   CoordScr.X := 0;
   CoordScr.Y := 0;
   hConsole := GetStdHandle(STD_OUTPUT_HANDLE);
   GetConsoleScreenBufferInfo(hConsole, csbi);
   dwLength := csbi.dwSize.X * csbi.dwSize.Y;
   FillConsoleOutputCharacter(hConsole, ' ', dwLength, CoordScr, noCharsWritten);
   SetConsoleCursorPosition(hConsole, CoordScr);
end;



procedure crea_lista;
var i: integer;
    paus: lista;

begin

  repeat
    write('Inserisci il primo elemento della lista (inserire 0 per terminare): ');
    readln(i);

    if i<>0 then begin
      new(p);
      p^.pred:=NIL;
      p^.inf:=i;
      p^.pun:=NIL;
      end
    else begin
      p:=NIL;
      writeln('La lista non e'' stata creata.');
      writeln;
      end;

  until p<>NIL;

  paus:=p;

  repeat
    write('Inserisci un elemento della lista (inserire 0 per terminare): ');
    readln(i);
    if i<>0 then begin
      new(paus^.pun);
      (paus^.pun)^.pred:=paus;
      paus:=paus^.pun;
      paus^.inf:=i;
      paus^.pun:=NIL;
      end;
  until i=0;

end;



procedure visualizza_lista (p: lista);
begin

  if p<>NIL then begin
    writeln;
    write('Inizio Lista --> ');
    while p<>NIL do
      begin
      write(p^.inf);
      write(' <--> ');
      p:=p^.pun;
      end;
    writeln('Fine Lista');
    end
  else
    writeln('LISTA VUOTA.');


end;


procedure ricerca(p: lista);
var x,i: integer;
    trovato: boolean;

begin

  writeln;
  write('Inserisci l''elemento da cercare: ');
  readln(x);
  writeln;

  trovato:=false;
  i:=1;

  repeat
    if p^.inf=x then
      trovato:=true
    else begin
      p:=p^.pun;
      i:=i+1;
      end;
  until trovato or (p=NIL);

  if trovato then begin
    writeln('L''elemento cercato e'' presente nella lista alla posizione ',i);
    writeln;
    writeln('Premere INVIO per continuare.');
    end
  else begin
    writeln('Elemento non presente nella lista.');
    writeln;
    writeln('Premere INVIO per continuare.');
    end;

readln;

end;



procedure elimina (var p: lista);
var paus: lista;
    x: integer;
begin

if p=NIL then
  writeln('Impossibile eliminare un elemento in quanto la lista e'' vuota.')
else begin

writeln;
write('Digita l''elemento da eliminare: ');
readln(x);
writeln;

  if p^.inf=x then    //se l'elemento è il primo della lista
    if p^.pun<>NIL then begin
      p:=p^.pun;
      dispose(p^.pred);
      p^.pred:=NIL;
      end
    else
      p:=NIL;  //se è contemporaneamente il primo e l'ultimo, la lista è vuota

  paus:=p;

  while paus<>NIL do begin
    if paus^.inf=x then
      if paus^.pun<>NIL then begin      //se l'elemento si trova a metà lista
        (paus^.pun)^.pred:=paus^.pred;
        paus:=paus^.pun;
        dispose((paus^.pred)^.pun);
        (paus^.pred)^.pun:=paus;
        end
      else begin    //se l'elemento si trova a fine lista
        paus:=paus^.pred;
        dispose(paus^.pun);
        paus^.pun:=NIL;
        end
    else
      paus:=paus^.pun;

  end;
 end;
end;



procedure inserisci(var p: lista);
var x,i,k: integer;
    paus,paus2: lista;
begin

write('Inserisci l''elemento da inserire: ');
readln(x);

  if p=NIL then begin   //se la lista è vuota
    new(p);
    p^.pred:=NIL;
    p^.inf:=x;
    p^.pun:=NIL;
    end
  else begin  //se la lista non è vuota
    paus:=p;
    i:=0;
    while paus<>NIL do begin
      paus:=paus^.pun;
      i:=i+1;
      end;

    if (i mod 2)=0 then
      k:=i div 2
    else
      k:=(i div 2)+1;

    i:=1;
    paus:=p;

    while (paus<>NIL) and (i<k) do begin
      paus:=paus^.pun;
      i:=i+1;
      end;

    new(paus2);
    paus2^.inf:=x;
    paus2^.pun:=paus^.pun;
    paus2^.pred:=paus;
    paus^.pun:=paus2;
    (paus^.pun)^.pred:=paus2;


    end




end;


procedure menu;
begin

writeln;
writeln('MENU'' DI SCELTA');
writeln;
writeln('1.  Ricerca un elemento');
writeln;
writeln('2.  Elimina un elemento');
writeln;
writeln('3.  Inserisci un elemento');
writeln;
writeln('0.  Esci');
writeln;

write('Inserisci l''operazione da svolgere: ');
readln(x);
writeln;

case x of
  1:  begin
      if p=NIL then begin
        writeln('Impossibile cercare un elemento in quanto la lista e'' vuota.');
        writeln;
        write('Premere INVIO per continuare.');
        readln;
        end
      else
        ricerca(p);
      end;
  2:  begin
      elimina(p);
      visualizza_lista(p);
      writeln;
      write('Premere INVIO per continuare.');
      readln;
      end;
  3:  begin
      inserisci(p);
      visualizza_lista(p);
      writeln;
      write('Premere INVIO per continuare.');
      readln;
      end;
  0:  exit;
end;

end;


begin

crea_lista;
visualizza_lista(p);
writeln;
writeln('Premere INVIO per continuare.');
readln;

  repeat
    clear;
    visualizza_lista(p);
    menu;
  until x=0;



end.
 