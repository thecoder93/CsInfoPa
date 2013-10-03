unit UFmLente;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  ExtCtrls;

type
  TFmLente = class(TForm)
    ImZoom: TImage;
    Timer1: TTimer;
    procedure FormShow(Sender: TObject);
    procedure Timer1Timer(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FmLente: TFmLente;

implementation

{$R *.DFM}

procedure TFmLente.Timer1Timer(Sender: TObject);
const
  ultimo: TPoint = (x: 0; y: 0);
var
  hdc: THandle;
  p : TPoint;
  w, h: integer;
begin
  w := ImZoom.Width;
  h := ImZoom.Height;
// prendiamo la posizione corrente del cursore
  GetCursorPos( p );
// se non è cambiata dall'ultima volta usciamo
  if (p.x = ultimo.x ) and (p.y = ultimo.y ) then
    Exit;
  ultimo := p;
// ripuliamo l'area
  ImZoom.Canvas.Brush.Color := clBlack;
  ImZoom.Canvas.FillRect( Rect( 0, 0, w, h ) );
// prendiamo l'handle del desktop
  hdc := GetWindowDC( GetDesktopWindow );
  try
// copiamo ingrandita la zona intorno al cursore
    StretchBlt( ImZoom.Canvas.Handle, 0, 0, w, h, hdc, p.x - w div 8,
       p.y - h div 8, w div 4, h div 4, SRCCOPY );
  finally
// rilasciamo l'handle
    ReleaseDC( 0, hdc );
  end;
// richiediamo il ridisegno per il componente Image
  Invalidate;
end;

procedure TFmLente.FormShow(Sender: TObject);
var
  rgn, rgn2, rgn3, ox, oy: integer;
  r: TRect;
begin
// prendiamo l'origine dell'area client della form
  ox := ClientOrigin.x - Left;
  oy := ClientOrigin.y - Top;
// creiamo una regione ellittica dentro l'area client
  r := Rect( ox, oy, ox + ClientWidth, oy + ClientHeight );
  rgn := CreateEllipticRgn( r.left, r.top, r.right, r.bottom );
// creiamo una regione rettangolare con la caption bar
  r := Rect( 0, 0, Width, oy );
  rgn2 := CreateRectRgn( r.left, r.top, r.right, r.bottom );
// creiamo la regione definitiva vuota
  rgn3 := CreateRectRgn( 0,0,0,0 );
// mettiamo nella terza la combinazione delle prime due
  CombineRgn( rgn3, rgn, rgn2, RGN_OR );
// colleghiamo la regione alla form
  SetWindowRgn( Handle, rgn3, false );
end;

end.
