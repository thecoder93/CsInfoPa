unit UFmTrayBar;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms,
  Dialogs, ShellApi;

const
// codice del messaggio di notifica
	WM_ICONMESSAGE = WM_APP + 1;

type
  TFmTrayBar = class(TForm)
    procedure FormCreate(Sender: TObject);
  private
    NID: TNotifyIconData;
    procedure WmIconMessage(var Msg: TMessage);
      message WM_ICONMESSAGE;
    procedure ChiudiTutto;
    procedure RegistraIcona;
  public
  end;

var
  FmTrayBar: TFmTrayBar;

implementation

{$R *.DFM}

uses
  UStampaSchermo;

{ TFmTrayBar }

procedure TFmTrayBar.FormCreate(Sender: TObject);
begin
// all'avv inserico l'icona della Tray Area
  RegistraIcona;
end;

procedure TFmTrayBar.RegistraIcona;
begin
// passo la dimensione della struttura...
  NID.cbSize := SizeOf(TNotifyIconData);
// ...l'icona...
  NID.hIcon := Application.Icon.Handle;
// ...l'hint...
  NID.szTip := 'Stampa schermo'#0;
// ...il codice del messaggio che voglio ricevere...
  NID.uCallbackMessage := WM_ICONMESSAGE;
// ...i flag...
  NID.uFlags := NIF_MESSAGE + NIF_ICON + NIF_TIP;
// ...un numero che mi verrà rinviato ad ogni messaggio...
  NID.uID := 0;
// ...e l'handle della form
  NID.Wnd := Handle;
// infine aggiungo l'icona
  Shell_NotifyIcon(NIM_ADD, @NID);
end;

procedure TFmTrayBar.WmIconMessage(var Msg: TMessage);
begin
// controllo il tasto premuto
// e mi comporto di conseguenza
  case Msg.LParam of
  WM_LBUTTONDOWN:
    StampaDesktop;
  WM_RBUTTONDOWN:
    ChiudiTutto;
  end;
end;

procedure TFmTrayBar.ChiudiTutto;
begin
// de-registro l'icona
	Shell_NotifyIcon(NIM_DELETE, @NID);
	Application.Terminate;
end;

end.
