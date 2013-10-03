program ContaParole;

uses
  Forms,
  UfmContaParole in 'UfmContaParole.pas' {FmContaParole},
  Stringhe in 'Stringhe.pas';

{$R *.RES}

begin
  Application.Initialize;
  Application.CreateForm(TFmContaParole, FmContaParole);
  Application.Run;
end.
