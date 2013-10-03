unit UFmShapes;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  Buttons, ExtCtrls;

type
  TFmShapes = class(TForm)
    PnTools: TPanel;
    PnWorkArea: TPanel;
    SbQuadrato: TSpeedButton;
    SbRettangolo: TSpeedButton;
    SbCerchio: TSpeedButton;
    SbEllisse: TSpeedButton;
    SbRoundRect: TSpeedButton;
    procedure FormCreate(Sender: TObject);
    procedure SbQuadratoClick(Sender: TObject);
    procedure SbRettangoloClick(Sender: TObject);
    procedure SbCerchioClick(Sender: TObject);
    procedure SbEllisseClick(Sender: TObject);
    procedure SbRoundRectClick(Sender: TObject);
    procedure PnWorkAreaMouseUp(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
    procedure PnWorkAreaMouseDown(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
    procedure PnWorkAreaMouseMove(Sender: TObject; Shift: TShiftState; X,
      Y: Integer);
  private
    FShapeType: TShapeType;
    FDragRect: TRect;
    FDragRectVisible: Boolean;
    procedure SetShapeType(const Value: TShapeType);
    procedure ResetDragRect;
  private
    // Tipo di Shape da creare.
    property ShapeType: TShapeType read FShapeType write SetShapeType;
    // Handler per l'evento OnClick degli oggetti Shape.
    procedure RandomizeShape(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
  public
  end;

var
  FmShapes: TFmShapes;

implementation

{$R *.DFM}

const
  FIGURE_DEFAULT_WIDTH = 60;
  FIGURE_DEFAULT_HEIGHT = 30;

// Funzione di utilità generale: mette in ordine
// i punti di una struttura TRect.
procedure SortRectEdges(var ARect: TRect);

  procedure SwapIntegers(var I1, I2: Integer);
  var
    I3: Integer;
  begin
    I3 := I1;
    I1 := I2;
    I2 := I3;
  end;

begin
  if ARect.Left > ARect.Right then
    SwapIntegers(ARect.Left, ARect.Right);
  if ARect.Top > ARect.Bottom then
    SwapIntegers(ARect.Top, ARect.Bottom);
end;

procedure TFmShapes.FormCreate(Sender: TObject);
begin
  // Inizializzo le variabili private.
  ResetDragRect;
  // Inizializzo la pulsantiera.
  SbRettangolo.Click;
  SbRettangolo.Down := True;
  // Inizializzo il generatore di numeri casuali.
  Randomize;
end;

procedure TFmShapes.SbQuadratoClick(Sender: TObject);
begin
  ShapeType := stSquare;
end;

procedure TFmShapes.SbRettangoloClick(Sender: TObject);
begin
  ShapeType := stRectangle;
end;

procedure TFmShapes.SbCerchioClick(Sender: TObject);
begin
  ShapeType := stCircle;
end;

procedure TFmShapes.SbEllisseClick(Sender: TObject);
begin
  ShapeType := stEllipse;
end;

procedure TFmShapes.SbRoundRectClick(Sender: TObject);
begin
  ShapeType := stRoundRect;
end;

procedure TFmShapes.SetShapeType(const Value: TShapeType);
begin
  FShapeType := Value;
end;

procedure TFmShapes.PnWorkAreaMouseDown(Sender: TObject;
  Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
begin
  if Button = mbLeft then begin
    // Memorizzo il punto iniziale del trascinamento.
    FDragRect.Left := X;
    FDragRect.Top := Y;
    FDragRectVisible := False;
  end;
end;

type
  // Per poter accedere al Canvas.
  THackPanel = class(TPanel);

procedure TFmShapes.PnWorkAreaMouseMove(Sender: TObject;
  Shift: TShiftState; X, Y: Integer);
var
  OldPenStyle: TPenStyle;
  OldpenMode: TPenMode;
begin
  if FDragRect.Left <> -1 then
    with THackPanel(PnWorkArea).Canvas do begin
      // Metto via le impostazioni della penna, da
      // ripristinare una volta terminato.
      OldPenStyle := Pen.Style;
      OldPenMode := Pen.Mode;
      try
        // Impostazioni per il rettangolo di trascinamento.
        Pen.Style := psDot;
        Pen.Mode := pmXor;
        // Cancello il rettangolo precedente...
        if FDragRectVisible then
          Rectangle(FDragRect);
        // ...e disegno quello nuovo.
        FDragRect.Right := X;
        FDragRect.Bottom := Y;
        Rectangle(FDragRect);
        FDragRectVisible := True;
      finally
        Pen.Style := OldPenStyle;
        Pen.Mode := OldPenMode;
      end;
    end;
end;

procedure TFmShapes.PnWorkAreaMouseUp(Sender: TObject;
  Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
begin
  if Button = mbLeft then begin
    // Creo un'istanza di TShape e la mostro sul pannello.
    with TShape.Create(Self) do begin
      // La forma deve essere quella prescelta.
      Shape := FShapeType;
      // La figura appare sul pannello.
      Parent := (Sender as TWinControl);
      if FDragRectVisible then begin
        // La figura avrà le dimensioni determinate dal
        // trascinamento del cursore del mouse.
        SortRectEdges(FDragRect);
        SetBounds(FDragRect.Left, FDragRect.Top,
          FDragRect.Right - FDragRect.Left,
          FDragRect.Bottom - FDragRect.Top);
      end
      else begin
        // La figura apparirà con il centro in corrispondenza del
        // puntatore del mouse, di dimensione fissa.
        Width := FIGURE_DEFAULT_WIDTH;
        Height := FIGURE_DEFAULT_HEIGHT;
        Left := FDragRect.Left - (Width div 2);
        Top := FDragRect.Top - (Height div 2);
      end;
      // Assegno alla figura l'event handler predisposto.
      OnMouseUp := RandomizeShape;
    end;
  end;
  // Ripristino il trascinamento.
  ResetDragRect;
end;

procedure TFmShapes.RandomizeShape(Sender: TObject; Button: TMouseButton;
  Shift: TShiftState; X, Y: Integer);
begin
  with Sender as TShape do begin
    if Button = mbLeft then begin
      // Cambio i colori.
      Pen.Color := Random(High(TColor));
      Brush.Color := Random(High(TColor));
      // Cambio la forma.
      Shape := TShapeType(Random(Ord(High(TShapeType))));
    end
    else if Button = mbRight then
      Free;
  end;
end;

procedure TFmShapes.ResetDragRect;
begin
  FDragRect := Rect(-1, -1, -1, -1);
end;

end.
