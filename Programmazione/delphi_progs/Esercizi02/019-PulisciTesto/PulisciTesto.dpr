program PulisciTesto;

uses
  Forms,
  fmPulisci in 'fmPulisci.pas' {fmPuliscitesto};

{$R *.RES}

begin
  Application.Initialize;
  Application.CreateForm(TfmPulisciTesto, fmPulisciTesto);
  Application.Run;
end.
