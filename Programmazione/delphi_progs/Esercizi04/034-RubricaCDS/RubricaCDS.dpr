program RubricaCDS;

uses
  Forms,
  URubricaCDS in 'URubricaCDS.pas' {FmRubricaCDS};

{$R *.RES}

begin
  Application.Initialize;
  Application.CreateForm(TFmRubricaCDS, FmRubricaCDS);
  Application.Run;
end.
