unit UFmMain;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, ExtCtrls, ComCtrls;

type
  TFmMain = class(TForm)
    PbComincia: TButton;
    PbScroll: TPaintBox;
    EtTesto: TMemo;
    PbInterrompi: TButton;
    Label1: TLabel;
    TbRitardo: TTrackBar;
    procedure PbCominciaClick(Sender: TObject);
    procedure PbInterrompiClick(Sender: TObject);
    procedure TbRitardoChange(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
  private
    Terminato: Boolean;
    Ritardo: Integer;
  public
    procedure ScrollText(ACanvas: TCanvas; Text: TStrings;
      var Terminated: Boolean; var Delay: Integer);
  end;

var
  FmMain: TFmMain;

implementation

{$R *.DFM}

procedure TFmMain.PbCominciaClick(Sender: TObject);
begin
  Terminato := False;
  Ritardo := TbRitardo.Position;
  ScrollText(PbScroll.Canvas, EtTesto.Lines, Terminato, Ritardo);
end;

procedure TFmMain.PbInterrompiClick(Sender: TObject);
begin
  Terminato := True;
end;

procedure TFmMain.TbRitardoChange(Sender: TObject);
begin
  Ritardo := TbRitardo.Position;
end;

procedure TFmMain.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  PbInterrompi.Click;
end;

procedure TFmMain.ScrollText(ACanvas: TCanvas; Text: TStrings;
  var Terminated: Boolean; var Delay: Integer);
var
  g: Integer;
  StartY: Integer;
  SingleLineHeight: Integer;
  OffScreen: TBitmap;
  TxtWidth: Integer;
begin
  // Creo una bitmap per l'immagine fuori schermo
  // (double buffering).
  OffScreen := TBitmap.Create;
  try
    with Offscreen, Offscreen.Canvas do begin
      Height := ACanvas.ClipRect.Bottom - ACanvas.ClipRect.Top;
      Width := ACanvas.ClipRect.Right - ACanvas.ClipRect.Left;
      // Scelgo colori e tipo di carattere.
      Brush.Color := clBlack;
      Font.Name := 'Arial Black';
      Font.Size := 12;
      Font.Style := [fsBold];
      Font.Color := clYellow;
      SingleLineHeight := TextHeight('Wp');
      while not Terminated do begin
        // Scrivo il testo, ad ogni ciclo un pixel più in alto per
        // simulare lo scorrimento verticale.
        for StartY := Height downto -SingleLineHeight * Text.Count do begin
          FillRect(Rect(0, 0, Width, Height));
          for g := 0 to Pred(Text.Count) do begin
            // Ogni riga è centrata sul Canvas.
            TxtWidth := TextWidth(Text[g]);
            TextOut((Width - TxtWidth) div 2, StartY + g * SingleLineHeight, Text[g]);
          end;
          // Copio l'immagine fuori schermo nel Canvas, tutta in una
          // volta, per evitare sfarfallii.
          ACanvas.Draw(0, 0, Offscreen);
          // Attendo il ritardo.
          Sleep(Delay);
          Application.ProcessMessages;
          if Terminated then
            Exit;
        end;
      end;
    end;
  finally
    OffScreen.Free;
  end;
end;

end.
