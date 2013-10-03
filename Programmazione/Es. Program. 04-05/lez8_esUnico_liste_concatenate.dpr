program lez8_esUnico_liste_concatenate;

{$APPTYPE CONSOLE}

uses
  SysUtils,Windows;

//dichiarazione dei tipi globali

type
  puntatore= ^elemento;
  elemento=record
    inf: integer;
    pun: puntatore;
  end;

//dichiarazione delle variabili globali

var
  punt_lista: puntatore;
  x,y,i: integer;

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
writeln;
end;




  //procedura per visualizzare la lista

procedure visualizza_lista (p: puntatore);
begin
  if p <> NIL then begin
    write('Inizio Lista --> ');
    while p<> NIL do begin
      write(p^.inf);
      write(' --> ');
      p:=p^.pun;
    end;

    writeln('Fine Lista');
  end;
end;

//funzione_punto1
function funzione_punto1(p:puntatore) : integer;
var
  x:integer;
begin
  x:=0;
  while p <> NIL do
    begin
      x:=x+1;
      p:=p^.pun;
    end;
    funzione_punto1:=x;
end;
//procedura_punto2
procedure procedura_punto2(var p:puntatore;i,y:integer);
var
  k: integer;
  paus,p2:puntatore;
begin
  k:=0;
  paus:=p;
  if i > (funzione_punto1(punt_lista)+1) then
    writeln('ERRORE l''indice da te inserito e'' maggiore della lunghezza della lista')
  else begin
    while k < i-2 do
      begin
        k:=k+1;
        paus:=paus^.pun;
      end;
    new(p2);
    p2^.inf:=y;
    if i=1 then
      begin
        p2^.pun:=p;
        p:=p2;
      end
    else
     begin
      p2^.pun:=paus^.pun;
      paus^.pun:=p2;
     end;
  end;
end;

//procedura_punto3
procedure procedura_punto3(var p:puntatore;i:integer);
var
  k: integer;
  paus,paus2:puntatore;
begin
  k:=0;
  paus:=p;
  if i > (funzione_punto1(punt_lista)) then begin
      writeln;
      writeln('ERRORE l''indice da te inserito e'' maggiore della lunghezza della lista')
    end
  else begin
    while k < i-2 do
      begin
        k:=k+1;
        paus:=paus^.pun;
      end;
    paus2:=paus^.pun;
    if i=1 then
      begin
        dispose(paus);
        p:=paus2;
      end
    else
      begin
        paus^.pun:=paus2^.pun;
        dispose(paus2);
      end;
  end;
end;

//funzione_punto4
function funzione_punto4(p:puntatore;x:integer): boolean;
var
  j:boolean;
begin
j:=FALSE;
while (p <> NIL) and (j=FALSE)do
  begin
    if p^.inf = x then
      j:=TRUE;
    p:=p^.pun;
  end;
funzione_punto4:=j;
end;

//procedura_punto5
procedure procedura_punto5(var p:puntatore;x:integer);
var
  paus,paus2:puntatore;
begin
  paus:=p;
    while paus^.inf=x do
      begin
        paus2:=paus^.pun;
        dispose(paus);
        p:=paus2;
        paus:=paus2;
      end;
    paus2:=paus;
    paus:=paus^.pun;
    while paus <> NIL do
      begin
        if paus^.inf=x then
          begin
            paus2^.pun:=paus^.pun;
            dispose(paus);
            paus:=paus2^.pun;
          end
        else
          begin
            paus2:=paus;
            paus:=paus^.pun;
          end;
      end;
    if paus2^.inf = x then
      p:=NIL;
end;

//procedura menu
procedure menu;
begin
  if punt_lista <> NIL then begin
    clear;
    visualizza_lista(punt_lista);
    writeln;
    writeln;
    writeln;
    writeln;
    writeln('Digitare un numero da 1 a 5 per eseguire le seguenti operazioni:');
    writeln('1. Contare gli elementi della lista');
    writeln('2. Inserimento di un elemento nella lista');
    writeln('3. Eliminazione di un elemento dalla lista');
    writeln('4. Ricerca di un elemento all''interno della lista');
    writeln('5. Eliminazione di ogni occorrenza di un elemento');
    writeln('0. Esci');
    writeln;
    write('Digitare il numero riferito all''operazione da eseguire: ');
    readln(x);
    writeln;

    case x of
      1: begin
          writeln('La lista e'' formata da ',funzione_punto1(punt_lista),' elementi');
          readln;
         end;
      2: begin
          write('Digita il nuovo elemento da inserire nella lista: ');
          readln(y);
          write('Digita l''indice nel quale inseririe l''elemento: ');
          readln(i);
          procedura_punto2(punt_lista,i,y);
          writeln;
          visualizza_lista(punt_lista);
          readln;
         end;
      3: begin
          write('Digita l''indice dell'' elemento da eliminare: ');
          readln(i);
          procedura_punto3(punt_lista,i);
          writeln;
          visualizza_lista(punt_lista);
          readln;
         end;
      4: begin
          write('Digita l''elemento da ricercare: ');
          readln(i);
          if funzione_punto4(punt_lista,i) then
            write('L''elemento cercato e'' contenuto nella lista')
          else
            write('L''elemento cercato non e'' contenuto nella lista');
            readln;
         end;
      5: begin
          write('Digita l''elemento da eliminare dalla lista: ');
          readln(i);
          procedura_punto5(punt_lista,i);
          writeln;
          visualizza_lista(punt_lista);
          readln;
         end;
      0: exit;
    else begin
      writeln('Cifra fuori intervallo');
      menu;
      end;
    end;
  end;
end;


//inizio programma principale
begin

  //creazione lista

  punt_lista:=crea_lista;

  //visualizzazione della lista

  visualizza_lista(punt_lista);
  if punt_lista <> NIL then begin
    writeln;
    write('Clicca su invio per eseguire le funzioni del programma');
    readln;

  //menù di scelta
   repeat
    menu;
   until (x = 0) or (punt_lista = NIL);
   if punt_lista = NIL then
    begin
      writeln('La lista e'' vuota ');
      readln;
    end;
  end;

end.
