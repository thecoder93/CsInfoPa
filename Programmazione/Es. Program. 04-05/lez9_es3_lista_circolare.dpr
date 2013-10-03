program lez9_es3_lista_circolare;

{$APPTYPE CONSOLE}

uses
  SysUtils,
  Windows;

type
  puntatore= ^elemento;
  elemento=record
    inf: char;
    pun: puntatore;
  end;


var p: puntatore;


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


//funzione per creare la lista

procedure crea_lista;

var
  paus: puntatore;
  x: char;

begin

  repeat
    write('Inserisci il primo elemento della lista (digidare 0 per terminare): ');
    readln(x);
  until x<>'0';

  new(p);
  p^.inf:=x;
  p^.pun:=NIL;

  paus:=p;

  while x <> '0' do
  begin
    write('Inserisci l''elemento della lista (digidare 0 per terminare): ');
    readln(x);
    if x<>'0' then begin
      new(paus^.pun);
      paus:=paus^.pun;
      paus^.inf:=x;
      paus^.pun:=NIL;
      end;
  end;

end;



//procedura per visualizzare la lista

procedure visualizza_lista (p: puntatore);
begin
  if p<>NIL then begin
    writeln;
    write('Inizio Lista --> ');
    while p<> NIL do
      begin
      write(p^.inf);
      write(' --> ');
      p:=p^.pun;
    end;

    writeln('Fine Lista');
  end;

end;


//circolarizza lista :P

procedure circola (var p: puntatore);
var paus: puntatore;
begin

  paus:=p;

  while paus^.pun<>NIL do
    paus:=paus^.pun;

  paus^.pun:=p;

end;



//sposta testa
procedure shift(var p:puntatore);
var n,i: integer;
begin

  writeln;
  write('Inserisci il numero di caratteri da spostare: ');
  readln(n);
  writeln;


  for i:=1 to n do begin
    p:=p^.pun;
  end;

end;


//decircolarizza lista

procedure decircola (var p:puntatore);
var paus: puntatore;
begin

  paus:=p;

  while paus^.pun<>p do
    paus:=paus^.pun;

  paus^.pun:=NIL;

end;



begin

crea_lista;
visualizza_lista(p);
writeln;
writeln('Premere INVIO per continuare.');
readln;
clear;
visualizza_lista(p);
circola(p);
shift(p);
decircola(p);
visualizza_lista(p);
readln;


end.
 