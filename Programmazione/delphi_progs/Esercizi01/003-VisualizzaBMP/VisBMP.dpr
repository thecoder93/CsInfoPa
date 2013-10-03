program VisBMP;

uses
  Forms,
  Visu in 'Visu.pas' {fmVisualizza};

{$R *.RES}

begin
  Application.Initialize;
  Application.CreateForm(TfmVisualizza, fmVisualizza);
  Application.Run;
end.
