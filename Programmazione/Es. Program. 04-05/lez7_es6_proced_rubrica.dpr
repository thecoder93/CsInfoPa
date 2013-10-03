program lez7_es6_proced_rubrica;

{$APPTYPE CONSOLE}

uses
  SysUtils,
  Windows;

type rub= record
      nome: string[10];
      cognome: string[10];
      indirizzo: string[20];
      telefono: integer;
     end;

elenco = array of rub;

var rubrica: elenco;



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


//inserisce un elemento della rubrica

procedure inserisci (var rubrica: elenco);
var h: integer;

begin
  SetLength(rubrica,(Length(rubrica)+1));
  h:=Length(rubrica);
  write('NOME:  ');
  readln(rubrica[h-1].nome);
  write('COGNOME:  ');
  readln(rubrica[h-1].cognome);
  write('INDIRIZZO:  ');
  readln(rubrica[h-1].indirizzo);
  write('NUM. TELEFONO:  ');
  readln(rubrica[h-1].telefono);
                                                
end;



procedure visualizza(rubrica: elenco);
var i: integer;
begin
    if length(rubrica)>0 then
      for i:=0 to (length(rubrica)-1) do begin
          writeln;
          writeln;
          writeln(i+1,'^ Elemento della rubrica: ');;
          writeln;
          writeln('NOME:  ',rubrica[i].nome);
          writeln('COGNOME:  ',rubrica[i].cognome);
          writeln('INDIRIZZO:  ',rubrica[i].indirizzo);
          write('NUM. TELEFONO:  ',rubrica[i].telefono);
          readln;
        end
    else
      write('NON VI SONO ELEMENTI NELLA RUBRICA.');
        readln;
end;


procedure menu;
var x: integer;
begin
repeat
  clear;
  writeln;
  writeln('    MENU''    ');
  writeln('1.  Inserisci un nuovo elemento');
  writeln('2.  Visualizza la rubrica');
  writeln('3.  Esci');

  writeln;
  write('Scegli un'' opzione dal menu: ');
  readln(x);
  writeln;

  case x of
    1: begin
        inserisci(rubrica);
        writeln;
        writeln('Elemento inserito.');
        readln;
       end;
    2: visualizza(rubrica);
    3: exit;
  end;
until x=0;
end;


begin
 menu;
end.
