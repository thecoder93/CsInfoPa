program lez9_es5_lista_separa_voc_cons;

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

var lista,voc,cons: puntatore;


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


//crea 2 liste: una delle consonanti e una per le vocali
procedure separa (p:puntatore);

  procedure inserisci_in_lista (var k: puntatore; x: char);
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

  while p<>NIL do begin
    if (p^.inf='a') or (p^.inf='e') or (p^.inf='i') or (p^.inf='o') or (p^.inf='u') then
      inserisci_in_lista(voc,p^.inf)
    else
      inserisci_in_lista(cons,p^.inf);

    p:=p^.pun;
  end;

end;


begin


lista:= crea_lista;
writeln;
writeln('LISTA ORIGINALE:  ');
visualizza_lista(lista);
writeln;

separa(lista);

if voc<>NIL then begin
  writeln;
  writeln('LISTA DELLE VOCALI: ');
  visualizza_lista(voc);
  end
else
  writeln('Non vi sono vocali');

if cons<>NIL then begin
  writeln;
  writeln('LISTA DELLE CONSONANTI: ');
  visualizza_lista(cons);
  writeln;
  end
else begin
  writeln;
  writeln('Non vi sono consonanti');
  end;

readln;
end.
