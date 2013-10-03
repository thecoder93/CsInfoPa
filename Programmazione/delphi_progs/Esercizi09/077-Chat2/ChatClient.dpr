program ChatClient;

uses
  Forms,
  UFmChatClient in 'UFmChatClient.pas' {FmChatClient};

{$R *.RES}

begin
  Application.Initialize;
  Application.CreateForm(TFmChatClient, FmChatClient);
  Application.Run;
end.
