program GestioneCampionato;

uses
  Forms,
  UFmGestioneCampionato in 'UFmGestioneCampionato.pas' {FmGestioneCampionato},
  ClassificaUtils in 'ClassificaUtils.pas';

{$R *.RES}

begin
  Application.Initialize;
  Application.CreateForm(TFmGestioneCampionato, FmGestioneCampionato);
  Application.Run;
end.
