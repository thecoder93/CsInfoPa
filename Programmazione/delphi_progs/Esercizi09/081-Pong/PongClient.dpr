program PongClient;

uses
  Forms,
  UFmPongClient in 'UFmPongClient.pas' {FmPongClient},
  PongCommon in 'PongCommon.pas',
  UFrCampoDiGioco in 'UFrCampoDiGioco.pas' {FrCampoDiGioco: TFrame};

{$R *.RES}

begin
  Application.Initialize;
  Application.CreateForm(TFmPongClient, FmPongClient);
  Application.Run;
end.
