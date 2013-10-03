program LaunchIt;

uses
  Forms,
  UFmLaunch in 'UFmLaunch.pas' {FmLaunch};

{$R *.RES}

begin
  Application.Initialize;
  Application.CreateForm(TFmLaunch, FmLaunch);
  Application.Run;
end.
