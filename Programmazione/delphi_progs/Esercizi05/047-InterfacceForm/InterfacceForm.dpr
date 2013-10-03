program InterfacceForm;

uses
  Forms,
  UFmPrincipale in 'UFmPrincipale.pas' {FmPrincipale},
  UfmMastrini in 'UfmMastrini.pas' {FmMastrini},
  UInterfaccia in 'UInterfaccia.pas',
  UfmEstratti in 'UFmEstratti.pas' {FmEstratti};

{$R *.RES}

begin
  Application.Initialize;
  Application.CreateForm(TFmPrincipale, FmPrincipale);
  Application.Run;
end.
