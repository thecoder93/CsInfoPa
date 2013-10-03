unit Stringhe;

interface

uses
  SysUtils;


type
  // tipo di funzione che verrà usata come "callback"
  TEsaminaParola =
    function(Parola: string; Inizio, fine: integer ): boolean;

function EnumeraParole(const Testo: string;
  const EsaminaParola: TEsaminaParola;
  const Separatori: string = ' ,.;:?!"/()*''-><+='): integer;

implementation

function EnumeraParole(const Testo: string;
  const EsaminaParola: TEsaminaParola;
  const Separatori: string = ' ,.;:?!"/()*''-><+='): integer;
var
  i: integer;
  Sep, sepPrev: boolean;
  Iniz, Fine: integer;
begin
  // inizializzo il separatore precedente e quello corrente
  SepPrev := true;
  Sep := false;
  // Numero parole e inizio parole li pongo a zero
  result := 0;
  Iniz := 0;
  for i := 1 to Length( testo ) do
  begin
    // controllo uno per uno i caratteri della stringa
    // se è un codice ASCII non inferiore a 32 o inserito nella
    // lista separatori, è segno che sono sopra ad un separatore.
    Sep := Ord( testo[ i ] ) < 32;
    Sep := Sep or ( Pos( testo[ i ], Separatori ) > 0 );
    // se ora sono su un separatore e prima non lo ero
    // vuol dire che è appena finita una parola...
    if Sep and not SepPrev then
    begin
      // aumento il numero delle parole e segno dove finisce
      Inc( result );
      Fine := i - 1;
      // richiamo la callback ed eventualmente esco
      if not EsaminaParola(copy(testo, Iniz, Fine - Iniz + 1), Iniz, Fine) then
        exit;
    end
    // se ora non sono su un separatore e prima lo ero vuol dire
    // che è appena iniziata una parola; segno dove inizia
    else if not Sep and SepPrev then
      Iniz := i;
    // il separatore precedente viene posto uguale all'attuale
    SepPrev := Sep;
  end;
  // se era ancora su una parola la considera conclusa alla fine del testo
  if not Sep then
  begin
    Inc( result );
    Fine := Length( testo );
    if not EsaminaParola( copy( testo, Iniz, Fine - Iniz + 1 ), Iniz, Fine ) then
      exit;
  end
end;

end.
