program Fire;

uses
  Forms,
  UFmFire in 'UFmFire.pas' {FmFire};

{$R *.RES}

begin
  Application.Initialize;
  Application.CreateForm(TFmFire, FmFire);
  Application.Run;
end.
