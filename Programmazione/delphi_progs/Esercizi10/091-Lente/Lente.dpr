program Lente;

uses
  Forms,
  UFmLente in 'UFmLente.pas' {FmLente};

{$R *.RES}

begin
  Application.Initialize;
  Application.CreateForm(TFmLente, FmLente);
  Application.Run;
end.
