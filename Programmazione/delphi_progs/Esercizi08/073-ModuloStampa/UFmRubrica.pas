unit UFmRubrica;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  Db, DBClient, Grids, DBGrids, Menus;

type
  TFmRubrica = class(TForm)
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
    Stampa1: TMenuItem;
    StampaTutti1: TMenuItem;
    CdsRubricaCAP: TStringField;
    CdsRubricaLocalita: TStringField;
    CdsRubricaProvincia: TStringField;
    procedure FormCreate(Sender: TObject);
    procedure Esci1Click(Sender: TObject);
    procedure Aggiungi1Click(Sender: TObject);
    procedure Elimina1Click(Sender: TObject);
    procedure EliminaTutti1Click(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
    procedure Stampa1Click(Sender: TObject);
    procedure StampaTutti1Click(Sender: TObject);
  private
    // Restituisce il nome da usare per il file di dati.
    function NomeFileRubrica: string;
    // Carica la rubrica da file, se esiste, oppure ne crea una vuota.
    procedure InizializzaRubrica;
    // Salva la rubrica sul file.
    procedure SalvaRubrica;
    // Apre la finestra di dialogo per la stampa di un
    // indirizzo o tutti.
    procedure StampaIndirizzi(Tutti: Boolean);
    // Determina la disponibilità del modulo Stampa.
    function StampaDisponibile: Boolean;
    // Restituisce il nome del file contenente
    // il modulo Stampa.
    function NomeModuloStampa: string;
  public
  end;

var
  FmRubrica: TFmRubrica;

implementation

{$R *.DFM}

uses
  Printers;

// Event handler della form.

procedure TFmRubrica.FormCreate(Sender: TObject);
begin
  // Mostro il nome del file usato nella Caption della form
  Caption := Format('%s [%s]', [Caption, NomeFileRubrica]);
  // Inizializzo la rubrica.
  InizializzaRubrica;
  // Adatto il menu alla presenza del modulo
  // facoltativo.
  if not StampaDisponibile then begin
    Stampa1.Enabled := False;
    StampaTutti1.Enabled := False;
  end;
end;

procedure TFmRubrica.FormDestroy(Sender: TObject);
begin
  // Prima di terminare, salvo i dati.
  SalvaRubrica;
end;

// Metodi privati custom.

function TFmRubrica.NomeFileRubrica: string;
begin
  // Uso lo stesso nome dell'eseguibile, con suffisso .dat.
  Result := ChangeFileExt(Application.ExeName, '.dat');
end;

procedure TFmRubrica.InizializzaRubrica;
begin
  if FileExists(NomeFileRubrica) then
    // Se esiste il file di dati, carico quello...
    CdsRubrica.LoadFromFile(NomeFileRubrica)
  else
    // ...altrimenti parto da una rubrica vuota.
    CdsRubrica.CreateDataSet;
end;

procedure TFmRubrica.SalvaRubrica;
begin
  CdsRubrica.SaveToFile(NomeFileRubrica);
end;

// Voci di menu.

procedure TFmRubrica.Esci1Click(Sender: TObject);
begin
  Close;
end;

procedure TFmRubrica.Aggiungi1Click(Sender: TObject);
begin
  // Aggiungo solo se il dataset è attivo e non in modifica.
  if CdsRubrica.State = dsBrowse then
    CdsRubrica.Append;
end;

procedure TFmRubrica.Elimina1Click(Sender: TObject);
begin
  // Elimino solo se il dataset non è vuoto nè in modifica.
  if not CdsRubrica.IsEmpty and not (CdsRubrica.State in dsEditModes) then
    CdsRubrica.Delete;
end;

procedure TFmRubrica.EliminaTutti1Click(Sender: TObject);
begin
  // Elimino solo se il dataset non è vuoto nè in modifica.
  if not CdsRubrica.IsEmpty and not (CdsRubrica.State in dsEditModes) then
    CdsRubrica.EmptyDataSet;
end;

procedure TFmRubrica.Stampa1Click(Sender: TObject);
begin
  StampaIndirizzi(False);
end;

procedure TFmRubrica.StampaTutti1Click(Sender: TObject);
begin
  StampaIndirizzi(True);
end;

type
  TProcStampa = procedure (Sorgente: TDataSet; StampaTutti: Boolean);

procedure TFmRubrica.StampaIndirizzi(Tutti: Boolean);
var
  ModuloStampa: HMODULE;
  ProcStampa: TProcStampa;
begin
  ModuloStampa := LoadPackage(NomeModuloStampa);
  if ModuloStampa <> 0 then begin
    try
      ProcStampa := GetProcAddress(ModuloStampa, 'AttivaModuloStampa');
      if Assigned(ProcStampa) then
        ProcStampa(CdsRubrica, Tutti);
    finally
      UnloadPackage(ModuloStampa);
    end;
  end;
end;

function TFmRubrica.StampaDisponibile: Boolean;
begin
  // Verifico l'esistenza del modulo Stampa.
  Result := FileExists(NomeModuloStampa);
end;

function TFmRubrica.NomeModuloStampa: string;
begin
  // Il modulo Stampa è un file 'PkgStampa.bpl' nella
  // stessa cartella.
  Result := ExtractFilePath(Application.ExeName) + 'PkgStampa.bpl';
end;

end.
