program AliasMan;

uses
  Forms,
  UFmAliasMan in 'UFmAliasMan.pas' {FmAliasMan};

{$R *.RES}

begin
  Application.Initialize;
  Application.CreateForm(TFmAliasMan, FmAliasMan);
  Application.Run;
end.
