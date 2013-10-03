unit UFmChatServer;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  ScktComp, StdCtrls, Menus;

type
  TFmChatServer = class(TForm)
    ServerSocket: TServerSocket;
    LbMsgs: TListBox;
    MainMenu1: TMainMenu;
    Opzioni1: TMenuItem;
    MiLogging: TMenuItem;
    procedure ServerSocketClientDisconnect(Sender: TObject;
      Socket: TCustomWinSocket);
    procedure ServerSocketClientRead(Sender: TObject;
      Socket: TCustomWinSocket);
    procedure MiLoggingClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
  private
    function GetLogging: Boolean;
  private
    procedure AddLogMsg(Name, Msg: string);
    procedure DispatchMsg(Name, Msg: string);
    function GetClientName(Socket: TCustomWinSocket): string;
    function GetServerName: string;
    property Logging: Boolean read GetLogging;
    procedure SendTextToSocket(Text: string; Socket: TCustomWinSocket);
  public
  end;

  TClientData = class
  public
    Nickname: string;
    constructor Create(ANickname: string);
  end;

var
  FmChatServer: TFmChatServer;

implementation

{$R *.DFM}

procedure TFmChatServer.FormCreate(Sender: TObject);
begin
  // Inizio l'ascolto.
  ServerSocket.Active := True;
end;

procedure TFmChatServer.ServerSocketClientRead(Sender: TObject;
  Socket: TCustomWinSocket);
var
  ClientName, Msg: string;
begin
  // La prima stringa inviata da ciascun client connesso viene interpretata come
  // il Nickname del client; in questa circostanza creo ed assegno alla
  // connessione un oggetto TClientData.
  if not Assigned(Socket.Data) then begin
    Socket.Data := TClientData.Create(Socket.ReceiveText);
    ClientName := GetClientName(Socket);
    AddLogMsg(ClientName, '<connesso>');
    // Invio al client appena connesso un messaggio di benvenuto personale.
    SendTextToSocket(Format('Benvenuto, %s.', [ClientName]), Socket);
    // Invio il messaggio pubblico di benvenuto.
    DispatchMsg(GetServerName, Format('Diamo il benvenuto a %s.', [ClientName]));
  end
  else begin
    ClientName := GetClientName(Socket);
    Msg := Socket.ReceiveText;
    DispatchMsg(ClientName, Msg);
  end;
end;

procedure TFmChatServer.ServerSocketClientDisconnect(Sender: TObject;
  Socket: TCustomWinSocket);
var
  ClientName: string;
begin
  ClientName := GetClientName(Socket);
  AddLogMsg(ClientName, '<disconnesso>');
  TClientData(Socket.Data).Free;
  DispatchMsg(GetServerName, Format('%s ha lasciato la chat.', [ClientName]));
end;

procedure TFmChatServer.DispatchMsg(Name, Msg: string);
var
  g: Integer;
begin
  for g := 0 to Pred(ServerSocket.Socket.ActiveConnections) do
    SendTextToSocket(Format('%s: %s', [Name, Msg]), ServerSocket.Socket.Connections[g]);
  AddLogMsg(Name, Msg);
end;

procedure TFmChatServer.SendTextToSocket(Text: string;
  Socket: TCustomWinSocket);
begin
  Socket.SendText(Format('%s %s', [FormatDateTime('dd/mm/yy hh:nn:ss', Now), Text]));
end;

procedure TFmChatServer.AddLogMsg(Name, Msg: string);
begin
  if Logging then
    LbMsgs.Items.Add(Format('%s: %s', [Name, Msg]));
end;

function TFmChatServer.GetLogging: Boolean;
begin
  Result := MiLogging.Checked;
end;

procedure TFmChatServer.MiLoggingClick(Sender: TObject);
begin
  MiLogging.Checked := not MiLogging.Checked;
end;

function TFmChatServer.GetClientName(Socket: TCustomWinSocket): string;
begin
  Result := Format ('%s da %s',
    [TClientData(Socket.Data).Nickname, Socket.RemoteAddress]);
end;

function TFmChatServer.GetServerName: string;
begin
  Result := 'Chat Server';
end;

{ TClientData }

constructor TClientData.Create(ANickname: string);
begin
  Nickname := ANickname;
end;

end.
