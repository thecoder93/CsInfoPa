program FinestreAttive;

uses
  Forms,
  UFmFinestreAttive in 'UFmFinestreAttive.pas' {FmFinestreAttive};

{$R *.RES}

begin
  Application.Initialize;
  Application.CreateForm(TFmFinestreAttive, FmFinestreAttive);
  Application.Run;
end.
