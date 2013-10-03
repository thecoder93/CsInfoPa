unit PongCommon;

interface

const
  SPOSTA_PLAYER1 = 'PL1';
  SPOSTA_PLAYER2 = 'PL2';
  POS_PALLA_X = 'PALLAX';
  POS_PALLA_Y = 'PALLAY';
  PUNTEGGIO1 = 'PUNT1';
  PUNTEGGIO2 = 'PUNT2';
  FINE_GIOCO = 'FINE';

// Per codificare un messaggio da inviare.
function MsgSpostaPlayer1(Verso: Integer): string;
function MsgSpostaPlayer2(Verso: Integer): string;
function MsgPosPallaX(Posizione: Integer): string;
function MsgPosPallaY(Posizione: Integer): string;
function MsgPunteggio1(Punteggio: Integer): string;
function MsgPunteggio2(Punteggio: Integer): string;
function MsgFineGioco(Vincitore: Integer): string;

// Per decodificare una stringa di comandi ricevuta.
// Restituisce in Comando e Parametro il primo comando
// presente, e lo elimina da Msg. Se non ci sono comandi
// da estrarre, restituisce False.
function MsgDecodifica(var Msg, Comando: string;
  var Parametro: Integer): Boolean;

implementation

uses
  SysUtils, Classes;

function MsgSpostaPlayer1(Verso: Integer): string;
begin
  Result := SPOSTA_PLAYER1 + '=' + IntToStr(Verso) + #13#10;
end;

function MsgSpostaPlayer2(Verso: Integer): string;
begin
  Result := SPOSTA_PLAYER2 + '=' + IntToStr(Verso) + #13#10;
end;

function MsgPosPallaX(Posizione: Integer): string;
begin
  Result := POS_PALLA_X + '=' + IntToStr(Posizione) + #13#10;
end;

function MsgPosPallaY(Posizione: Integer): string;
begin
  Result := POS_PALLA_Y + '=' + IntToStr(Posizione) + #13#10;
end;

function MsgPunteggio1(Punteggio: Integer): string;
begin
  Result := PUNTEGGIO1 + '=' + IntToStr(Punteggio) + #13#10;
end;

function MsgPunteggio2(Punteggio: Integer): string;
begin
  Result := PUNTEGGIO2 + '=' + IntToStr(Punteggio) + #13#10;
end;

function MsgFineGioco(Vincitore: Integer): string;
begin
  Result := FINE_GIOCO + '=' + IntToStr(Vincitore) + #13#10;
end;

function MsgDecodifica(var Msg, Comando: string;
  var Parametro: Integer): Boolean;
var
  p: Integer;
  MsgList: TStrings;
begin
  // Copio la coda dei messaggi in una StringList...
  MsgList := TStringList.Create;
  try
    MsgList.Text := Msg;
    if MsgList.Count = 0 then
      Result := False
    else begin
      // ...decodifico il primo elemento...
      p := Pos('=', MsgList[0]);
      if p > 0 then begin
        Comando := Copy(MsgList[0], 1, p - 1);
        Parametro := StrToIntDef(Copy(MsgList[0], p + 1,
          Length(MsgList[0])), 0);
      end;
      // ...e lo elimino; restituisco la stringa avuta in input
      // meno il messaggio decodificato.
      MsgList.Delete(0);
      Msg := MsgList.Text;
      // Restituisco True fino a che ci sono altri messaggi
      // da elaborare.
      Result := True;
    end;
  finally
    MsgList.Free;
  end;
end;

end.
