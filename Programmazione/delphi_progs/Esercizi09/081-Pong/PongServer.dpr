program PongServer;

uses
  Forms,
  UFmPongServer in 'UFmPongServer.pas' {FmPongServer},
  UFrCampoDiGioco in 'UFrCampoDiGioco.pas' {FrCampoDiGioco: TFrame},
  PongCommon in 'PongCommon.pas';

{$R *.RES}

begin
  Application.Initialize;
  Application.CreateForm(TFmPongServer, FmPongServer);
  Application.Run;
end.
