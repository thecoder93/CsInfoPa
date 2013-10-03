unit UStampaSchermo;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, Printers;

procedure StampaDesktop;
function CatturaDesktop: TBitmap;
procedure StampaBmp( UnaBmp: TBitmap; PrinterDC, Larghezza, Altezza: integer );

implementation

function CatturaDesktop: TBitmap;
// catturo il Desktop e lo metto in un oggetto TBitmap
var
  SchermoDC: HDC;
  W, H: integer;
begin
// prendo l'hDC del desktop
  SchermoDC := GetWindowDC( GetDesktopWindow );
  try
  // creo una bitmap dalle dimensioni adeguate
    Result := TBitmap.Create;
    W := Screen.Width;
    H := Screen.Height;
    Result.Width := W;
    Result.Height := H;
  // copio il desktop sulla bitmap
    BitBlt(Result.Canvas.Handle, 0, 0, W, H,
      SchermoDC, 0, 0, SRCCOPY);
  finally
  // rilascio l'hDC
    ReleaseDC( 0, SchermoDC );
  end;
end;

procedure StampaBmp( UnaBmp: TBitmap; PrinterDC,
    Larghezza, Altezza: integer );
var
  Info: PBitmapInfo;
  InfoSize: DWORD;
  Image: Pointer;
  ImageSize: DWORD;
  Bits: HBITMAP;
  DIBWidth, DIBHeight: Longint;
begin
// puntatore alla parte "dati" dell'oggetto Bitmap
  Bits := UnaBmp.Handle;
// prendo la dimensione delle informazioni dell'immagine
  GetDIBSizes(Bits, InfoSize, ImageSize);
// alloco le due strutture
  Info := AllocMem(InfoSize);
  try
    Image := AllocMem(ImageSize);
    try
    // riempio le due strutture della DIB basandomi
    // sui dati dell'immagine originale
      GetDIB(Bits, 0, Info^, Image^);
      with Info^.bmiHeader do begin
        DIBWidth := biWidth;
        DIBHeight := biHeight;
      end;
    // la "stiro" alle dimensioni desiderate
      StretchDIBits(PrinterDC, 0, 0, Larghezza, Altezza, 0, 0,
        DIBWidth, DIBHeight, Image, Info^, DIB_RGB_COLORS, SRCCOPY);
    // libero le strutture allocate
    finally
      FreeMem(Image, ImageSize);
    end;
  finally
    FreeMem(Info, InfoSize);
  end;
end;

procedure StampaDesktop;
var
  bmp: TBitmap;
  rett: TRect;
begin
  bmp := CatturaDesktop;
  try
    with Printer do begin
      BeginDoc;
      try
      // calcolo il rettangolo per la stampa verticale
        rett := Rect(0, 0, PageWidth,
            MulDiv(PageWidth, bmp.Height, bmp.Width));
      // non funziona perfettamente:
      // Canvas.StretchDraw(rett, bmp);
      // stampo l'immagine bitmap ingrandita
        StampaBmp(bmp, Canvas.Handle, rett.Right, rett.Bottom);
      finally
        EndDoc;
      end;
    end;
  finally
    bmp.Free;
  end;
end;

end.
