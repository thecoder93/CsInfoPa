program VisualizzatoreFTP;

uses
  Forms,
  UFmVisualizzatore in 'UFmVisualizzatore.pas' {FmVisualizzatore},
  UFmAttesa in 'UFmAttesa.pas' {FmAttesa};

{$R *.RES}

begin
  Application.Initialize;
  Application.CreateForm(TFmVisualizzatore, FmVisualizzatore);
  Application.Run;
end.
