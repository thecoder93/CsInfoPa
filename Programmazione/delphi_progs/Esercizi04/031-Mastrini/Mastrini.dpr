program Mastrini;

uses
  Forms,
  UfmMastrini in 'UfmMastrini.pas' {FmMastrini};

{$R *.RES}

begin
  Application.Initialize;
  Application.CreateForm(TFmMastrini, FmMastrini);
  Application.Run;
end.
