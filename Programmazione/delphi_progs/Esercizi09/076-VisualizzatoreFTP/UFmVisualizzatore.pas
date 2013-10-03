unit UFmVisualizzatore;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  ExtCtrls, StdCtrls, ComCtrls, Grids, jpeg, Psock, NMFtp;

type
  TFmVisualizzatore = class(TForm)
    SbImmagine: TScrollBox;
    Immagine: TImage;
    Splitter1: TSplitter;
    Splitter2: TSplitter;
    LbFiles: TListBox;
    PnTop: TPanel;
    CbAdatta: TCheckBox;
    LbNomeFile: TLabel;
    FTP: TNMFTP;
    BtConnessione: TButton;
    LbCartelle: TListBox;
    BtDisconnessione: TButton;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    EtNomeServer: TEdit;
    EtNomeUtente: TEdit;
    EtPassword: TEdit;
    procedure LbFilesClick(Sender: TObject);
    procedure CbAdattaClick(Sender: TObject);
    procedure SbImmagineResize(Sender: TObject);
    procedure BtConnessioneClick(Sender: TObject);
    procedure FTPConnect(Sender: TObject);
    procedure LbCartelleClick(Sender: TObject);
    procedure BtDisconnessioneClick(Sender: TObject);
    procedure FTPDisconnect(Sender: TObject);
    procedure FTPFailure(var Handled: Boolean; Trans_Type: TCmdType);
    procedure FTPSuccess(Trans_Type: TCmdType);
  private
    procedure StretchImage;
    procedure LeggiElencoCartelle;
    function CreaNomeFileTemporaneo(NomeFileRemoto: string): string;
    function NomeFileSupportato(Nome: string): Boolean;
  public
  end;

var
  FmVisualizzatore: TFmVisualizzatore;

implementation

{$R *.DFM}

uses
  Masks, UFmAttesa;

procedure TFmVisualizzatore.SbImmagineResize(Sender: TObject);
begin
  if CbAdatta.Checked then
    StretchImage;
end;

procedure TFmVisualizzatore.StretchImage;
var
  iw, ih, ch, cw, rw, rh: integer;
  r: double;
begin
// dimensioni immagine reale
  rw := Immagine.Picture.Width;
  rh := Immagine.Picture.Height;
// dimensioni area immagine
  iw := SbImmagine.ClientWidth;
  ih := SbImmagine.ClientHeight;
// rapporto tra le altezze
  r := ih / rh;
// controlliamo se la larghezza è sufficiente
  if iw < r * rw then
// altrimenti usiamo il rapporto tra le larghezze
    r := iw / rw;
// dimensioni risultanti
  cw := round( r * rw );
  ch := round( r * rh );
// sistemiamo le dimensioni dell'immagine e la centriamo
  Immagine.SetBounds( (iw - cw) div 2, (ih - ch) div 2, cw, ch );
end;

procedure TFmVisualizzatore.CbAdattaClick(Sender: TObject);
begin
  if CbAdatta.Checked then
  // prepariamo l'immagine per il ridimensionamento
    with Immagine do begin
      AutoSize := False;
      Stretch := True;
      StretchImage;
    end
  else
  // prepariamo l'immagine per la dimensione reale
    with Immagine do begin
      Top := 0;
      Left := 0;
      AutoSize := True;
      Stretch := False;
    end;
end;

procedure TFmVisualizzatore.BtConnessioneClick(Sender: TObject);
begin
  FTP.Host := EtNomeServer.Text;
  FTP.UserID := EtNomeUtente.Text;
  FTP.Password := EtPassword.Text;
  FTP.Connect;
end;

procedure TFmVisualizzatore.FTPConnect(Sender: TObject);
begin
  // Alla connessione, riempio le ListBox.
  LeggiElencoCartelle;
end;

function TFmVisualizzatore.NomeFileSupportato(Nome: string): Boolean;
var
  Mask, s: string;

  function FetchStr(var s: string): string;
  var
    p: Integer;
  begin
    p := Pos(';', s);
    if p > 0 then begin
      Result := Copy(s, 1, p - 1);
      Delete(s, 1, Length(Result) + 1);
    end
    else begin
      Result := s;
      s := '';
    end;
  end;

begin
  Result := False;
  Mask := GraphicFileMask(TGraphic);
  s := FetchStr(Mask);
  while s <> '' do begin
    if MatchesMask(Nome, s) then begin
      Result := True;
      Exit;
    end;
    s := FetchStr(Mask);
  end;
end;

procedure TFmVisualizzatore.LeggiElencoCartelle;
var
  g: Integer;
begin
  Attesa('Lettura dell''elenco dei file in corso...');
  try
    LbCartelle.Clear;
    LbFiles.Clear;
    // Ottengo dal server l'elenco dei file.
    FTP.List;
    LbCartelle.Items.BeginUpdate;
    try
      LbFiles.Items.BeginUpdate;
      try
        // Per ogni file in elenco...
        for g := 0 to Pred(FTP.FTPDirectoryList.Name.Count) do begin
          // Escludo la cartella corrente,
          // che non serve nell'elenco.
          if FTP.FTPDirectoryList.Name[g] <> '.' then begin
            // Distinguo le cartelle dai file
            // in base al primo attributo.
            if FTP.FTPDirectoryList.Attribute[g][1] = 'd' then
              LbCartelle.Items.Add(FTP.FTPDirectoryList.Name[g])
            else if NomeFileSupportato(FTP.FTPDirectoryList.Name[g]) then
              LbFiles.Items.Add(FTP.FTPDirectoryList.Name[g]);
          end;
        end;
      finally
        LbFiles.Items.EndUpdate;
      end;
    finally
      LbCartelle.Items.EndUpdate;
    end;
  finally
    FineAttesa;
  end;
end;

procedure TFmVisualizzatore.LbCartelleClick(Sender: TObject);
begin
  // Cambio cartella e riempio le ListBox.
  FTP.ChangeDir(LbCartelle.Items[LbCartelle.ItemIndex]);
  LeggiElencoCartelle;
end;

procedure TFmVisualizzatore.LbFilesClick(Sender: TObject);
var
  NomeFileRemoto: string;
  NomeFileTemporaneo: string;
begin
  if LbFiles.Items.Count > 0 then begin
    // Scarico il file in locale e lo mostro.
    NomeFileRemoto := LbFiles.Items[LbFiles.ItemIndex];
    NomeFileTemporaneo := CreaNomeFileTemporaneo(NomeFileRemoto);
    Attesa(Format('Scaricamento del file %s in corso...',
      [NomeFileRemoto]));
    FTP.Download(NomeFileRemoto, NomeFileTemporaneo);
    Immagine.Picture.LoadFromFile(NomeFileTemporaneo);
    // Mostro il nome del file corrente.
    LbNomeFile.Caption := NomeFileRemoto;
    if CbAdatta.Checked then
      StretchImage;
  end
  else begin
    LbNomeFile.Caption := '';
    Immagine.Picture := nil;
  end;
end;

procedure TFmVisualizzatore.BtDisconnessioneClick(Sender: TObject);
begin
  FTP.Disconnect;
end;

procedure TFmVisualizzatore.FTPDisconnect(Sender: TObject);
begin
  // Alla disconnessione faccio sparire tutti
  // i riferimenti ai file dalla form.
  FineAttesa;
  LbCartelle.Clear;
  LbFiles.Clear;
  LbNomeFile.Caption := '';
  Immagine.Picture := nil;
end;

function TFmVisualizzatore.CreaNomeFileTemporaneo(
  NomeFileRemoto: string): string;
begin
  // Un nome di file temporaneo, nella cartella
  // dell'applicazione.
  Result := ChangeFileExt(ExtractFilePath(Application.ExeName) +
    'TMPFILE.TMP', ExtractFileExt(NomeFileRemoto));
end;

procedure TFmVisualizzatore.FTPFailure(var Handled: Boolean;
  Trans_Type: TCmdType);
begin
  FineAttesa;
end;

procedure TFmVisualizzatore.FTPSuccess(Trans_Type: TCmdType);
begin
  FineAttesa;
end;

end.

