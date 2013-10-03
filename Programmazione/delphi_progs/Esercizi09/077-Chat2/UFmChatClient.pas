unit UFmChatClient;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  ScktComp, StdCtrls, Buttons, ExtCtrls, ComCtrls;

type
  TFmChatClient = class(TForm)
    ClientSocket: TClientSocket;
    EtSend: TEdit;
    CkActive: TCheckBox;
    EtChat: TRichEdit;
    PnTools: TPanel;
    Label1: TLabel;
    EtNickName: TEdit;
    SbConnessione: TSpeedButton;
    Label2: TLabel;
    EtServerIP: TEdit;
    procedure EtSendKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure ClientSocketRead(Sender: TObject; Socket: TCustomWinSocket);
    procedure ValidateInputParams(Sender: TObject);
    procedure SbConnessioneClick(Sender: TObject);
    procedure ClientSocketConnect(Sender: TObject;
      Socket: TCustomWinSocket);
    procedure ClientSocketDisconnect(Sender: TObject;
      Socket: TCustomWinSocket);
  private
    procedure DisplayReceivedMsg(Msg: string);
    procedure SendMsg(Msg: string);
  public
  end;

var
  FmChatClient: TFmChatClient;

implementation

{$R *.DFM}

procedure TFmChatClient.ValidateInputParams(Sender: TObject);
begin
  // Per poter effettuare una connessione, è necessario indicare
  // sia l'indirizzo del server che il Nickname.
  SbConnessione.Enabled := (EtServerIP.Text <> '') and (EtNickName.Text <> '');
end;

procedure TFmChatClient.SbConnessioneClick(Sender: TObject);
begin
  // Tentativo di connessione: imposto l'indirizzo
  // del server e attivo il ClientSocket.
  if not ClientSocket.Active then
    ClientSocket.Address := EtServerIP.Text;
  ClientSocket.Active := not ClientSocket.Active;
end;

procedure TFmChatClient.ClientSocketConnect(Sender: TObject;
  Socket: TCustomWinSocket);
begin
  // Connessione stabilita: adeguo l'interfaccia utente.
  EtNickName.Enabled := False;
  EtSend.Enabled := True;
  SbConnessione.Caption := 'Esci';
  EtSend.SetFocus;
  // Invio il Nickname.
  SendMsg(EtNickName.Text);
end;

procedure TFmChatClient.ClientSocketDisconnect(Sender: TObject;
  Socket: TCustomWinSocket);
begin
  // Disconnessione: adeguo l'interfaccia utente.
  EtNickName.Enabled := True;
  EtSend.Enabled := False;
  SbConnessione.Caption := 'Entra';
end;

procedure TFmChatClient.SendMsg(Msg: string);
begin
  ClientSocket.Socket.SendText(Msg);
end;

procedure TFmChatClient.EtSendKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if Key = VK_RETURN then
    with Sender as TEdit do begin
      SendMsg(Text);
      Clear;
    end;
end;

procedure TFmChatClient.ClientSocketRead(Sender: TObject;
  Socket: TCustomWinSocket);
begin
  DisplayReceivedMsg(Socket.ReceiveText);
end;

procedure TFmChatClient.DisplayReceivedMsg(Msg: string);
begin
  EtChat.Lines.Add(Msg);
end;

end.
