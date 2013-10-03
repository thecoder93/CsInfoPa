unit UFmMailPreview;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  Psock, NMpop3, StdCtrls, ComCtrls, ExtCtrls;

type
  TFmMailPreview = class(TForm)
    PnParams: TPanel;
    SbStatus: TStatusBar;
    LvMsgs: TListView;
    Label1: TLabel;
    EtServerName: TEdit;
    EtUserName: TEdit;
    Label2: TLabel;
    EtPassword: TEdit;
    Label3: TLabel;
    SbGo: TButton;
    POP: TNMPOP3;
    EtHeader: TMemo;
    Splitter1: TSplitter;
    procedure SbGoClick(Sender: TObject);
    procedure POPConnect(Sender: TObject);
    procedure POPConnectionFailed(Sender: TObject);
    procedure POPDisconnect(Sender: TObject);
    procedure POPFailure(Sender: TObject);
    procedure POPHostResolved(Sender: TComponent);
    procedure POPInvalidHost(var Handled: Boolean);
    procedure POPPacketRecvd(Sender: TObject);
    procedure POPRetrieveEnd(Sender: TObject);
    procedure POPRetrieveStart(Sender: TObject);
    procedure POPStatus(Sender: TComponent; Status: String);
    procedure POPSuccess(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
    procedure LvMsgsChange(Sender: TObject; Item: TListItem;
      Change: TItemChange);
  private
    procedure DisplayMessageInfo(Msg: Integer);
    procedure DisplayStatus(Msg: string);
  public
  end;

var
  FmMailPreview: TFmMailPreview;

implementation

{$R *.DFM}

procedure TFmMailPreview.SbGoClick(Sender: TObject);
var
  g: Integer;
begin
  if (EtServerName.Text <> '') and (EtUserName.Text <> '') and
     (EtPassword.Text <> '') then begin
    // Imposto i parametri dell'account di posta elettronica.
    POP.Host := EtServerName.Text;
    POP.UserID := EtUserName.Text;
    POP.Password := EtPassword.Text;
    // Connessione.
    POP.Connect;
    try
      // Scarico intestazioni.
      for g := 1 to POP.MailCount do
        DisplayMessageInfo(g);
    finally
      // Disconnessione.
      POP.Disconnect;
    end;
  end;
end;

procedure TFmMailPreview.DisplayMessageInfo(Msg: Integer);
begin
  // Leggo l'intestazione del messaggio.
  POP.GetSummary(Msg);
  // Aggiungo i dati alla ListView.
  with LvMsgs.Items.Add do begin
    Caption := POP.Summary.From;
    SubItems.Add(POP.Summary.Subject);
    SubItems.Add(POP.Summary.MessageId);
    SubItems.Add(IntToStr(POP.Summary.Bytes));
    Data := TStringList.Create;
    TStrings(Data).Assign(POP.Summary.Header);
  end;
end;

procedure TFmMailPreview.FormDestroy(Sender: TObject);
var
  g: Integer;
begin
  // Libero la memoria allocata per le intestazioni dei messaggi.
  for g := 0 to Pred(LvMsgs.Items.Count) do
    TStrings(LvMsgs.Items[g].Data).Free;
end;

procedure TFmMailPreview.LvMsgsChange(Sender: TObject; Item: TListItem;
  Change: TItemChange);
begin
  // Mostro le intestazioni del messaggio corrente.
  if (Change = ctState) and Item.Selected then
    EtHeader.Lines.Assign(TStrings(Item.Data));
end;

// Gestione dello stato.

procedure TFmMailPreview.DisplayStatus(Msg: string);
begin
  SbStatus.SimpleText := Msg;
end;

procedure TFmMailPreview.POPConnect(Sender: TObject);
begin
  DisplayStatus('Connessione effettuata');
end;

procedure TFmMailPreview.POPDisconnect(Sender: TObject);
begin
  DisplayStatus('Connessione terminata');
end;

procedure TFmMailPreview.POPHostResolved(Sender: TComponent);
begin
  DisplayStatus('Nome del server risolto');
end;

procedure TFmMailPreview.POPPacketRecvd(Sender: TObject);
begin
  DisplayStatus(Format('Ricevuti %d byte su %d', [POP.BytesRecvd, POP.BytesTotal]));
end;

procedure TFmMailPreview.POPRetrieveEnd(Sender: TObject);
begin
  DisplayStatus('Ricezione terminata');
end;

procedure TFmMailPreview.POPRetrieveStart(Sender: TObject);
begin
  DisplayStatus('Inizio ricezione');
end;

procedure TFmMailPreview.POPStatus(Sender: TComponent; Status: String);
begin
  DisplayStatus('Stato: ' + Status);
end;

procedure TFmMailPreview.POPSuccess(Sender: TObject);
begin
  DisplayStatus('Operazione riuscita');
end;

// Notifiche di errore.

procedure TFmMailPreview.POPInvalidHost(var Handled: Boolean);
begin
  ShowMessage('Server non riconosciuto.');
end;

procedure TFmMailPreview.POPFailure(Sender: TObject);
begin
  ShowMessage('Operazione fallita.');
end;

procedure TFmMailPreview.POPConnectionFailed(Sender: TObject);
begin
  ShowMessage('Connessione fallita.');
end;

end.
