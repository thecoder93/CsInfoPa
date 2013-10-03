program FileSplit;

uses
  Forms,
  UFmFileSplit in 'UFmFileSplit.pas' {FmFileSplit};

{$R *.RES}

begin
  Application.Initialize;
  Application.CreateForm(TFmFileSplit, FmFileSplit);
  Application.Run;
end.
