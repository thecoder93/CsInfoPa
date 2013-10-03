program HintDemo;

uses
  Forms,
  UFmMain in 'UFmMain.pas' {FmMain};

{$R *.RES}

begin
  Application.Initialize;
  Application.CreateForm(TFmMain, FmMain);
  Application.Run;
end.
