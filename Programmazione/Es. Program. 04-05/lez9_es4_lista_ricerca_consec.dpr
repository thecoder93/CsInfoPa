program lez9_es4_lista_ricerca_consec;

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
    ver: boolean;


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


//stabilisce se ha due valori consecutivi uguali
function verifica(p: puntatore) : boolean;
begin

  if (p^.pun<>NIL) and (ver=false) then
    if p^.inf=(p^.pun)^.inf then
      ver:=true
    else
      verifica(p^.pun);

  verifica:=ver;

end;


begin

crea_lista;
writeln;
visualizza_lista(p);
writeln;
ver:=false;

if verifica(p) then
  write('Vi sono due elementi consecutivi della lista che sono uguali.')
else
  write('Non vi sono elementi uguali consecutivi.');

 readln;
end.
 