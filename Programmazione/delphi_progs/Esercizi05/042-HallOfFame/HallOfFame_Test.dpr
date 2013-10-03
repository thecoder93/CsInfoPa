program HallOfFame_Test;

uses
  Forms,
  UFmMain in 'UFmMain.pas' {FmMain},
  HallOfFame in 'HallOfFame.pas';

{$R *.RES}

begin
  Application.Initialize;
  Application.CreateForm(TFmMain, FmMain);
  Application.Run;
end.
