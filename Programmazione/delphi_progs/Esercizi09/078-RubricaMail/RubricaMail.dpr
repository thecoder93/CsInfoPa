program RubricaMail;

uses
  Forms,
  UFmRubricaMail in 'UFmRubricaMail.pas' {FmRubricaMail},
  UFmMail in 'UFmMail.pas' {FmMail};

{$R *.RES}

begin
  Application.Initialize;
  Application.CreateForm(TFmRubricaMail, FmRubricaMail);
  Application.Run;
end.
