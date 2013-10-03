program DosOutput;

uses
  Forms,
  UFmDosOutput in 'UFmDosOutput.pas' {FmDosOutput};

{$R *.RES}

begin
  Application.Initialize;
  Application.CreateForm(TFmDosOutput, FmDosOutput);
  Application.Run;
end.
