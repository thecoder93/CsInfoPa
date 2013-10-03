program SalvaStatoForm;

uses
  Forms,
  UFmDemo in 'UFmDemo.pas' {FmDemo},
  StatoForm in 'StatoForm.pas';

{$R *.RES}

begin
  Application.Initialize;
  Application.CreateForm(TFmDemo, FmDemo);
  Application.Run;
end.
