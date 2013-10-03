unit UFmPongClient;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  UFrCampoDiGioco, StdCtrls, ScktComp, ExtCtrls;

type
  TFmPongClient = class(TForm)
    FrCampo: TFrCampoDiGioco;
    CsPong: TClientSocket;
    BtGioca: TButton;
    EtIndirizzoServer: TEdit;
    Label1: TLabel;
    PnPunti: TPanel;
    StPunti1: TLabel;
    StPunti2: TLabel;
    procedure FormKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure BtGiocaClick(Sender: TObject);
    procedure CsPongRead(Sender: TObject; Socket: TCustomWinSocket);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
  private
    // Sposta il giocatore locale sul frame, e
    // comunica lo spostamento al giocatore remoto.
    procedure SpostaPlayer1(Verso: Integer);
    // Sposta il giocatore remoto sul frame.
    procedure SpostaPlayer2(Verso: Integer);
    // Fine della partita.
    procedure FineGioco(Vincitore: Integer);
  public
  end;

var
  FmPongClient: TFmPongClient;

implementation

{$R *.DFM}

uses
  PongCommon;

procedure TFmPongClient.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if CsPong.Active then begin
    // Muovo la mia racchetta.
    if Key = Ord('N') then begin
      SpostaPlayer1(VERSO_SX);
      Key := 0;
    end
    else if Key = Ord('M') then begin
      SpostaPlayer1(VERSO_DX);
      Key := 0;
    end;
  end;
end;

procedure TFmPongClient.SpostaPlayer1(Verso: Integer);
begin
  // Notifico lo spostamento al server.
  CsPong.Socket.SendText(MsgSpostaPlayer1(Verso));
  FrCampo.SpostaPlayer1(Verso);
end;

procedure TFmPongClient.SpostaPlayer2(Verso: Integer);
begin
  // Recepisco lo spostamento del server.
  FrCampo.SpostaPlayer2(Verso);
end;

procedure TFmPongClient.BtGiocaClick(Sender: TObject);
begin
  // Inizio o interrompo una partita.
  if CsPong.Active then begin
    CsPong.Active := False;
  end
  else begin
    CsPong.Address := EtIndirizzoServer.Text;
    CsPong.Active := True;
  end;
end;

procedure TFmPongClient.CsPongRead(Sender: TObject;
  Socket: TCustomWinSocket);
var
  Msg: string;
  Comando: string;
  Parametro: Integer;
  PosPalla: TPoint;
begin
  Msg := Socket.ReceiveText;
  // Elaboro tutti i comandi contenuti nella stringa.
  while MsgDecodifica(Msg, Comando, Parametro) do begin
    if Comando = SPOSTA_PLAYER2 then
      SpostaPlayer2(Parametro)
    else if (Comando = POS_PALLA_X) or (Comando = POS_PALLA_Y) then begin
      PosPalla := FrCampo.PosPalla;
      if Comando = POS_PALLA_X then
        PosPalla.X := Parametro
      else
        PosPalla.Y := Parametro;
      FrCampo.PosPalla := PosPalla;
    end
    else if Comando = PUNTEGGIO1 then
      StPunti1.Caption := IntToStr(Parametro)
    else if Comando = PUNTEGGIO2 then
      StPunti2.Caption := IntToStr(Parametro)
    else if Comando = FINE_GIOCO then
      FineGioco(Parametro);
  end;
end;

procedure TFmPongClient.FineGioco(Vincitore: Integer);
begin
  CsPong.Active := False;
  if Vincitore = 2 then
    ShowMessage('Fine gioco; hai perso.')
  else
    ShowMessage('Fine gioco; hai vinto.');
end;

procedure TFmPongClient.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  // In chiusura, mi disconnetto.
  CsPong.Active := False;
end;

end.
