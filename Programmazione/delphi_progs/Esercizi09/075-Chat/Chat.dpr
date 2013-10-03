program Chat;

uses
  Forms,
  UFmChatMain in 'UFmChatMain.pas' {FmChatMain};

{$R *.RES}

begin
  Application.Initialize;
  Application.CreateForm(TFmChatMain, FmChatMain);
  Application.Run;
end.
