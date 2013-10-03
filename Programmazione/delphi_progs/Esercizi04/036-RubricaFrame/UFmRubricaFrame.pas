unit UFmRubricaFrame;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  Db, DBClient, Grids, DBGrids, Menus, UFrDataEntry, ExtCtrls, DBCtrls;

type
  TFmRubricaFrame = class(TForm)
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
    NvRubrica: TDBNavigator;
    FrModifica: TFrDataEntry;
    procedure FormCreate(Sender: TObject);
    procedure Esci1Click(Sender: TObject);
    procedure Aggiungi1Click(Sender: TObject);
    procedure Elimina1Click(Sender: TObject);
    procedure EliminaTutti1Click(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
    procedure NvRubricaClick(Sender: TObject; Button: TNavigateBtn);
  private
    // Restituisce il nome da usare per il file di dati.
    function NomeFileRubrica: string;
    // Carica la rubrica da file, se esiste, oppure ne crea una vuota.
    procedure InizializzaRubrica;
    // Salva la rubrica sul file.
    procedure SalvaRubrica;
    // Apre la form per l'aggiunta di un nuovo record.
    procedure ApriFormInserimento;
  public
    { Public declarations }
  end;

var
  FmRubricaFrame: TFmRubricaFrame;

implementation

uses UFmInserimento;

{$R *.DFM}

// Event handler della form.

procedure TFmRubricaFrame.FormCreate(Sender: TObject);
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

procedure TFmRubricaFrame.FormDestroy(Sender: TObject);
begin
  // Prima di terminare, salvo i dati.
  SalvaRubrica;
end;

// Metodi privati custom.

function TFmRubricaFrame.NomeFileRubrica: string;
begin
  // Uso lo stesso nome dell'eseguibile, con suffisso .dat.
  Result := ChangeFileExt(Application.ExeName, '.dat');
end;

procedure TFmRubricaFrame.InizializzaRubrica;
begin
  if FileExists(NomeFileRubrica) then
    // Se esiste il file di dati, carico quello...
    CdsRubrica.LoadFromFile(NomeFileRubrica)
  else
    // ...altrimenti parto da una rubrica vuota.
    CdsRubrica.CreateDataSet;
end;

procedure TFmRubricaFrame.SalvaRubrica;
begin
  CdsRubrica.SaveToFile(NomeFileRubrica);
end;

// Voci di menu.

procedure TFmRubricaFrame.Esci1Click(Sender: TObject);
begin
  Close;
end;

procedure TFmRubricaFrame.Aggiungi1Click(Sender: TObject);
begin
  // Aggiungo solo se il dataset è attivo e non in modifica.
  if CdsRubrica.State = dsBrowse then
    ApriFormInserimento;
end;

procedure TFmRubricaFrame.Elimina1Click(Sender: TObject);
begin
  // Elimino solo se il dataset non è vuoto nè in modifica.
  if not CdsRubrica.IsEmpty and not (CdsRubrica.State in dsEditModes) then
    CdsRubrica.Delete;
end;

procedure TFmRubricaFrame.EliminaTutti1Click(Sender: TObject);
begin
  // Elimino solo se il dataset non è vuoto nè in modifica.
  if not CdsRubrica.IsEmpty and not (CdsRubrica.State in dsEditModes) then
    CdsRubrica.EmptyDataSet;
end;

procedure TFmRubricaFrame.NvRubricaClick(Sender: TObject;
  Button: TNavigateBtn);
begin
  if Button = nbInsert then
    ApriFormInserimento;
end;

procedure TFmRubricaFrame.ApriFormInserimento;
begin
  with TFmInserimento.Create(Self) do begin
    try
      // Inizio l'inserimento.
      CdsRubrica.Insert;
      // Mostro la form e confermo o annullo l'inserimento.
      if ShowModal = mrOK then
        CdsRubrica.Post
      else
        CdsRubrica.Cancel;
    finally
      Free;
    end;
  end;
end;

end.
