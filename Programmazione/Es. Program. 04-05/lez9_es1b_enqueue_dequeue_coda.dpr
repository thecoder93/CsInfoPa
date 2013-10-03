program lez9_es1b_enqueue_dequeue_coda;

{$APPTYPE CONSOLE}

uses
  SysUtils,
  Windows;

type
  puntatore= ^ele;
  ele= record
    inf: integer;
    pun: puntatore;
  end;

var
  ptesta: puntatore;
  pcoda: puntatore;
  x:integer;


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




procedure aggiungi(var p_coda: puntatore);
var ele: integer;
    paus: puntatore;

begin
  write('Digita l''elemento da inserire nella coda: ');
  readln(ele);

  if p_coda=NIL then begin
    new(ptesta);
    new(pcoda);
    ptesta^.inf:=ele;
    ptesta^.pun:=NIL;
    pcoda:=ptesta;
    end
  else begin
    new(paus);
    paus^.inf:=ele;
    paus^.pun:=NIL;
    p_coda^.pun:=paus;
    p_coda:=paus;
    end;

end;


procedure elimina(var ptesta: puntatore);
var paus: puntatore;

begin
  if ptesta=NIL then
    write('Impossibile eliminare un elemento in quanto la coda non contiene elementi.')
  else
    begin
      paus:=ptesta;
      ptesta:=paus^.pun;
      dispose(paus);
    end;
readln;
end;


procedure visualizza_coda (ptesta: puntatore);
var paus: puntatore;

begin

  if ptesta=NIL then
    write('LISTA VUOTA')

  else begin
    writeln;
    write('TESTA --> ');

    paus:=ptesta;

    while paus<>NIL do begin
      write(paus^.inf);
      write(' --> ');
      paus:=paus^.pun;
      end;

    write(' CODA');

  end;

readln;
end;


procedure menu;
begin

  writeln;
  writeln('MENU'' DI SCELTA');
  writeln;
  writeln('1.  Inserisci un elemento nella coda');
  writeln;
  writeln('2.  Elimina un elemento nella coda');
  writeln;
  writeln('0.  Esci');
  writeln;
  write('Inserisci il numero corrispondente all''operazione che vuoi svolgere: ');
  readln(x);
  writeln;

  if x<>0 then begin
    case x of
      1:  begin
          aggiungi(pcoda);
          visualizza_coda(ptesta);
          end;
      2:  begin
          elimina(ptesta);
          if ptesta=NIL then begin
            write('LISTA VUOTA');
            readln;
            end
          else
            visualizza_coda(ptesta);
          end;
      0:  begin
          exit;
          readln;
          end;
    end;
  end;
   clear;
end;

begin


writeln('PROGRAMMA PER CREARE UNA CODA E/O MODIFICARLA.');
writeln;

  repeat

    visualizza_coda(ptesta);
    menu;
  until x = 0



end.
