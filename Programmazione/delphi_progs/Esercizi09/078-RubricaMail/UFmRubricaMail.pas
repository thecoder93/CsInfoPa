unit UFmRubricaMail;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  Db, DBClient, Grids, DBGrids, Menus;

type
  TFmRubricaMail = class(TForm)
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
    Invia1: TMenuItem;
    procedure FormCreate(Sender: TObject);
    procedure Esci1Click(Sender: TObject);
    procedure Aggiungi1Click(Sender: TObject);
    procedure Elimina1Click(Sender: TObject);
    procedure EliminaTutti1Click(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
    procedure Invia1Click(Sender: TObject);
  private
    // Restituisce il nome da usare per il file di dati.
    function NomeFileRubrica: string;
    // Carica la rubrica da file, se esiste, oppure ne crea una vuota.
    procedure InizializzaRubrica;
    // Salva la rubrica sul file.
    procedure SalvaRubrica;
    // Apre la form per la preparazione del messaggio e-mail.
    procedure InviaEMail(Destinatario: string);
  public
    { Public declarations }
  end;

var
  FmRubricaMail: TFmRubricaMail;

implementation

{$R *.DFM}

uses
  UFmMail;

// Event handler della form.

procedure TFmRubricaMail.FormCreate(Sender: TObject);
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

procedure TFmRubricaMail.FormDestroy(Sender: TObject);
begin
  // Prima di terminare, salvo i dati.
  SalvaRubrica;
end;

// Metodi privati custom.

function TFmRubricaMail.NomeFileRubrica: string;
begin
  // Uso lo stesso nome dell'eseguibile, con suffisso .dat.
  Result := ChangeFileExt(Application.ExeName, '.dat');
end;

procedure TFmRubricaMail.InizializzaRubrica;
begin
  if FileExists(NomeFileRubrica) then
    // Se esiste il file di dati, carico quello...
    CdsRubrica.LoadFromFile(NomeFileRubrica)
  else
    // ...altrimenti parto da una rubrica vuota.
    CdsRubrica.CreateDataSet;
end;

procedure TFmRubricaMail.SalvaRubrica;
begin
  CdsRubrica.SaveToFile(NomeFileRubrica);
end;

// Voci di menu.

procedure TFmRubricaMail.Esci1Click(Sender: TObject);
begin
  Close;
end;

procedure TFmRubricaMail.Aggiungi1Click(Sender: TObject);
begin
  // Aggiungo solo se il dataset è attivo e non in modifica.
  if CdsRubrica.State = dsBrowse then
    CdsRubrica.Append;
end;

procedure TFmRubricaMail.Elimina1Click(Sender: TObject);
begin
  // Elimino solo se il dataset non è vuoto nè in modifica.
  if not CdsRubrica.IsEmpty and not (CdsRubrica.State in dsEditModes) then
    CdsRubrica.Delete;
end;

procedure TFmRubricaMail.EliminaTutti1Click(Sender: TObject);
begin
  // Elimino solo se il dataset non è vuoto nè in modifica.
  if not CdsRubrica.IsEmpty and not (CdsRubrica.State in dsEditModes) then
    CdsRubrica.EmptyDataSet;
end;

procedure TFmRubricaMail.Invia1Click(Sender: TObject);
begin
  InviaEMail(CdsRubricaEMail.AsString);
end;

procedure TFmRubricaMail.InviaEMail(Destinatario: string);
var
  FmMail: TFmMail;
begin
  FmMail := TFmMail.Create(nil);
  try
    FmMail.PreparaEMail(Destinatario);
  finally
    FmMail.Free;
  end;
end;

end.
