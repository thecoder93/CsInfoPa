program BancomatDemo;

uses
  Forms,
  UFmBancomat in 'UFmBancomat.pas' {FmBancomat},
  LDBancomat in 'LDBancomat.pas';

{$R *.RES}

begin
  Application.Initialize;
  Application.CreateForm(TFmBancomat, FmBancomat);
  Application.Run;
end.
