program FloatToBinTest;

uses
  Forms,
  UfmFloatToBin in 'UfmFloatToBin.pas' {fmFloatToBin},
  Stringhe in 'Stringhe.pas';

{$R *.RES}

begin
  Application.Initialize;
  Application.CreateForm(TfmFloatToBin, fmFloatToBin);
  Application.Run;
end.
