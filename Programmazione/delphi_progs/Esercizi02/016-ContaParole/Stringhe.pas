unit Stringhe;

interface

uses
  SysUtils;

type
  TEsaminaParola =
    function(Parola: string; Inizio, fine: integer): boolean;

function ContaParoleInFile(const NomeFile: string;
  const Separatori: string = ' ,.;:?!"/()*''-><+='): integer;

function ContaParole(const Testo: string;
  const Separatori: string = ' ,.;:?!"/()*''-><+='): integer;

implementation

function ContaParoleInFile(const NomeFile: string; const Separatori: string =
          ' ,.;:?!"/()*''-><+='): integer;
var
  F: TextFile;
  Linea: string;
begin
  // apro il file
  AssignFile( F, NomeFile );
  // vado all'inizio
  Reset( F );
  result := 0;
  while not Eof( F ) do
  begin
    // carico una riga alla volta finché non finisce
    ReadLn( F, Linea );
    // sommo il numero di parole per riga
    Result := Result + ContaParole( Linea, Separatori );
  end;
  // chiudo il file
  CloseFile(F);
end;

function ContaParole(const Testo: string; const Separatori: string =
          ' ,.;:?!"/()*''-><+='): integer;
var
  i: integer;
  Sep, sepPrev: boolean;
begin
  // inizializzo il separatore precedente e quello corrente
  SepPrev := True;
  Sep := False;
  result := 0;
  for i := 1 to Length( testo ) do
  begin
    // controllo uno per uno i caratteri della stringa
    // se è un codice ascii non inferiore a 32 o inserito nella
    // lista separatori, segno che sono sopra ad un separatore
    Sep := Ord( testo[ i ] ) < 32;
    Sep := Sep or ( Pos( testo[ i ], Separatori ) > 0 );
    // se sono su un separatore e prima non lo ero,
    // vuol dire che è appena finita una parola...
    if Sep and not SepPrev then
      Inc( result );
    // il separatore precedente viene posto uguale all'attuale
    SepPrev := Sep;
  end;
  // se mi trovo ancora su una parola la considero
  // conclusa alla fine del testo
  if not Sep then
    Inc( result );
end;

end.
