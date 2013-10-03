unit Effetti;

interface

uses
  Windows, SlideShow, Graphics;

type
  TEffettoTaglioNetto = class(TEffetto)
  protected
    procedure DisegnaTransizione(Sorgente, Destinazione: TBitmap;
      var Interruzione: Boolean); override;
  end;

  TEffettoScorrimento = class(TEffetto)
  private
    function GetVelocita: Integer;
  protected
    property Velocita: Integer read GetVelocita;
  end;

  TEffettoScorrimentoOriz = class(TEffettoScorrimento)
  protected
    procedure CalcolaRettangolo(Larghezza, Indice: Integer;
      var Rect: TRect); virtual; abstract;
    procedure DisegnaTransizione(Sorgente, Destinazione: TBitmap;
      var Interruzione: Boolean); override;
  end;

  TEffettoScorrimentoSx = class(TEffettoScorrimentoOriz)
  protected
    procedure CalcolaRettangolo(Larghezza, Indice: Integer;
      var Rect: TRect); override;
  end;

  TEffettoScorrimentoDx = class(TEffettoScorrimentoOriz)
  protected
    procedure CalcolaRettangolo(Larghezza, Indice: Integer;
      var Rect: TRect); override;
  end;

// Procedura da esportare
procedure RegistraEffetti(MotoreSlideShow: TMotoreSlideShow);

implementation

uses
  SysUtils;

procedure RegistraEffetti(MotoreSlideShow: TMotoreSlideShow);
begin
  with MotoreSlideShow do begin
    RegistraEffetto('taglio_netto', TEffettoTaglioNetto);
    RegistraEffetto('scorrimento_sx', TEffettoScorrimentoSx);
    RegistraEffetto('scorrimento_dx', TEffettoScorrimentoDx);
  end;
end;

{ TEffettoTaglioNetto }

procedure TEffettoTaglioNetto.DisegnaTransizione(Sorgente,
  Destinazione: TBitmap; var Interruzione: Boolean);
begin
  Destinazione.Assign(Sorgente);
  AggiornaOutput(Destinazione);
end;

{ TEffettoScorrimento }

function TEffettoScorrimento.GetVelocita: Integer;
begin
  Result := StrToIntDef(Parametri.Values['Velocità'], 1);
end;

{ TEffettoScorrimentoOriz }

procedure TEffettoScorrimentoOriz.DisegnaTransizione(Sorgente,
  Destinazione: TBitmap; var Interruzione: Boolean);
var
  Rect: TRect;
  g: Integer;
begin
  Rect.Top := 0;
  Rect.Bottom := Sorgente.Height;
  Destinazione.Canvas.CopyMode := cmSrcCopy;
  for g := 0 to Destinazione.Width div Velocita do begin
    CalcolaRettangolo(Destinazione.Width, g, Rect);
    Destinazione.Canvas.CopyRect(Rect, Sorgente.Canvas, Rect);
    AggiornaOutput(Destinazione);
    if Interruzione then
      Exit;
  end;
end;

{ TEffettoScorrimentoSx }

procedure TEffettoScorrimentoSx.CalcolaRettangolo(Larghezza, Indice: Integer;
  var Rect: TRect);
begin
  Rect.Left := Indice * Velocita;
  Rect.Right := Rect.Left + Velocita;
end;

{ TEffettoScorrimentoDx }

procedure TEffettoScorrimentoDx.CalcolaRettangolo(Larghezza, Indice: Integer;
  var Rect: TRect);
begin
  Rect.Right := Larghezza - (Indice * Velocita);
  Rect.Left := Rect.Right - Velocita;
end;

end.


