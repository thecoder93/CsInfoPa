unit LDResourceBitBtn;

interface

uses
  Classes, Buttons;

type
  // Pool di immagini disponibili. Per aggiungerne, modificare questa
  // dichiarazione e aggiungere una nuova immagine al file di risorse.
  TResGlyph = (rgCustom, rgArrowUp, rgArrowDown, rgDocSingle,
               rgDocStack, rgQuery, rgLocate, rgGlobe, rgClear,
               rgGrid, rgWrite, rgErase, rgPrint, rgGraph, rgOpenBook,
               rgCardFile, rgTrash, rgSum);

const
  // Prefisso per i nomi delle immagini nel file di risorse
  // (per esempio LDRB_ARROWUP).
  LDResButtonPrefix = 'LDRB_';

type
  TLDResourceBitBtn = class(TBitBtn)
  private
    FResGlyph: TResGlyph;
    function StoreGlyph: Boolean;
    procedure SetResGlyph(Value: TResGlyph);
    procedure LoadResGlyph;
  protected
  public
  published
    // Non sempre la proprietà Glyph va memorizzata nel file dfm.
    property Glyph stored StoreGlyph;
    property ResGlyph: TResGlyph read FResGlyph write SetResGlyph default rgCustom;
  end;

// Converte un TResGlyph nel nome della risorsa corrispondente; è una funzione
// globale in quanto utilizzata sia dal componente che dal property editor.
function GetResName(ResGlyph: TResGlyph): string;

procedure Register;

implementation

{$R *.RES}

uses
  SysUtils, TypInfo;

procedure Register;
begin
  RegisterComponents('LabDelphi', [TLDResourceBitBtn]);
end;

function GetResName(ResGlyph: TResGlyph): string;
begin
  // rgCustom non ha corrispondenza nel file di risorse.
  if ResGlyph = rgCustom then
    Result := ''
  else begin
    // Grazie a GetEnumName, trasformiamo il TResGlyph in una stringa...
    Result := UpperCase(GetEnumName(TypeInfo(TResGlyph), Ord(ResGlyph)));
    // ...e sostituiamo il prefisso 'rg' con il nostro.
    Delete(Result, 1, 2);
    Result := LDResButtonPrefix + Result;
  end;
end;

{ TLDResourceBitBtn }

function TLDResourceBitBtn.StoreGlyph: Boolean;
begin
  // Se l'immagine non è rgCustom, è disponibile nel file di risorse e quindi
  // non va salvata nel file dfm.
  Result := FResGlyph = rgCustom;
end;

procedure TLDResourceBitBtn.SetResGlyph(Value: TResGlyph);
begin
  if Value <> FResGlyph then begin
    FResGlyph := Value;
    LoadResGlyph;
  end;
end;

procedure TLDResourceBitBtn.LoadResGlyph;
begin
  if FResGlyph <> rgCustom then
    Glyph.LoadFromResourceName(HInstance, GetResName(FResGlyph))
  else
    Glyph := nil;
end;

end.
