unit EffettiDiSovrapposizione;

interface

uses
  Windows, SlideShow, Graphics;

type
  TDirezione = (dAlto, dBasso, dSinistra, dDestra);

type
  TEffettoDiSovrapposizione = class(TEffetto)
  private
    function GetAmpiezza: Integer;
    function GetDirezione: TDirezione;
  protected
    property Ampiezza: Integer read GetAmpiezza;
    property Direzione: TDirezione read GetDirezione;
    procedure DisegnaTransizione(Sorgente, Destinazione: TBitmap;
      var Interruzione: Boolean); override;
  end;

// procedura da esportare
procedure RegistraEffetti(MotoreSlideShow: TMotoreSlideShow);

implementation

uses
  SysUtils;

procedure RegistraEffetti(MotoreSlideShow: TMotoreSlideShow);
begin
  with MotoreSlideShow do
    RegistraEffetto('sovrapposizione', TEffettoDiSovrapposizione);
end;

{ TEffettoDiSovrapposizione }

function TEffettoDiSovrapposizione.GetAmpiezza: Integer;
begin
  Result := StrToIntDef(Parametri.Values['Ampiezza'], 1);
end;

function TEffettoDiSovrapposizione.GetDirezione: TDirezione;
var
  Str: string;
begin
  Str := Parametri.Values['Direzione'];
  if Str = 'destra' then
    Result := dDestra
  else if Str = 'sinistra' then
    Result := dSinistra
  else if Str = 'basso' then
    Result := dBasso
  else
    Result := dAlto;
end;

procedure TEffettoDiSovrapposizione.DisegnaTransizione(Sorgente,
  Destinazione: TBitmap; var Interruzione: Boolean);
var
  RectSorgente, RectDestinazione: TRect;
  i: Integer;

  procedure CopiaRettangolo;
  begin
    Destinazione.Canvas.CopyRect(RectDestinazione, Sorgente.Canvas,
      RectSorgente);
    AggiornaOutput(Destinazione);
    if Interruzione then
      Exit;
  end;

begin
  case Direzione of
    dAlto: begin
      // Imposto i valori iniziali dei
      // due rettangoli.
      RectSorgente.Left := 0;
      RectSorgente.Right := Sorgente.Width;
      RectSorgente.Top := Sorgente.Height;
      RectSorgente.Bottom := RectSorgente.Top + Ampiezza;
      RectDestinazione.Left := RectSorgente.Left;
      RectDestinazione.Right := RectSorgente.Right;
      RectDestinazione.Top := 0;
      RectDestinazione.Bottom := Ampiezza;
      for i := 0 to Sorgente.Height div Ampiezza do begin
        // I due rettangoli si ingrandiscono, uno verso
        // l'alto e uno verso il basso.
        Dec(RectSorgente.Top, Ampiezza);
        Inc(RectDestinazione.Bottom, Ampiezza);
        CopiaRettangolo;
      end;
    end;
    dBasso: begin
      // Imposto i valori iniziali dei
      // due rettangoli.
      RectSorgente.Left := 0;
      RectSorgente.Right := Sorgente.Width;
      RectSorgente.Top := 0;
      RectSorgente.Bottom := Ampiezza;
      RectDestinazione.Left := RectSorgente.Left;
      RectDestinazione.Right := RectSorgente.Right;
      RectDestinazione.Top := Destinazione.Height - Ampiezza;
      RectDestinazione.Bottom := RectDestinazione.Top + Ampiezza;
      for i := 0 to Sorgente.Height div Ampiezza do begin
        // I due rettangoli si ingrandiscono, uno verso
        // il basso e uno verso l'alto.
        Inc(RectSorgente.Bottom, Ampiezza);
        Dec(RectDestinazione.Top, Ampiezza);
        CopiaRettangolo;
      end;
    end;
    dSinistra: begin
      // Imposto i valori iniziali dei
      // due rettangoli.
      RectSorgente.Top := 0;
      RectSorgente.Bottom := Sorgente.Height;
      RectSorgente.Left := Sorgente.Width;
      RectSorgente.Right := RectSorgente.Left + Ampiezza;
      RectDestinazione.Top := RectSorgente.Top;
      RectDestinazione.Bottom := RectSorgente.Bottom;
      RectDestinazione.Left := 0;
      RectDestinazione.Right := Ampiezza;
      for i := 0 to Sorgente.Width div Ampiezza do begin
        // I due rettangoli si ingrandiscono, uno verso
        // sinistra e uno verso destra.
        Dec(RectSorgente.Left, Ampiezza);
        Inc(RectDestinazione.Right, Ampiezza);
        CopiaRettangolo;
      end;
    end;
    dDestra: begin
      // Imposto i valori iniziali dei
      // due rettangoli.
      RectSorgente.Top := 0;
      RectSorgente.Bottom := Sorgente.Height;
      RectSorgente.Left := 0;
      RectSorgente.Right := Ampiezza;
      RectDestinazione.Top := RectSorgente.Top;
      RectDestinazione.Bottom := RectSorgente.Bottom;
      RectDestinazione.Left := Destinazione.Width;
      RectDestinazione.Right := RectDestinazione.Left + Ampiezza;
      for i := 0 to Sorgente.Width div Ampiezza do begin
        // I due rettangoli si ingrandiscono, uno verso
        // destra e uno verso sinistra.
        Inc(RectSorgente.Right, Ampiezza);
        Dec(RectDestinazione.Left, Ampiezza);
        CopiaRettangolo;
      end;
    end;
  end;
end;

end.
