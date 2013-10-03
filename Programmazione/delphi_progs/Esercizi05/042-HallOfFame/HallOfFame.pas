unit HallOfFame;

interface

uses
  SysUtils, Classes;

type
  THallOfFame = class
  private
    // Memorizza i punteggi, ciascuna riga nel formato '<Score>;<PlayerName>'.
    FScores: TStringList;
    // Ordina la lista per punteggio discendente.
    procedure SortScores;
    // Rimuove dalla lista eventuali punteggi oltre il limite di MAX_SCORES.
    procedure RemoveExtraScores;
    // getter per la proprietà ScoreCount.
    function GetScoreCount: Integer;
  public
    // L'oggetto interno FScores deve essere creato nel costruttore e distrutto
    // nel distruttore.
    constructor Create;
    destructor Destroy; override;
    // Aggiunge un punteggio alla lista, se è sufficientemente alto da rientrare
    // nei primi MAX_SCORES.
    procedure AddScore(Score: Integer; PlayerName: string);
    // Restituisce punteggio e nome del giocatore alla posizione indicata.
    procedure GetScore(Index: Integer; var Score: Integer; var PlayerName: string);
    // Indica il numero di righe occupate in lista (da 0 a MAX_SCORES).
    property ScoreCount: Integer read GetScoreCount;
    // Salva i punteggi in un file di testo.
    procedure SaveToFile(FileName: string);
    // Carica i punteggi da un file di testo.
    procedure LoadFromFile(FileName: string);
  end;

// Funzione di accesso all'unica istanza dell'oggetto: la variabile
// _HallOfFameObj è invisibile dall'esterno, e l'oggetto viene istanziato la
// prima volta che si invoca questa funzione.
function HallOfFameObj: THallOfFame;

implementation

const
  // Numero massimo di punteggi memorizzabili.
  MAX_SCORES = 10;

var
  _HallOfFameObj: THallOfFame;

function HallOfFameObj: THallOfFame;
begin
  // Se l'oggetto non è stato creato, lo si istanzia la prima volta che
  // l'applicazione vi accede.
  if not Assigned(_HallOfFameObj) then
    _HallOfFameObj := THallOfFame.Create;
  Result := _HallOfFameObj;
end;

// Funzioni per estrarre il punteggio e il nome del giocatore da un elemento
// di FScores.
function ExtractScore(Item: string): Integer;
var
  P: Integer;
begin
  P := AnsiPos(';', Item);
  if P <> 0 then
    SetLength(Item, P - 1)
  else
    SetLength(Item, 0);
  Result := StrToIntDef(Item, 0);
end;

function ExtractPlayerName(Item: string): string;
var
  P: Integer;
begin
  P := AnsiPos(';', Item);
  Result := Copy(Item, P + 1, MaxInt);
end;

// Procedura di confronto usata per il metodo CustomSort di TStringList.
// Non può essere un metodo.
function ScoreCompareProc(List: TStringList; Index1, Index2: Integer): Integer;
var
  Score1, Score2: Integer;
begin
  Score1 := ExtractScore(List[Index1]);
  Score2 := ExtractScore(List[Index2]);
  if Score1 < Score2 then
    Result := 1
  else if Score1 > Score2 then
    Result := -1
  else
    Result := 0;
end;

{ THallOfFame }

{ public }

constructor THallOfFame.Create;
begin
  inherited;
  FScores := TStringList.Create;
end;

destructor THallOfFame.Destroy;
begin
  FScores.Free;
  inherited;
end;

procedure THallOfFame.AddScore(Score: Integer; PlayerName: string);
begin
  FScores.Add(IntToStr(Score) + ';' + PlayerName);
  // Dopo aver aggiunto il punteggio, ordino l'elenco ed elimino eventuali
  // punteggi in eccesso in coda.
  SortScores;
  RemoveExtraScores;
end;

procedure THallOfFame.LoadFromFile(FileName: string);
begin
  FScores.LoadFromFile(FileName);
  // Dopo aver caricato il file, mi accerto che i dati siano ordinati e che ci
  // siano al massimo MAX_SCORES righe.
  SortScores;
  RemoveExtraScores;
end;

procedure THallOfFame.SaveToFile(FileName: string);
begin
  FScores.SaveToFile(FileName);
end;

{ private }

procedure THallOfFame.SortScores;
begin
  // CustomSort richiama la procedura ScoreCompareProc per confrontare gli
  // elementi durante l'algoritmo di ordinamento.
  FScores.CustomSort(ScoreCompareProc);
end;

procedure THallOfFame.RemoveExtraScores;
begin
  // Elimino tutte le eventuali righe oltre la posizione MAX_SCORES.
  while FScores.Count > MAX_SCORES do
    FScores.Delete(Pred(FScores.Count));
end;

procedure THallOfFame.GetScore(Index: Integer; var Score: Integer; var PlayerName: string);
begin
  Score := 0;
  PlayerName := '';
  if Index < GetScoreCount then begin
    Score := ExtractScore(FScores[Index]);
    PlayerName := ExtractPlayerName(FScores[Index]);
  end;
end;

function THallOfFame.GetScoreCount: Integer;
begin
  Result := FScores.Count;
end;

initialization

finalization
  // Se la variabile è nil, il metodo Free ritorna senza fare nulla.
  _HallOfFameObj.Free;

end.
