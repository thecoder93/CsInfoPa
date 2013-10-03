unit UFmMail;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls;

type
  TFmMail = class(TForm)
    Label1: TLabel;
    Label3: TLabel;
    EtMessaggio: TMemo;
    BtInvia: TButton;
    BtChiudi: TButton;
    BtScegliAllegato: TButton;
    EtOggetto: TEdit;
    OdAllegati: TOpenDialog;
    EtDestinatario: TEdit;
    EtAllegato: TEdit;
    Label4: TLabel;
    Label2: TLabel;
    procedure BtInviaClick(Sender: TObject);
    procedure BtScegliAllegatoClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
    function PreparaEMail(Destinatario: string): Boolean;
  end;

// Questa form non è auto-creata.
//var
//  FmMail: TFmMail;

implementation

{$R *.DFM}

uses
  Mapi;

{ TFmMail }

function TFmMail.PreparaEMail(Destinatario: string): Boolean;
begin
  EtDestinatario.Text := Destinatario;
  // Mostro la form modale.
  Result := ShowModal = mrOK;
end;

procedure TFmMail.BtScegliAllegatoClick(Sender: TObject);
begin
  if OdAllegati.Execute then
    EtAllegato.Text := OdAllegati.FileName;
end;

procedure TFmMail.BtInviaClick(Sender: TObject);
var
  Messaggio: TMapiMessage;
  Mittente, Destinatario: TMapiRecipDesc;
  Allegato: TMapiFileDesc;
  MapiError: Cardinal;
begin
  // Predispongo le strutture con i dati sull'invio.
  // Mittente.
  with Mittente do begin
    ulReserved := 0;
    ulRecipClass := MAPI_ORIG;
    lpszName := 'Laboratorio di Delphi';
    lpszAddress := nil;
    ulEIDSize := 0;
    lpEntryID := nil;
  end;
  // Destinatario
  with Destinatario do begin
    ulReserved := 0;
    ulRecipClass := MAPI_TO;
    lpszName := nil;
    lpszAddress := PChar('SMTP:' + EtDestinatario.Text);
    ulEIDSize := 0;
    lpEntryID := nil;
  end;
  // Allegato
  if EtAllegato.Text <> '' then begin
    with Allegato do begin
      ulReserved := 0;
      flFlags := 0;
      nPosition := $FFFFFFFF;
      lpszPathName := PChar(EtAllegato.Text);
      lpszFileName := nil;
      lpFileType := nil;
    end;
  end;
  // Messaggio
  with Messaggio do begin
    ulReserved := 0;
    lpszSubject := PChar(EtOggetto.Text);
    lpszNoteText := PChar(EtMessaggio.Lines.Text);
    lpszMessageType := nil;
    lpszDateReceived := nil;
    lpszConversationID := nil;
    flFlags := 0;
    lpOriginator := @Mittente;
    nRecipCount := 1;
    lpRecips := @Destinatario;
    if EtAllegato.Text <> '' then begin
      nFileCount := 1;
      lpFiles := @Allegato;
    end
    else begin
      nFileCount := 0;
      lpFiles := nil;
    end;
  end;
  MapiError := MapiSendMail(0, Handle, Messaggio,
    MAPI_LOGON_UI or MAPI_NEW_SESSION, 0);
  if MapiError = SUCCESS_SUCCESS then
    MessageDlg('Invio effettuato.', mtInformation, [mbOK], 0)
  else
    MessageDlg('Errore durante l''invio.', mtError, [mbOK], 0);
end;

end.
