unit UFmChatMain;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  Psock, NMMSG, StdCtrls, ExtCtrls;

type
  TFmChatMain = class(TForm)
    EtChat: TMemo;
    Splitter1: TSplitter;
    LbUsers: TListBox;
    PnTools: TPanel;
    EtNick: TEdit;
    Nickname: TLabel;
    EtHost: TEdit;
    Label1: TLabel;
    Label2: TLabel;
    EtMessage: TEdit;
    Client: TNMMsg;
    Server: TNMMSGServ;
    procedure EtMessageKeyUp(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure ServerMSG(Sender: TComponent; const sFrom, sMsg: String);
  private
    procedure AddUser(UserName, Address: string);
    procedure SendMsg(Sender, Receiver, Msg: string);
    procedure ReceiveMsg(Sender, SenderAddress, Msg: string);
  public
  end;

var
  FmChatMain: TFmChatMain;

implementation

{$R *.DFM}

{ Client }

procedure TFmChatMain.EtMessageKeyUp(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if (EtNick.Text <> '') and (EtHost.Text <> '') then begin
    if Key = VK_RETURN then begin
      SendMsg(EtNick.Text, EtHost.Text, EtMessage.Text);
      EtMessage.Clear;
    end;
  end;
end;

procedure TFmChatMain.SendMsg(Sender, Receiver, Msg: string);
begin
  Client.FromName := Sender;
  Client.Host := Receiver;
  Client.PostIt(Msg);
  // Aggiungo il messaggio spedito anche alla chat locale.
  ReceiveMsg(Client.FromName, Client.LocalIP, Msg);
end;

{ Server }

procedure TFmChatMain.ServerMSG(Sender: TComponent; const sFrom, sMsg: String);
begin
  ReceiveMsg(sFrom, TNMMSGServ(Sender).RemoteIP, sMsg);
end;

procedure TFmChatMain.ReceiveMsg(Sender, SenderAddress, Msg: string);
begin
  AddUser(Sender, SenderAddress);
  EtChat.Lines.Add(Sender + ': ' + Msg);
end;

procedure TFmChatMain.AddUser(UserName, Address: string);
var
  User: string;
begin
  // Aggiungo alla lista solo gli elementi
  // che non ne fanno ancora parte.
  User := Format('%s da %s', [UserName, Address]);
  if LbUsers.Items.IndexOf(User) < 0 then
    LbUsers.Items.Add(User);
end;

end.
