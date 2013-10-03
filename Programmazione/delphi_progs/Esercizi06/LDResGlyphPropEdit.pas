unit LDResGlyphPropEdit;

interface

uses
  Windows, Classes, Graphics, DsgnIntf;

type
  TResGlyphProperty = class(TEnumProperty)
  private
    FBitmaps: TStrings;
    FMaxBmpWidth: Integer;
  protected
    constructor Create(const ADesigner: IFormDesigner; APropCount: Integer); override;
  public
    destructor Destroy; override;
    // Override necessari per personalizzare l'elenco a discesa
    // dell'Object Inspector.
    procedure ListMeasureWidth(const Value: string; ACanvas: TCanvas;
      var AWidth: Integer); override;
    procedure ListMeasureHeight(const Value: string; ACanvas: TCanvas;
      var AHeight: Integer); override;
    procedure ListDrawValue(const Value: string; ACanvas: TCanvas;
      const ARect: TRect; ASelected: Boolean); override;
    procedure PropDrawValue(ACanvas: TCanvas; const ARect: TRect;
      ASelected: Boolean); override;
  end;

procedure Register;

implementation

uses
  LDResourceBitBtn, TypInfo;

const
  // Lasciamo un bordo tra ciascuna immagine e la sua descrizione
  BmpBorderWidth = 2;

procedure Register;
begin
  RegisterPropertyEditor(TypeInfo(TResGlyph), nil, '', TResGlyphProperty);
end;

{ TResGlyphProperty }

constructor TResGlyphProperty.Create(const ADesigner: IFormDesigner;
  APropCount: Integer);
var
  g: TResGlyph;
  Bmp: TBitmap;
begin
  inherited Create(ADesigner, APropCount);
  // Creo una lista con le immagini bitmap da mostrare.
  FBitmaps := TStringList.Create;
  for g := Low(TResGlyph) to High(TResGlyph) do begin
    if g = rgCustom then
      Bmp := nil
    else begin
      Bmp := TBitmap.Create;
      Bmp.LoadFromResourceName(HInstance, GetResName(g));
      // Memorizzo la larghezza dell'immagine più larga.
      if Bmp.Width > FMaxBmpWidth then
        FMaxBmpWidth := Bmp.Width;
    end;
    // Memorizzo ciascuna immagine insieme ad una stringa che ne
    // rappresenta il valore enumerato (TResGlyph); in seguito userò la stringa
    // per identificare l'immagine.
    FBitmaps.AddObject(GetEnumName(TypeInfo(TResGlyph), Ord(g)), Bmp);
  end;
end;

destructor TResGlyphProperty.Destroy;
var
  g: Integer;
begin
  // Libero la memoria allocata per le immagini e per la lista.
  for g := 0 to Pred(FBitmaps.Count) do
    FBitmaps.Objects[g].Free;
  FBitmaps.Free;
  inherited;
end;

procedure TResGlyphProperty.ListMeasureWidth(const Value: string;
  ACanvas: TCanvas; var AWidth: Integer);
begin
  // La larghezza è quella standard, più lo spazio per la più larga delle
  // immagini bitmap, più un bordo.
  AWidth := AWidth + FMaxBmpWidth + BmpBorderWidth;
end;

procedure TResGlyphProperty.ListMeasureHeight(const Value: string;
  ACanvas: TCanvas; var AHeight: Integer);
var
  Idx: Integer;
  Bmp: TBitmap;
begin
  // L'altezza di ciascun elemento deve essere la maggiore tra quella del
  // testo e quella dell'immagine bitmap.
  Idx := FBitmaps.IndexOf(Value);
  if Idx < 0 then
    Bmp := nil
  else
    Bmp := TBitmap(FBitmaps.Objects[Idx]);
  if Assigned(Bmp) then
    if AHeight < Bmp.Height then
      AHeight := Bmp.Height;
end;

procedure TResGlyphProperty.ListDrawValue(const Value: string;
  ACanvas: TCanvas; const ARect: TRect; ASelected: Boolean);
var
  OldBrushColor: TColor;
  Idx: Integer;
  Bmp: TBitmap;
begin
  with ACanvas do begin
    // Metto da parte il valore originale del colore del brush.
    OldBrushColor := Brush.Color;
    try
      // Ripulisco il rettangolo di lavoro.
      Brush.Color := clWindow;
      FillRect(Rect(ARect.Left, ARect.Top, ARect.Left + FMaxBmpWidth + BmpBorderWidth, ARect.Bottom));
      // Disegno l'immagine bitmap, se disponibile.
      Idx := FBitmaps.IndexOf(Value);
      if Idx < 0 then
        Bmp := nil
      else
        Bmp := TBitmap(FBitmaps.Objects[Idx]);
      if Assigned(Bmp) then
        StretchDraw(Rect(ARect.Left, ARect.Top, ARect.Left + FMaxBmpWidth, ARect.Bottom), Bmp);
    finally
      // Rimetto a posto il colore.
      Brush.Color := OldBrushColor;
      // Richiamo l'implementazione ereditata, che si occupa di disegnare la
      // stringa accanto all'immagine; per farlo, passo un rettangolo
      // leggermente modificato.
      inherited ListDrawValue(Value, ACanvas,
        Rect(ARect.Left + FMaxBmpWidth + BmpBorderWidth, ARect.Top, ARect.Right, ARect.Bottom),
        ASelected);
    end;
  end;
end;

procedure TResGlyphProperty.PropDrawValue(ACanvas: TCanvas; const ARect: TRect;
  ASelected: Boolean);
begin
  // Codice riportato da uno dei property editor standard.
  if GetVisualValue <> '' then
    ListDrawValue(GetVisualValue, ACanvas, ARect, ASelected)
  else
    inherited PropDrawValue(ACanvas, ARect, ASelected);
end;

end.
