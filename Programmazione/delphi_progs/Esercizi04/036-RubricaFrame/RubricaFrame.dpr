program RubricaFrame;

uses
  Forms,
  UFmRubricaFrame in 'UFmRubricaFrame.pas' {FmRubricaFrame},
  UFrDataEntry in 'UFrDataEntry.pas' {FrDataEntry: TFrame},
  UFmInserimento in 'UFmInserimento.pas' {FmInserimento};

{$R *.RES}

begin
  Application.Initialize;
  Application.CreateForm(TFmRubricaFrame, FmRubricaFrame);
  Application.Run;
end.
