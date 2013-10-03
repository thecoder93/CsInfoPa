program NewHintDemo;

uses
  Forms,
  UFmNewHintDemo in 'UFmNewHintDemo.pas' {FmNewHintDemo},
  LDNewHint in 'LDNewHint.pas';

{$R *.RES}

begin
  Application.Initialize;
  Application.CreateForm(TFmNewHintDemo, FmNewHintDemo);
  Application.Run;
end.
