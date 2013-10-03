program RegolaImmagine;

uses
  Forms,
  UFmVisualizzatore in 'UFmVisualizzatore.pas' {FmVisualizzatore},
  Colori in 'Colori.pas';

{$R *.RES}

begin
  Application.Initialize;
  Application.CreateForm(TFmVisualizzatore, FmVisualizzatore);
  Application.Run;
end.
