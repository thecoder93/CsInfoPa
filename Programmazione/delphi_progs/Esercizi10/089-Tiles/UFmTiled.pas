unit UFmTiled;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  ExtCtrls;

type
  TFmTiled = class(TForm)
    ImTile: TImage;
  private
    procedure DisegnaTiles( MioHDC: hDC );
  protected
    procedure WmEraseBkgnd(var Msg: TMessage); message WM_ERASEBKGND;
  public
    constructor Create(Owner: TComponent); override;
  end;

// non vogliamo creare istanze di questa form
// quindi commentiamo la variabile globale.
//var
//  FmTiled: TFmTiled;

implementation

{$R *.DFM}

{ TFmTiled }

procedure TFmTiled.DisegnaTiles( MioHDC: hDC );
var
  xi, yi: integer;
  w, h: integer;
  bmp: TBitmap;
begin
  // usiamo una variabile per riferimeno alla
  // bitmap del componente Image
  bmp := ImTile.Picture.Bitmap;
  w := bmp.Width;
  h := bmp.Height;
  // disegnamo l'immagine lungo tutta l'area client
  for xi := 0 to ClientWidth div w + 1 do
    for yi := 0 to ClientHeight div h + 1 do
      // usiamo l'API per disegnare tramite il Device Context;
      // se usassimo Canvas.Draw, oltre ad impiegarci più tempo,
      // disegneremmo sopra eventuali controlli che usano il Canvas
      // della form (come TImage).
      BitBlt( MioHDC, xi * w, yi * h, w, h, bmp.Canvas.Handle,
        0, 0, SRCCOPY);
end;

procedure TFmTiled.WmEraseBkgnd(var Msg: TMessage);
begin
  // richiamiamo la procedura per disegnare la form ogni
  // volta che arriva il messaggio di cancellazione dello sfondo
  // dobbiamo usare l'hDC passato attraverso Msg.WParam
  DisegnaTiles( Msg.WParam );
  // segnaliamo che abbiamo gestito il messaggio
  Msg.Result := 1;
end;

constructor TFmTiled.Create(Owner: TComponent);
begin
  // solleviamo un'eccezione se si tenta di creare questa
  // form (ma non una sua derivata)
 if ClassType = TFmTiled then
   raise Exception.Create('Form ' + ClassName + ' non istanziabile.');
 inherited;
end;

end.
