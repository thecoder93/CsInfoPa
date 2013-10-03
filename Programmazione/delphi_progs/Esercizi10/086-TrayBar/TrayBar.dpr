program TrayBar;

uses
  Forms,
  UStampaSchermo in 'UStampaSchermo.pas',
  UFmTrayBar in 'UFmTrayBar.pas' {FmTrayBar};

{$R *.RES}

begin
  Application.ShowMainForm := False;
  Application.Initialize;
  Application.CreateForm(TFmTrayBar, FmTrayBar);
  Application.Run;
end.
