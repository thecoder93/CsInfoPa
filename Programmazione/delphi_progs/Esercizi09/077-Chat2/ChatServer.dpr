program ChatServer;

uses
  Forms,
  UFmChatServer in 'UFmChatServer.pas' {FmChatServer};

{$R *.RES}

begin
  Application.Initialize;
  Application.CreateForm(TFmChatServer, FmChatServer);
  Application.Run;
end.
