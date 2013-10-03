program VotiStudenti;

uses
  Forms,
  UFmVoti in 'UFmVoti.pas' {FmVoti};

{$R *.RES}

begin
  Application.Initialize;
  Application.CreateForm(TFmVoti, FmVoti);
  Application.Run;
end.
