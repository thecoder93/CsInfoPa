program Tiles;

uses
  Forms,
  UFmTiled in 'UFmTiled.pas' {FmTiled},
  Unit2 in 'Unit2.pas' {FmTiled2},
  Unit3 in 'Unit3.pas' {Form3};

{$R *.RES}

begin
  Application.Initialize;
  Application.CreateForm(TFmTiled2, FmTiled2);
  Application.CreateForm(TForm3, Form3);
  Application.Run;
end.
