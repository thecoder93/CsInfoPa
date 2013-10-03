unit UFmRubricaTel;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  Db, DBClient, Grids, DBGrids, Menus;

type
  TFmRubricaTel = class(TForm)
    MainMenu1: TMainMenu;
    File1: TMenuItem;
    Esci1: TMenuItem;
    Indirizzo1: TMenuItem;
    Aggiungi1: TMenuItem;
    Elimina1: TMenuItem;
    EliminaTutti1: TMenuItem;
    GdRubrica: TDBGrid;
    CdsRubrica: TClientDataSet;
    CdsRubricaNome: TStringField;
    CdsRubricaIndirizzo: TStringField;
    CdsRubricaEMail: TStringField;
    CdsRubricaTelefono: TStringField;
    CdsRubricaCellulare: TStringField;
    DsRubrica: TDataSource;
    N1: TMenuItem;
    Chiamaaltelefono1: TMenuItem;
    Chiamaalcellulare1: TMenuItem;
    procedure FormCreate(Sender: TObject);
    procedure Esci1Click(Sender: TObject);
    procedure Aggiungi1Click(Sender: TObject);
    procedure Elimina1Click(Sender: TObject);
    procedure EliminaTutti1Click(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
    procedure Chiamaaltelefono1Click(Sender: TObject);
    procedure Chiamaalcellulare1Click(Sender: TObject);
  private
    // Restituisce il nome da usare per il file di dati.
    function NomeFileRubrica: string;
    // Carica la rubrica da file, se esiste, oppure ne crea una vuota.
    procedure InizializzaRubrica;
    // Salva la rubrica sul file.
    procedure SalvaRubrica;
    // Compone il numero passato (usando solo le cifre numeriche)
    // attraverso la scheda audio.
    procedure ComponiNumero(Numero: string);
    // Usata dalla precedente, emette una cifra del numero.
    procedure ComponiCifra(Cifra: Char);
  public
    { Public declarations }
  end;

var
  FmRubricaTel: TFmRubricaTel;

implementation

{$R *.DFM}

{$R Toni.RES}

uses
  MMSystem;

// Event handler della form.

procedure TFmRubricaTel.FormCreate(Sender: TObject);
begin
  // Faccio in modo che la form non possa essere
  // ridimensionata in senso orizzontale.
  Constraints.MaxWidth := Width;
  Constraints.MinWidth := Constraints.MaxWidth;
  // Mostro il nome del file usato nella Caption della form
  Caption := Format('%s [%s]', [Caption, NomeFileRubrica]);
  // Inizializzo la rubrica.
  InizializzaRubrica;
end;

procedure TFmRubricaTel.FormDestroy(Sender: TObject);
begin
  // Prima di terminare, salvo i dati.
  SalvaRubrica;
end;

// Metodi privati custom.

function TFmRubricaTel.NomeFileRubrica: string;
begin
  // Uso lo stesso nome dell'eseguibile, con suffisso .dat.
  Result := ChangeFileExt(Application.ExeName, '.dat');
end;

procedure TFmRubricaTel.InizializzaRubrica;
begin
  if FileExists(NomeFileRubrica) then
    // Se esiste il file di dati, carico quello...
    CdsRubrica.LoadFromFile(NomeFileRubrica)
  else
    // ...altrimenti parto da una rubrica vuota.
    CdsRubrica.CreateDataSet;
end;

procedure TFmRubricaTel.SalvaRubrica;
begin
  CdsRubrica.SaveToFile(NomeFileRubrica);
end;

// Voci di menu.

procedure TFmRubricaTel.Esci1Click(Sender: TObject);
begin
  Close;
end;

procedure TFmRubricaTel.Aggiungi1Click(Sender: TObject);
begin
  // Aggiungo solo se il dataset è attivo e non in modifica.
  if CdsRubrica.State = dsBrowse then
    CdsRubrica.Append;
end;

procedure TFmRubricaTel.Elimina1Click(Sender: TObject);
begin
  // Elimino solo se il dataset non è vuoto nè in modifica.
  if not CdsRubrica.IsEmpty and not (CdsRubrica.State in dsEditModes) then
    CdsRubrica.Delete;
end;

procedure TFmRubricaTel.EliminaTutti1Click(Sender: TObject);
begin
  // Elimino solo se il dataset non è vuoto nè in modifica.
  if not CdsRubrica.IsEmpty and not (CdsRubrica.State in dsEditModes) then
    CdsRubrica.EmptyDataSet;
end;

procedure TFmRubricaTel.Chiamaaltelefono1Click(Sender: TObject);
begin
  ComponiNumero(CdsRubricaTelefono.AsString);
end;

procedure TFmRubricaTel.Chiamaalcellulare1Click(Sender: TObject);
begin
  ComponiNumero(CdsRubricaCellulare.AsString);
end;

procedure TFmRubricaTel.ComponiNumero(Numero: string);
var
  g: Integer;
const
  CifreNumeriche = ['0', '1', '2', '3', '4', '5', '6', '7', '8', '9'];
begin
  if Numero <> '' then
    for g := 1 to Length(Numero) do
      if Numero[g] in CifreNumeriche then
        ComponiCifra(Numero[g]);
end;

procedure TFmRubricaTel.ComponiCifra(Cifra: Char);
{var
  hResInfo, hRes: THandle;
  lpGlob: Pointer;
  NomeRisorsa: string;}
begin
  PlaySound(PChar('TONO' + Cifra), HInstance, SND_RESOURCE +
    SND_SYNC + SND_NODEFAULT);
  {
  NomeRisorsa := 'TONO' + Cifra;
  hResInfo := FindResource(HInstance, PChar(NomeRisorsa),
    PChar('WAVE'));
  if hResInfo = 0 then
    raise Exception.CreateFmt('Risorsa %s non trovata.', [NomeRisorsa]);
  hRes := LoadResource(HInstance, hResInfo);
  if hRes = 0 then
    raise Exception.CreateFmt('Impossibile caricare la risorsa %s.',
      [NomeRisorsa]);
  lpGlob := LockResource(hRes);
  if not Assigned(lpGlob) then
    raise Exception.CreateFmt('Impossibile bloccare la risorsa %s.',
      [NomeRisorsa]);
  PlaySound(lpGlob, HInstance, SND_SYNC + SND_MEMORY + SND_NODEFAULT);
  }
end;

end.
