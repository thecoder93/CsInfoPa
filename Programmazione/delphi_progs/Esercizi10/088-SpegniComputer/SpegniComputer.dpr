program SpegniComputer;

uses
  Forms,
  UFmSpegni in 'UFmSpegni.pas' {FmSpegni},
  USpegniComputer in 'USpegniComputer.pas';

{$R *.RES}

begin
  Application.Initialize;
  Application.CreateForm(TFmSpegni, FmSpegni);
  Application.Run;
end.
