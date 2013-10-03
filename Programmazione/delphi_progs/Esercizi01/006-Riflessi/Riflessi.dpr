program Riflessi;

uses
  Forms,
  Rifl in 'Rifl.pas' {fmRiflessi};

{$R *.RES}

begin
  Application.Initialize;
  Application.CreateForm(TfmRiflessi, fmRiflessi);
  Application.Run;
end.
