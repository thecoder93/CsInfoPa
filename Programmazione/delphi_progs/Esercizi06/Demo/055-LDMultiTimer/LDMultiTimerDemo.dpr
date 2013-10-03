program LDMultiTimerDemo;

uses
  Forms,
  UFmLDMultiTimerDemo in 'UFmLDMultiTimerDemo.pas' {FmLDMultiTimerDemo};

{$R *.RES}

begin
  Application.Initialize;
  Application.CreateForm(TFmLDMultiTimerDemo, FmLDMultiTimerDemo);
  Application.Run;
end.
