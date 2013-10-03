program Rubrica;

uses
  Forms,
  FmRubr in 'FmRubr.pas' {fmAgenda};

{$R *.RES}

begin
  Application.Initialize;
  Application.CreateForm(TFmRubrica, FmRubrica);
  Application.Run;
end.
