unit UfmMetalinguaggio;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  Buttons, StdCtrls;

const
  NUM_CHAR = 58; // numero di caratteri accettati
  START_STRING = '@$!'; // identificatore della stringa di partenza
  OFFSET = 32; // codice ascii del carattere '0'

type
  // intervallo dei caratteri accettati
  TNumChar = 0 .. NUM_CHAR;

  // array a quattro dimensioni dei caratteri con le occorrenze
  TLingua = array[ TNumChar, TNumChar, TNumChar, TNumChar ] of word;

  TfmMetalinguaggio = class(TForm)
    EtFile: TEdit;
    btElabora: TButton;
    btSfoglia: TSpeedButton;
    DlgApri: TOpenDialog;
    EtInput: TMemo;
    EtOutput: TMemo;
    procedure btSfogliaClick(Sender: TObject);
    procedure btElaboraClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
  private
    procedure PulisciTesto( var corrente: String );
    procedure AnalizzaTesto( var testo: String );
    procedure OutputTesto(out testo: String; lenTesto: integer);
    procedure SostituisciAccentate(var testo: String);
  public
    Analisi: TLingua;
  end;

var
  fmMetalinguaggio: TfmMetalinguaggio;

implementation

{$R *.DFM}

procedure TfmMetalinguaggio.btSfogliaClick(Sender: TObject);
var
  TestoDaElaborare: string;
begin
  if DlgApri.Execute then
  begin
    EtFile.Text := DlgApri.FileName;
    EtInput.lines.LoadFromFile( EtFile.Text );
    TestoDaElaborare := EtInput.Text;
    PulisciTesto( TestoDaElaborare );
    EtInput.Text := TestoDaElaborare;
  end;
end;

procedure TfmMetalinguaggio.SostituisciAccentate( var testo: String );
begin
  // sostituisco una a una tutte le vocali accentate
  // con la coppia vocale più apostrofo
  testo := StringReplace( testo, 'è', 'e''', [ rfReplaceAll ] );
  testo := StringReplace( testo, 'é', 'e''', [ rfReplaceAll ] );
  testo := StringReplace( testo, 'à', 'a''', [ rfReplaceAll ] );
  testo := StringReplace( testo, 'ò', 'o''', [ rfReplaceAll ] );
  testo := StringReplace( testo, 'ì', 'i''', [ rfReplaceAll ] );
  testo := StringReplace( testo, 'ù', 'u''', [ rfReplaceAll ] );
end;

procedure TfmMetalinguaggio.PulisciTesto( var corrente: String );
var
  c: byte;
  k: integer;
begin
  k := 1; // indice del carattere da elaborare
  SostituisciAccentate( corrente );
  while k <= Length( corrente ) do // finché ci sono ancora caratteri...
    begin
      // ...leggiamo il carattere
      c := Ord( corrente[ k ] );
      if c = 13 then // se é un ritorno a capo...
        corrente[ k ] := '#' // ...mettiamo un "cancelletto"
      else if ( c > 96 ) and ( c < 123 ) then // se é una minuscola...
        corrente[ k ] := Chr( c - 32 ) // ...convertiamo in maiuscolo
      else if ( c < 32 ) or ( c > 90 ) then // se non é valido...
        corrente := Copy( corrente, 1, k - 1 ) + Copy( corrente, k + 1,
            Length( corrente ) ) // ...lo eliminiamo
      else
        Inc( k ); // altrimenti passiamo alla lettera seguente
    end;
end;

procedure TfmMetalinguaggio.btElaboraClick(Sender: TObject);
var
  TestoDaElaborare: string;
begin
  // carico il testo
  TestoDaElaborare := EtInput.Text;
  // calcolo l'array delle occorrenze
  AnalizzaTesto( TestoDaElaborare );
  // genero un testo di 2000 caratteri...
  OutputTesto( TestoDaElaborare, 2000 );
  // ...e lo metto nel Memo di output
  EtOutput.Text := TestoDaElaborare;
end;

procedure TfmMetalinguaggio.AnalizzaTesto( var testo: String);
var
  i: integer;
  c1, c2, c3, c4: byte;
begin
  // riempio l'array con 0
  FillChar( Analisi, sizeof( Analisi ), 0 );
  // aggiungo in testa l'identificatore di partenza
  testo := START_STRING + testo;
  // elaboro a partire dall'inizio del testo originale
  for i := length( START_STRING ) + 1 to length( testo ) do begin
    // carica il carattere corrente e i 3 precedenti
    c1 := ord( testo[ i - 3 ] ) - OFFSET;
    c2 := ord( testo[ i - 2 ] ) - OFFSET;
    c3 := ord( testo[ i - 1 ] ) - OFFSET;
    c4 := ord( testo[ i ] ) - OFFSET;
    // aggiungo un'occorrenza a questa sequenza di caratteri
    Analisi[ c1, c2, c3, c4 ] := Analisi[ c1, c2, c3, c4 ] + 1;
  end;
end;

procedure TfmMetalinguaggio.OutputTesto( out testo: String; lenTesto: integer );
var
  i, k : integer;
  rnd, tot: cardinal;
  c1, c2, c3, c4: byte;
begin
  // funzione che genera un testo usando un array di occorrenze
  // per determinare la frequenza con cui scegliere i caratteri.
  // inizio con un stringa standard
  testo := START_STRING;
  // inizializzo il generatore di numeri casuali
  Randomize;
  for i := Length( START_STRING ) + 1 to lenTesto do
  begin
    // carico i tre caratteri precedenti
    c1 := Ord( testo[ i - 3 ] ) - OFFSET;
    c2 := Ord( testo[ i - 2 ] ) - OFFSET;
    c3 := Ord( testo[ i - 1 ] ) - OFFSET;
    // calcolo il totale di tutte le occorrenze che iniziano con essi
    tot := 0;
    for k := 0 to NUM_CHAR do
      tot := tot + Analisi[ c1, c2, c3, k ];
    // calcolo un numero a caso nell'intervallo
    rnd := Random( tot ) + 1;
    tot := 0;
    // in caso non trovi nessuna combinazione metto uno spazio
    c4 := 0;
    // sommo tutte le occorrenze fino ad arrivare al numero casuale
    for k := 0 to NUM_CHAR do begin
      tot := tot + Analisi[ c1, c2, c3, k ];
      // se lo trovo esce dal ciclo memorizzando il valore trovato
      if tot >= rnd then begin
        c4 := k;
        Break;
      end;
    end;
    // aggiungo il carattere trovato al testo in output
    testo := testo + Chr( c4 + OFFSET );
  end;
  // tolgo la stringa di partenza
  testo := copy( testo, Length( START_STRING ) + 1, lentesto );
  // rimetto i caratteri di ritorno a capo
  testo := StringReplace( testo, '#', #13#10, [ rfReplaceAll ] );
end;

procedure TfmMetalinguaggio.FormCreate(Sender: TObject);
begin
  etFile.Text := '';
  EtInput.text := '';
  EtOutput.Text := '';
  Caption := 'MetaLinguaggio';
end;

end.
