unit UFmVisualizzatore;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  ExtCtrls, StdCtrls, FileCtrl, ComCtrls, Grids, Outline, DirOutln, jpeg;

type
  TFmVisualizzatore = class(TForm)
    SbImmagine: TScrollBox;
    Immagine: TImage;
    Splitter1: TSplitter;
    PnLeft: TPanel;
    DoFile: TDirectoryOutline;
    EtDischi: TDriveComboBox;
    Splitter2: TSplitter;
    LbFiles: TFileListBox;
    PnTop: TPanel;
    CbAdatta: TCheckBox;
    LbNomeFile: TLabel;
    procedure EtDischiChange(Sender: TObject);
    procedure DoFileChange(Sender: TObject);
    procedure LbFilesChange(Sender: TObject);
    procedure CbAdattaClick(Sender: TObject);
    procedure SbImmagineResize(Sender: TObject);
    procedure FormCreate(Sender: TObject);
  private
    procedure StretchImage;
  public
  end;

var
  FmVisualizzatore: TFmVisualizzatore;

implementation

{$R *.DFM}

procedure TFmVisualizzatore.EtDischiChange(Sender: TObject);
begin
// sincronizziamo i controlli
  DoFile.Drive := EtDischi.Text[1];
end;

procedure TFmVisualizzatore.DoFileChange(Sender: TObject);
begin
// sincronizziamo i controlli
  LbFiles.Directory := DoFile.Directory;
end;

procedure TFmVisualizzatore.FormCreate(Sender: TObject);
begin
// mostriamo solo i file grafici supportati
  LbFiles.Mask := GraphicFileMask( TGraphic );
end;

procedure TFmVisualizzatore.LbFilesChange(Sender: TObject);
begin
// mostriamo il nome del file
  LbNomeFile.Caption := ExtractFileName( LbFiles.FileName );
  if LbFiles.FileName <> '' then begin
  // carichiamo l'immagine
    Immagine.Picture.LoadFromFile( LbFiles.FileName );
  // eventualmente la adattiamo
    if CbAdatta.Checked then
      StretchImage;
  end;
end;

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

end.

