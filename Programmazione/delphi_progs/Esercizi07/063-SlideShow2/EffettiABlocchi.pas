unit EffettiABlocchi;

interface

uses
  Windows, SlideShow, Graphics;

type
  TEffettoABlocchi = class(TEffetto)
  private
    function GetLarghezza: Integer;
    function GetAltezza: Integer;
  protected
    property Larghezza: Integer read GetLarghezza;
    property Altezza: Integer read GetAltezza;
  end;

  TEffettoABlocchiOriz = class(TEffettoABlocchi)
  protected
    procedure DisegnaTransizione(Sorgente, Destinazione: TBitmap;
      var Interruzione: Boolean); override;
  end;

  TEffettoABlocchiVert = class(TEffettoABlocchi)
  protected
    procedure DisegnaTransizione(Sorgente, Destinazione: TBitmap;
      var Interruzione: Boolean); override;
  end;

  TEffettoAScacchi = class(TEffettoABlocchi)
  protected
    procedure DisegnaTransizione(Sorgente, Destinazione: TBitmap;
      var Interruzione: Boolean); override;
  end;

  TEffettoRandom = class(TEffettoABlocchi)
  protected
    procedure DisegnaTransizione(Sorgente, Destinazione: TBitmap;
      var Interruzione: Boolean); override;
  end;

implementation

uses
  SysUtils;

{ TEffettoABlocchi }

function TEffettoABlocchi.GetAltezza: Integer;
begin
  Result := StrToIntDef(Parametri.Values['Altezza'], 10);
end;

function TEffettoABlocchi.GetLarghezza: Integer;
begin
  Result := StrToIntDef(Parametri.Values['Larghezza'], 10);
end;

{ TEffettoABlocchiOriz }

procedure TEffettoABlocchiOriz.DisegnaTransizione(Sorgente,
  Destinazione: TBitmap; var Interruzione: Boolean);
var
  x, y: Integer;
  Rect: TRect;
begin
  for y := 0 to Sorgente.Height div Altezza do begin
    for x := 0 to Sorgente.Width div Larghezza do begin
      Rect.Left := x * Larghezza;
      Rect.Top := y * Altezza;
      Rect.Right := Rect.Left + Larghezza;
      Rect.Bottom := Rect.Top + Altezza;
      Destinazione.Canvas.CopyRect(Rect, Sorgente.Canvas, Rect);
      AggiornaOutput(Destinazione);
      if Interruzione then
        Exit;
    end;
  end;
end;

{ TEffettoABlocchiVert }

procedure TEffettoABlocchiVert.DisegnaTransizione(Sorgente,
  Destinazione: TBitmap; var Interruzione: Boolean);
var
  x, y: Integer;
  Rect: TRect;
begin
  for x := 0 to Sorgente.Width div Larghezza do begin
    for y := 0 to Sorgente.Height div Altezza do begin
      Rect.Left := x * Larghezza;
      Rect.Top := y * Altezza;
      Rect.Right := Rect.Left + Larghezza;
      Rect.Bottom := Rect.Top + Altezza;
      Destinazione.Canvas.CopyRect(Rect, Sorgente.Canvas, Rect);
      AggiornaOutput(Destinazione);
      if Interruzione then
        Exit;
    end;
  end;
end;

{ TEffettoAScacchi }

procedure TEffettoAScacchi.DisegnaTransizione(Sorgente,
  Destinazione: TBitmap; var Interruzione: Boolean);
var
  x, y, i: Integer;
  Rect: TRect;
begin
  // Per la scacchiera faccio due passate.
  for i := 0 to 1 do begin
    for y := 0 to Sorgente.Height div Altezza do begin
      for x := 0 to Sorgente.Width div Larghezza do begin
        if (x + y + i) mod 2 = 0 then begin
          Rect.Left := x * Larghezza;
          Rect.Top := y * Altezza;
          Rect.Right := Rect.Left + Larghezza;
          Rect.Bottom := Rect.Top + Altezza;
          Destinazione.Canvas.CopyRect(Rect, Sorgente.Canvas, Rect);
          AggiornaOutput(Destinazione);
          if Interruzione then
            Exit;
        end;
      end;
    end;
  end;
end;

{ TEffettoRandom }

procedure TEffettoRandom.DisegnaTransizione(Sorgente,
  Destinazione: TBitmap; var Interruzione: Boolean);
var
  BlocchiMancanti: Integer;
  BlocchiOriz, BlocchiVert: Integer;
  Rect: TRect;
  BlocchiRiempiti: array of array of Boolean;
  x, y: Integer;
begin
  // Inizializzo l'array dei blocchi.
  BlocchiOriz := Sorgente.Width div Larghezza + 1;
  BlocchiVert := Sorgente.Height div Altezza + 1;
  SetLength(BlocchiRiempiti, BlocchiOriz, BlocchiVert);
  for x := 0 to Pred(BlocchiOriz) do
    for Y := 0 to Pred(BlocchiVert) do
      BlocchiRiempiti[x, y] := False;
  BlocchiMancanti := BlocchiOriz * BlocchiVert;
  // Inizializzo il generatore di numeri casuali.
  Randomize;
  while BlocchiMancanti > 0 do begin
    // Riempio un blocco a caso...
    x := Random(BlocchiOriz);
    y := Random(BlocchiVert);
    if not BlocchiRiempiti[x, y] then begin
      // ...ma solo se non l'ho già fatto.
      BlocchiRiempiti[x, y] := True;
      Dec(BlocchiMancanti);
      Rect.Left := x * Larghezza;
      Rect.Top := y * Altezza;
      Rect.Right := Rect.Left + Larghezza;
      Rect.Bottom := Rect.Top + Altezza;
      Destinazione.Canvas.CopyRect(Rect, Sorgente.Canvas, Rect);
      AggiornaOutput(Destinazione);
    end;
    if Interruzione then
      Exit;
  end;
end;

initialization
  TMotoreSlideShow.RegistraEffetto('blocchi_oriz',
    TEffettoABlocchiOriz);
  TMotoreSlideShow.RegistraEffetto('blocchi_vert',
    TEffettoABlocchiVert);
  TMotoreSlideShow.RegistraEffetto('scacchi',
    TEffettoAScacchi);
  TMotoreSlideShow.RegistraEffetto('random',
    TEffettoRandom);

finalization
  TMotoreSlideShow.DeregistraEffetto('blocchi_oriz');
  TMotoreSlideShow.DeregistraEffetto('blocchi_vert');
  TMotoreSlideShow.DeregistraEffetto('scacchi');
  TMotoreSlideShow.DeregistraEffetto('random');

end.
