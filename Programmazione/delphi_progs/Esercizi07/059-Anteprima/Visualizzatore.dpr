program Visualizzatore;

uses
  Forms,
  UFmVisualizzatore in 'UFmVisualizzatore.pas' {FmVisualizzatore};

{$R *.RES}

begin
  Application.Initialize;
  Application.CreateForm(TFmVisualizzatore, FmVisualizzatore);
  Application.Run;
end.
