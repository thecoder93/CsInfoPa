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
  private
    FShapeType: TShapeType;
    procedure SetShapeType(const Value: TShapeType);
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
  FIGURE_WIDTH = 60;
  FIGURE_HEIGHT = 30;

procedure TFmShapes.FormCreate(Sender: TObject);
begin
  // Inizializzo la pulsantiera.
  SbQuadrato.Click;
  SbQuadrato.Down := True;
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

procedure TFmShapes.PnWorkAreaMouseUp(Sender: TObject;
  Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
begin
  if Button = mbLeft then begin
    // Creo un'istanza di TShape e la mostro sul pannello.
    with TShape.Create(Self) do begin
      // La forma deve essere quella prescelta.
      Shape := FShapeType;
      // La figura apparirà con il centro in corrispondenza del
      // puntatore del mouse, di dimensione fissa.
      Width := FIGURE_WIDTH;
      Height := FIGURE_HEIGHT;
      Left := X - (Width div 2);
      Top := Y - (Height div 2);
      // La figura appare sul pannello.
      Parent := (Sender as TWinControl);
      // Assegno alla figura l'event handler predisposto.
      OnMouseUp := RandomizeShape;
    end;
  end;
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

end.
