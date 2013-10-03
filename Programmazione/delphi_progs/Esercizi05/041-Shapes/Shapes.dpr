program Shapes;

uses
  Forms,
  UFmShapes in 'UFmShapes.pas' {FmShapes};

{$R *.RES}

begin
  Application.Initialize;
  Application.CreateForm(TFmShapes, FmShapes);
  Application.Run;
end.
