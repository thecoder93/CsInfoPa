unit UFmStampa;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, DB;

type
  TFmStampa = class(TForm)
    StTipoStampa: TLabel;
    Label1: TLabel;
    EtModello: TEdit;
    BtScegliModello: TButton;
    Label2: TLabel;
    EtFont: TEdit;
    BtScegliFont: TButton;
    Label3: TLabel;
    LbStampanti: TListBox;
    OdModello: TOpenDialog;
    BtStampa: TButton;
    BtAnnulla: TButton;
    FdStampa: TFontDialog;
    procedure FormCreate(Sender: TObject);
    procedure BtScegliModelloClick(Sender: TObject);
    procedure BtScegliFontClick(Sender: TObject);
    procedure BtStampaClick(Sender: TObject);
  private
    { Private declarations }
    FDataSet: TDataSet;
    FStampaTutti: Boolean;
    FPuntiPerPolliceX: Integer;
    FPuntiPerPolliceY: Integer;
    procedure FontCambiato;
    procedure StampaRecordCorrente(NomeModello: string);
  public
    { Public declarations }
    function Stampa(Sorgente: TDataSet; StampaTutti: Boolean): Boolean;
  end;

// La form non è auto-creata.
//var
//  FmStampa: TFmStampa;

implementation

{$R *.DFM}

uses
  Printers, IniFiles;

procedure AttivaModuloStampa(Sorgente: TDataSet;
  StampaTutti: Boolean);
begin
  // Creo la form e la apro modale.
  with TFmStampa.Create(nil) do begin
    try
      Stampa(Sorgente, StampaTutti);
    finally
      Free;
    end;
  end;
end;

// Rendo disponibile la routine all'esterno.
exports
  AttivaModuloStampa;

procedure TFmStampa.FormCreate(Sender: TObject);
begin
  // Predispongo i parametri iniziali.
  FdStampa.Font.Name := 'Arial';
  FontCambiato;
  LbStampanti.Items := Printer.Printers;
  LbStampanti.ItemIndex := Printer.PrinterIndex;
end;

procedure TFmStampa.FontCambiato;
begin
  EtFont.Text := Format('%s %d', [FdStampa.Font.Name, FdStampa.Font.Size]);
end;

function TFmStampa.Stampa(Sorgente: TDataSet;
  StampaTutti: Boolean): Boolean;
begin
  // La descrizione cambia a seconda che si stampino
  // tutti i record oppure no.
  FStampaTutti := StampaTutti;
  if FStampaTutti then
    StTipoStampa.Caption := 'Stampa di tutti i record'
  else
    StTipoStampa.Caption := 'Stampa del record corrente';
  FDataSet := Sorgente;
  // Mostro la form modale.
  Result := ShowModal = mrOk;
end;

procedure TFmStampa.BtScegliModelloClick(Sender: TObject);
begin
  if OdModello.Execute then
    EtModello.Text := OdModello.FileName;
end;

procedure TFmStampa.BtScegliFontClick(Sender: TObject);
begin
  if FdStampa.Execute then
    FontCambiato;
end;

procedure TFmStampa.BtStampaClick(Sender: TObject);
var
  Segno: TBookmarkStr;
begin
  if FileExists(EtModello.Text) then begin
    // Imposto sull'oggetto Printer i parametri
    // scelti dall'utente.
    Printer.PrinterIndex := LbStampanti.ItemIndex;
    Printer.Canvas.Font := FdStampa.Font;
    // Inizio il job di stampa.
    Printer.BeginDoc;
    try
      // Memorizzo la risoluzione della stampante in due
      // variabili private che verranno utilizzate da
      // StampaRecordCorrente.
      FPuntiPerPolliceX := GetDeviceCaps(Printer.Handle, LOGPIXELSX);
      FPuntiPerPolliceY := GetDeviceCaps(Printer.Handle, LOGPIXELSY);
      // Scorro tutti gli indirizzi da stampare.
      if FStampaTutti then begin
        Segno := FDataSet.Bookmark;
        try
          FDataSet.First;
          while not FDataSet.EOF do begin
            StampaRecordCorrente(EtModello.Text);
            FDataSet.Next;
            // Vado alla pagina successiva, a meno che
            // non mi trovi sull'ultima.
            if not FDataSet.EOF then
              Printer.NewPage;
          end;
        finally
          FDataSet.Bookmark := Segno;
        end;
      end
      else
        // Stampo un solo indirizzo.
        StampaRecordCorrente(EtModello.Text);
      // Chiudo il job di stampa.
      Printer.EndDoc;
    except
      // In caso di problemi, annullo il job.
      Printer.Abort;
      raise;
    end;
    // Finito di stampare, chiudo la finestra di dialogo.
    ModalResult := mrOk;
  end;
end;

procedure TFmStampa.StampaRecordCorrente(NomeModello: string);
var
  ModelloIni: TIniFile;
  Campi: TStrings;
  g: Integer;
  PosX, PosY: Integer;
begin
  ModelloIni := nil;
  Campi := nil;
  try
    ModelloIni := TIniFile.Create(NomeModello);
    Campi := TStringList.Create;
    ModelloIni.ReadSections(Campi);
    // Per ogni campo...
    for g := 0 to Pred(Campi.Count) do begin
      // Converto i millimetri in pixel, passando per i pollici.
      PosX := Trunc(ModelloIni.ReadInteger(Campi[g], 'PosX', 0) *
        FPuntiPerPolliceX / 25.4);
      PosY := Trunc(ModelloIni.ReadInteger(Campi[g], 'PosY', 0) *
        FPuntiPerPolliceY / 25.4);
      // Stampo il valore del campo.
      Printer.Canvas.TextOut(PosX, PosY,
        FDataSet.FieldByName(Campi[g]).DisplayText);
    end;
  finally
    ModelloIni.Free;
    Campi.Free;
  end;
end;

end.
