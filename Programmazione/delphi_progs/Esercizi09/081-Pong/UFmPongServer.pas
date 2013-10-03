unit UFmPongServer;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, UFrCampoDiGioco, ExtCtrls, ScktComp;

type
  TFmPongServer = class(TForm)
    FrCampo: TFrCampoDiGioco;
    TmPalla: TTimer;
    PnPunti: TPanel;
    StPunti1: TLabel;
    StPunti2: TLabel;
    SsPong: TServerSocket;
    Label1: TLabel;
    StStato: TLabel;
    procedure FormKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure TmPallaTimer(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure SsPongClientConnect(Sender: TObject;
      Socket: TCustomWinSocket);
    procedure SsPongClientDisconnect(Sender: TObject;
      Socket: TCustomWinSocket);
    procedure SsPongClientRead(Sender: TObject; Socket: TCustomWinSocket);
    procedure SsPongListen(Sender: TObject; Socket: TCustomWinSocket);
  private
    procedure CambioPunteggio(Sender: TObject; Punteggio1,
      Punteggio2: Integer);
    procedure FineGioco(Sender: TObject; Vincitore: Integer);
    // Sposta il giocatore remoto sul frame.
    procedure SpostaPlayer1(Verso: Integer);
    // Sposta il giocatore locale sul frame, e
    // comunica lo spostamento al giocatore remoto.
    procedure SpostaPlayer2(Verso: Integer);
    // Mostra un messaggio di stato.
    procedure StatusMsg(Msg: string);
  public
  end;

var
  FmPongServer: TFmPongServer;

implementation

{$R *.DFM}

uses
  PongCommon;

procedure TFmPongServer.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if TmPalla.Enabled then begin
    // Muovo la mia racchetta.
    if Key = Ord('N') then begin
      SpostaPlayer2(VERSO_SX);
      Key := 0;
    end
    else if Key = Ord('M') then begin
      SpostaPlayer2(VERSO_DX);
      Key := 0;
    end;
  end;
end;

procedure TFmPongServer.TmPallaTimer(Sender: TObject);
begin
  // Sposto la palla...
  FrCampo.SpostaPalla;
  // ...e notifico lo spostamento al client.
  SsPong.Socket.Connections[0].SendText(MsgPosPallaX(FrCampo.PosPalla.X));
  SsPong.Socket.Connections[0].SendText(MsgPosPallaY(FrCampo.PosPalla.Y));
end;

procedure TFmPongServer.FormCreate(Sender: TObject);
begin
  // Aggancio i gestori per gli eventi del frame.
  FrCampo.OnCambioPunteggio := CambioPunteggio;
  FrCampo.OnFineGioco := FineGioco;
  // Attivo l'ascolto.
  SsPong.Active := True;
end;

procedure TFmPongServer.CambioPunteggio(Sender: TObject; Punteggio1,
  Punteggio2: Integer);
begin
  // Mostro il punteggio...
  StPunti1.Caption := IntToStr(Punteggio1);
  StPunti2.Caption := IntToStr(Punteggio2);
  // ...e notifico lo spostamento al client.
  SsPong.Socket.Connections[0].SendText(MsgPunteggio1(Punteggio1));
  SsPong.Socket.Connections[0].SendText(MsgPunteggio2(Punteggio2));
end;

procedure TFmPongServer.FineGioco(Sender: TObject; Vincitore: Integer);
begin
  TmPalla.Enabled := False;
  StatusMsg('Gioco terminato.');
  SsPong.Socket.Connections[0].SendText(MsgFineGioco(Vincitore));
  if Vincitore = 1 then
    ShowMessage('Fine gioco; hai perso.')
  else
    ShowMessage('Fine gioco; hai vinto.');
end;

procedure TFmPongServer.SsPongClientConnect(Sender: TObject;
  Socket: TCustomWinSocket);
begin
  FrCampo.NuovoGioco;
  TmPalla.Enabled := True;
  StatusMsg('Client connesso, inizio partita.');
end;

procedure TFmPongServer.SsPongClientDisconnect(Sender: TObject;
  Socket: TCustomWinSocket);
begin
  if TmPalla.Enabled then begin
    TmPalla.Enabled := False;
    StatusMsg('Client disconnesso, partita interrotta.');
    ShowMessage('Il giocatore remoto ha abbandonato la partita.');
  end;
end;

procedure TFmPongServer.SpostaPlayer1(Verso: Integer);
begin
  // Recepisco lo spostamento del client.
  FrCampo.SpostaPlayer1(Verso);
end;

procedure TFmPongServer.SpostaPlayer2(Verso: Integer);
begin
  // Notifico lo spostamento al client.
  SsPong.Socket.Connections[0].SendText(MsgSpostaPlayer2(Verso));
  FrCampo.SpostaPlayer2(Verso);
end;

procedure TFmPongServer.SsPongClientRead(Sender: TObject;
  Socket: TCustomWinSocket);
var
  Msg: string;
  Comando: string;
  Parametro: Integer;
begin
  Msg := Socket.ReceiveText;
  while MsgDecodifica(Msg, Comando, Parametro) do begin
    if Comando = SPOSTA_PLAYER1 then
      SpostaPlayer1(Parametro);
  end;
end;

procedure TFmPongServer.SsPongListen(Sender: TObject;
  Socket: TCustomWinSocket);
begin
  StatusMsg('In attesa di connessione dal client.');
end;

procedure TFmPongServer.StatusMsg(Msg: string);
begin
  StStato.Caption := Msg;
  StStato.Update;
end;

end.
