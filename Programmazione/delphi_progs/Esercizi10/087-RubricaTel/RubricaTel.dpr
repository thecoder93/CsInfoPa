program RubricaTel;

uses
  Forms,
  UFmRubricaTel in 'UFmRubricaTel.pas' {FmRubricaTel};

{$R *.RES}

begin
  Application.Initialize;
  Application.CreateForm(TFmRubricaTel, FmRubricaTel);
  Application.Run;
end.
