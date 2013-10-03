program lez9_es6_lista_merge;

{$APPTYPE CONSOLE}

uses
  SysUtils,
  Windows;

type
  puntatore= ^elemento;
  elemento=record
    inf: integer;
    pun: puntatore;
  end;

var lista1,lista2,ordinata: puntatore;


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

function crea_lista: puntatore;

var
  p,paus: puntatore;
  x: integer;

begin

  repeat
    write('Inserisci il primo elemento della lista (digidare 0 per terminare): ');
    readln(x);
  until x<>0;

  new(p);
  p^.inf:=x;
  p^.pun:=NIL;

  paus:=p;

  while x <> 0 do
  begin
    write('Inserisci l''elemento della lista (digidare 0 per terminare): ');
    readln(x);
    if x<>0 then begin
      new(paus^.pun);
      paus:=paus^.pun;
      paus^.inf:=x;
      paus^.pun:=NIL;
      end;
  end;

  crea_lista:=p;

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


//realizza il merge delle due liste
procedure merge (lista1,lista2: puntatore);

  procedure inserisci_in_lista (var k: puntatore; x: integer);
  var paus: puntatore;
  begin

    if k=NIL then begin
      new(k);
      k^.inf:=x;
      k^.pun:=NIL;
      end
    else begin
      paus:=k;
      while (paus^.pun)<>NIL do
        paus:=paus^.pun;

      new(paus^.pun);
      paus:=paus^.pun;
      paus^.inf:=x;
      paus^.pun:=NIL;
      end;
  end;


begin

  while (lista1<>NIL) and (lista2<>NIL) do begin
    if lista1^.inf<lista2^.inf then begin
      inserisci_in_lista(ordinata,lista1^.inf);
      lista1:=lista1^.pun;
      end
    else begin
      inserisci_in_lista(ordinata,lista2^.inf);
      lista2:=lista2^.pun;
      end;

  end;

  if lista1=NIL then
    while lista2<>NIL do begin
      inserisci_in_lista(ordinata,lista2^.inf);
      lista2:=lista2^.pun;
    end;

  if lista2=NIL then
    while lista1<>NIL do begin
      inserisci_in_lista(ordinata,lista1^.inf);
      lista1:=lista1^.pun;
    end;

end;

begin

writeln('INSERISCI LA PRIMA LISTA: ');
writeln;
lista1:=crea_lista;
writeln;
visualizza_lista(lista1);

writeln;
writeln;

writeln('INSERISCI LA SECONDA LISTA: ');
writeln;
lista2:=crea_lista;
writeln;
visualizza_lista(lista2);
writeln;
writeln;

writeln('MERGE DELLE DUE LISTE: ');
merge(lista1,lista2);
visualizza_lista(ordinata);


readln;
end.
 