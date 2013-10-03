unit UFmVisualizzatore;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  ExtCtrls, StdCtrls, FileCtrl, ComCtrls, Grids, Outline, DirOutln, jpeg;

type
  // colorazioni supportate
  TTipoColorazione = (tcLumin, tcSatur, tcContr, tcGamma);

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
    LbNomeFile: TLabel;
    LbValore: TLabel;
    CbAdatta: TCheckBox;
    RbLum: TRadioButton;
    RbContrasto: TRadioButton;
    RbGamma: TRadioButton;
    SbProgr: TScrollBar;
    RbSaturazione: TRadioButton;
    procedure EtDischiChange(Sender: TObject);
    procedure DoFileChange(Sender: TObject);
    procedure LbFilesChange(Sender: TObject);
    procedure CbAdattaClick(Sender: TObject);
    procedure SbImmagineResize(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
    procedure SbProgrChange(Sender: TObject);
    procedure CommonRadioClick(Sender: TObject);
  private
    OrigBmp: TBitmap; // immagine originale
    procedure StretchImage;
    procedure Colora(valore: double; tipo: TTipoColorazione);
    procedure RegolaImmagine;
    procedure CopiaImmagine(var DestBmp: TBitmap; OrigGr: TGraphic);
  public
  end;

var
  FmVisualizzatore: TFmVisualizzatore;

implementation

uses
  Colori, Math;

{$R *.DFM}

procedure TFmVisualizzatore.EtDischiChange(Sender: TObject);
begin
// sincronizzo i controlli
  DoFile.Drive := EtDischi.Text[1];
end;

procedure TFmVisualizzatore.DoFileChange(Sender: TObject);
begin
// sincronizzo i controlli
  LbFiles.Directory := DoFile.Directory;
end;

procedure TFmVisualizzatore.FormCreate(Sender: TObject);
begin
// mostro solo i file grafici supportati
  LbFiles.Mask := GraphicFileMask( TGraphic );
// metto la barra al centro
  SbProgr.Position := 50;
// per default si regola la luminosità
  RbLum.Checked := true;
// inizializzo l'oggetto Bitmap che
// memorizza l'immagine originale
  OrigBmp := TBitmap.Create;
end;

procedure TFmVisualizzatore.FormDestroy(Sender: TObject);
begin
// distruggo l'oggetto Bitmap interno
  OrigBmp.Free;
end;

procedure TFmVisualizzatore.LbFilesChange(Sender: TObject);
begin
// mostro il nome del file
  LbNomeFile.Caption := ExtractFileName( LbFiles.FileName );
  if LbFiles.FileName <> '' then begin
  // carico l'immagine
    Immagine.Picture.LoadFromFile( LbFiles.FileName );
  // memorizzo l'immagine bitmap originale
    CopiaImmagine( OrigBmp, Immagine.Picture.Graphic );
  // la porto a 24 bit per pixel
    OrigBmp.PixelFormat := pf24bit;
  // copio la bitmap dell'immagine da OrigBmp
    Immagine.Picture := nil;
    Immagine.Picture.Bitmap := OrigBmp;
  // metto la barra al centro
    SbProgr.Position := 50;
  // per default si regola la luminosità
    RbLum.Checked := true;
  // eventualmente adatto l'immagine
    if CbAdatta.Checked then
      StretchImage;
  end;
end;

procedure TFmVisualizzatore.CopiaImmagine(var DestBmp: TBitmap;
  OrigGr: TGraphic);
begin
// pulisco l'immagine precedente
  DestBmp.Canvas.FillRect( DestBmp.Canvas.ClipRect );
// copio le dimensioni
  DestBmp.Width := OrigGr.Width;
  DestBmp.Height := OrigGr.Height;
// imposto 24 bit per pixel
  OrigBmp.PixelFormat := pf24bit;
// copio l'immagine originale
  DestBmp.Canvas.Draw( 0, 0, OrigGr);
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
// controllo se la larghezza è sufficiente
  if iw < r * rw then
// altrimenti uso il rapporto tra larghezze
    r := iw / rw;
// dimensioni risultanti
  cw := round( r * rw );
  ch := round( r * rh );
// sistemo le dimensioni dell'immagine e la centro
  Immagine.SetBounds( (iw - cw) div 2, (ih - ch) div 2, cw, ch );
end;

procedure TFmVisualizzatore.CbAdattaClick(Sender: TObject);
begin
  if CbAdatta.Checked then
  // preparo l'immagine per il ridimensionamento
    with Immagine do begin
      AutoSize := False;
      Stretch := True;
      StretchImage;
    end
  else
  // preparo l'immagine per la dimensione reale
    with Immagine do begin
      Top := 0;
      Left := 0;
      AutoSize := True;
      Stretch := False;
    end;
end;

procedure TFmVisualizzatore.SbProgrChange(Sender: TObject);
begin
// aggiorno la Label col valore
  LbValore.Caption := IntToStr( SbProgr.Position );
// coloro secondo la nuova posizione
  RegolaImmagine;
end;

procedure TFmVisualizzatore.CommonRadioClick(Sender: TObject);
begin
  RegolaImmagine;
end;

procedure TfmVisualizzatore.RegolaImmagine;
begin
// se la form non è ancora visibile non faccio nulla
  if not Visible then
    Exit;
// coloro secondo le impostazioni
  if RbLum.Checked then
    Colora( SbProgr.Position / 100, tcLumin)
  else if RbSaturazione.Checked then
    Colora( SbProgr.Position / 100, tcSatur)
  else if RbContrasto.Checked then
    Colora( SbProgr.Position / 100, tcContr)
  else if RbGamma.Checked then
    Colora( SbProgr.Position / 100, tcGamma);
// ridisegno l'immagine
  Immagine.Refresh;
end;

procedure TFmVisualizzatore.Colora( valore: double; tipo: TTipoColorazione);
var
  kx, ky: integer;
  slD, slO: PRGBArray;
  h, s, l: double;
begin
// per ogni riga...
  for ky := 0 to OrigBmp.Height - 1 do begin
  // prendo i puntatori alle due scanline
    slD := Immagine.Picture.Bitmap.scanline[ky];
    slO := OrigBmp.ScanLine[ky];
  // per ogni punto della riga...
    for kx := 0 to OrigBmp.Width - 1 do begin
    // carico il pixel e passo da RGB a HSL
      RGBtoHSL( slO[ kx ], h, s, l );
    // lavoro su h, s e l a seconda del tipo di effetto
    // e del valore della trasformazione
      case tipo of
        tcLumin:
        begin
          // luminosità
          if valore < 0.5 then
            l := l * valore * 2
          else
            l := 1-((1-l) * (1-valore) * 2);
          if l > 1 then
            l := 1
          else if l < 0 then
            l := 0;
        end;
        tcSatur:
        begin
          // saturazione
          if valore < 0.5 then
            s := s * valore * 2
          else
            s := 1-((1-s) * (1-valore) * 2);
          if s > 1 then
            s := 1
          else if s < 0 then
            s := 0;
        end;
        tcContr:
        begin
          // contrasto
          if l < 0.5 then
            l := (1-valore) * l
          else
            l := 1-((1-valore) * (1-l));
          if l > 1 then
            l := 1
          else if l < 0 then
            l := 0;
        end;
        tcGamma:
        begin
          // gamma
          l := power( l, valore );
          if l > 1 then
            l := 1
          else if l < 0 then
            l := 0;
        end;
      end;
    // ripasso da HSL a RGB e scrivo sulla destinazione
      HSLtoRGB( h, s, l, slD[ kx ] );
		end;
  end;
end;

end.

