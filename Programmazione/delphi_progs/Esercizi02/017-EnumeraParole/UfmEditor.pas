unit UfmEditor;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  Menus, StdCtrls, ExtCtrls;

type
  TfmEditor = class(TForm)
    MainMenu1: TMainMenu;
    File1: TMenuItem;
    Nuovo1: TMenuItem;
    Apri1: TMenuItem;
    Salva1: TMenuItem;
    Esci1: TMenuItem;
    Formato1: TMenuItem;
    Carattere1: TMenuItem;
    etTesto: TMemo;
    odApri: TOpenDialog;
    sdSalva: TSaveDialog;
    fdCarattere: TFontDialog;
    Enumeraparole1: TMenuItem;
    lsParole: TListBox;
    Splitter1: TSplitter;
    procedure Nuovo1Click(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure Apri1Click(Sender: TObject);
    procedure Salva1Click(Sender: TObject);
    procedure Esci1Click(Sender: TObject);
    procedure etTestoChange(Sender: TObject);
    procedure FormCloseQuery(Sender: TObject; var CanClose: Boolean);
    procedure Carattere1Click(Sender: TObject);
    procedure Enumeraparole1Click(Sender: TObject);
  private
    NomeFile: string;
    Salvato: boolean;
    procedure FileApri;
    procedure FileNuovo;
    procedure FileSalva;
    function Conferma: boolean;
    procedure FormatoCarattere;
    procedure RigiraLista;
  public
    procedure SetNomeFile(const value: string );
    procedure SetSalvato(const value: boolean );
  end;

var
  fmEditor: TfmEditor;

function ListaParole(Parola: string; Inizio, fine: integer ): boolean;

implementation

{$R *.DFM}
uses
  Stringhe;

procedure TfmEditor.Nuovo1Click(Sender: TObject);
begin
  FileNuovo;
end;

procedure TfmEditor.FileNuovo;
begin
  if not Conferma then // prima controllo se c'e' da confermare
    exit; // eventualmente esco e non faccio nulla
  etTesto.Clear; // pulisco il testo
  SetNomeFile( 'Nuovo' ); // setto il nome
  SetSalvato( true ); // ed il flag
end;

procedure TfmEditor.FileSalva;
begin
  sdSalva.FileName := NomeFile; // propongo il nome file attuale
  if sdSalva.Execute then
  begin // se l'utente ha scelto un nome
    etTesto.Lines.SaveToFile( sdSalva.FileName ); // salvo il testo
    SetNomeFile( sdSalva.FileName ); // setto il nome
    SetSalvato( true ); // ed il flag
  end;
end;

procedure TfmEditor.FileApri;
begin
  if not Conferma then // prima controllo se c'e' da confermare
    exit; // eventualmente esco e non faccio nulla
  if odApri.Execute then
  begin // se l'utente ha scelto un file
    etTesto.Lines.LoadFromFile( odApri.FileName ); // lo carico nel memo
    SetNomeFile( odApri.FileName ); // setto il nome
    SetSalvato( true ); // e lo considero salvato
  end;
end;

procedure TfmEditor.FormCreate(Sender: TObject);
begin
  SetSalvato( true ); // metto salvato per evitare la conferma all'apertura
  FileNuovo;
end;

procedure TfmEditor.Apri1Click(Sender: TObject);
begin
  FileApri;
end;

procedure TfmEditor.Salva1Click(Sender: TObject);
begin
  FileSalva;
end;

procedure TfmEditor.Esci1Click(Sender: TObject);
begin
  Close;
end;

procedure TfmEditor.etTestoChange(Sender: TObject);
begin
  // ripulisco il flag dopo ogni cambiamento del testo
  SetSalvato( false ); 
end;

function TfmEditor.Conferma: boolean;
var
  risposta: word;
begin
  result := True; // normalmente si può procedere
  if not salvato then
  begin
    risposta := MessageDlg( 'Salvo il testo ?', mtConfirmation, mbYesNoCancel, 0 );
    case risposta of
      mrCancel: result := false; // annulla tutto
      mrYes: FileSalva; // prima salva
      end;
  end;
end;

procedure TfmEditor.FormCloseQuery(Sender: TObject; var CanClose: Boolean);
begin
  CanClose := Conferma; // chiudo solo dopo conferma
end;

procedure TfmEditor.SetNomeFile(const value: string);
begin // uso una funzione per impostare la variabile interna
  NomeFile := value;
  Caption := value + ' - Semplice editor'; // ...la Caption della form
  Application.Title := Caption; // ... e il titolo dell'applicazione
end;

procedure TfmEditor.SetSalvato(const value: boolean);
begin  // uso una funzione per impostare la variabile interna
  Salvato := value;
  Salva1.Enabled := not Salvato; // e lo stato del MenuItem
end;

procedure TfmEditor.Carattere1Click(Sender: TObject);
begin
  FormatoCarattere;
end;

procedure TfmEditor.FormatoCarattere;
begin
  fdCarattere.Font := etTesto.Font;
  if fdCarattere.Execute then
    etTesto.Font := fdCarattere.Font;
end;
  

procedure TfmEditor.Enumeraparole1Click(Sender: TObject);
var
  num : integer;
begin
  // pulisco la lista e la imposto non ordinata
  lsParole.Clear;
  lsParole.Sorted := false;
  // ottengo il numero delle parole e passo la callback
  num := EnumeraParole( etTesto.Text, ListaParole );
  // metto il numero di occorrenze all'inizio di ogni parola
  RigiraLista;
  // ordino la lista
  lsParole.Sorted := true;
  // aggiungo il totale alla fine
  lsParole.Items.Add( 'Totale parole=' + IntToStr( num ) );
  // rendo visibile l'ultimo elemento
  lsParole.ItemIndex := lsParole.Items.Count - 1;
end;

function ListaParole(Parola: string; Inizio, fine: integer ): boolean;
var
  i, num: integer;
begin
  // funzione di callback
  result := true;
  // rendo la parola in minuscolo
  Parola := LowerCase( Parola );
  i := fmEditor.lsParole.Items.IndexOfName( Parola );
  if i < 0 then
    // se non è già presente la aggiungo
    fmEditor.lsParole.Items.Add( Parola + '=1' )
  else
  begin
    // se è già presente incremento il contatore
    num := StrToIntDef( fmEditor.lsParole.Items.Values[ Parola ], 0 );
    fmEditor.lsParole.Items[ i ] := Parola + '=' + IntToStr( num + 1 );
  end;
end;

procedure TfmEditor.RigiraLista;
var
  i, p: integer;
  s, n, z: string;
begin
  // metto le occorrenze in testa per l'ordinamento
  for i := 0 to lsParole.Items.Count - 1 do
  begin
    s := lsParole.Items[ i ];
    // trovo il carattere '=' e prendo la
    // parte seguente (numero di occorrenze)
    p := Pos( '=', s );
    n := copy( s, p + 1, length( s ) );
    // allineo a destra il numero con zeri
    z := StringOfChar( '0', 5 - Length( n ) );
    s := z + n + '  ' + copy( s, 1, p - 1 );
    // sostituisco la stringa vecchia con la nuova
    lsParole.Items[ i ] := s;
  end;
end;

end.
