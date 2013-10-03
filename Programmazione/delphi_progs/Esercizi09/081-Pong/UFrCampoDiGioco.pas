unit UFrCampoDiGioco;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  ExtCtrls;

type
  TCambioPunteggioEvent = procedure(Sender: TObject; Punteggio1,
    Punteggio2: Integer) of object;

  TFineGiocoEvent = procedure(Sender: TObject; Vincitore: Integer) of object;

  TFrCampoDiGioco = class(TFrame)
    ShPlayer1: TShape;
    ShPlayer2: TShape;
    ShMediana: TShape;
    ShPalla: TShape;
    ShMuroDx: TShape;
    ShMuroSx: TShape;
    ShFondo1: TShape;
    ShFondo2: TShape;
  private
    // 1 per destra o in basso,
    // -1 per sinistra o in alto.
    FVersoPallaX: Integer;
    FVersoPallaY: Integer;
    FOnCambioPunteggio: TCambioPunteggioEvent;
    FOnFineGioco: TFineGiocoEvent;
    // Verifica se la palla è entrata in contatto con una parete,
    // con una racchetta o col fondo del campo.
    procedure ControllaCollisioni;
    // Sposta il giocatore Player nel verso Verso.
    procedure SpostaPlayer(Player: TShape; Verso: Integer);
    // Assegna un punto al giocatore indicato; verifica se
    // la partita è terminata.
    procedure Punto(Player: TShape);
    // Riporta la palla al centro del campo e le
    // racchette in posizione iniziale.
    procedure PallaAlCentro;
    // La partita è finita.
    procedure FineGioco(Vincitore: TShape);
    // Invoca l'evento OnCambioPunteggio.
    procedure DoCambioPunteggio;
    function GetPosPalla: TPoint;
    procedure SetPosPalla(const Value: TPoint);
  public
    // Azzera i punteggi e riporta la palla al
    // centro del campo.
    procedure NuovoGioco;
    // Sposta la palla nella direzione corrente.
    procedure SpostaPalla;
    // Sposta il giocatore in alto nel verso indicato.
    procedure SpostaPlayer1(Verso: Integer);
    // Sposta il giocatore in basso nel verso indicato.
    procedure SpostaPlayer2(Verso: Integer);
    // Si verifica quando il punteggio di uno dei
    // due giocatori cambia.
    property OnCambioPunteggio: TCambioPunteggioEvent
      read FOnCambioPunteggio write FOnCambioPunteggio;
    // Su verifica al termine della partita.
    property OnFineGioco: TFineGiocoEvent
      read FOnFineGioco write FOnFineGioco;
    // Posizione corrente della palla.
    property PosPalla: TPoint read GetPosPalla write SetPosPalla;
  end;

const
  // Costanti simboliche per il verso.
  VERSO_SX = -1;
  VERSO_ALTO = VERSO_SX;
  VERSO_DX = 1;
  VERSO_BASSO = VERSO_DX;

implementation

{$R *.DFM}

const
  // Quantità di pixel di cui spostare la palla ogni volta.
  SPOSTA_PALLA_X = 12;
  SPOSTA_PALLA_Y = 8;
  // Quantità di pixel di cui spostare i giocatori ogni volta.
  SPOSTA_PLAYER = 15;
  // Con quanti punti si vince.
  MAX_PUNTEGGIO = 10;

// Restituisce True se i due controlli sono sovrapposti
// (ammesso che abbiano lo stesso Parent).
function ControlliSovrapposti(C1, C2: TControl): Boolean;
var
  Intersezione: TRect;
begin
  Result := IntersectRect(Intersezione, C1.BoundsRect, C2.BoundsRect);
end;

procedure TFrCampoDiGioco.ControllaCollisioni;
begin
  // Se la palla tocca un muro, rimbalza orizzontalmente.
  if (ControlliSovrapposti(ShPalla, ShMuroSx) and (FVersoPallaX < 0)) or
     (ControlliSovrapposti(ShPalla, ShMuroDx) and (FVersoPallaX > 0)) then
    FVersoPallaX := -FVersoPallaX
  // Se tocca una racchetta, rimbalza verticalmente.
  else if (ControlliSovrapposti(ShPalla, ShPlayer1) and (FVersoPallaY < 0)) or
          (ControlliSovrapposti(ShPalla, ShPlayer2) and (FVersoPallaY > 0)) then
    FVersoPallaY := -FVersoPallaY
  // Se tocca il fondo campo, è punto.
  else if ControlliSovrapposti(ShPalla, ShFondo1) then
    Punto(ShPlayer2)
  else if ControlliSovrapposti(ShPalla, ShFondo2) then
    Punto(ShPlayer1);
end;

procedure TFrCampoDiGioco.DoCambioPunteggio;
begin
  if Assigned(FOnCambioPunteggio) then
    FOnCambioPunteggio(Self, ShPlayer1.Tag, ShPlayer2.Tag);
end;

procedure TFrCampoDiGioco.FineGioco(Vincitore: TShape);
begin
  if Assigned(FOnFineGioco) then
    if Vincitore = ShPlayer1 then
      FOnFineGioco(Self, 1)
    else
      FOnFineGioco(Self, 2);
end;

function TFrCampoDiGioco.GetPosPalla: TPoint;
begin
  Result.X := ShPalla.Left;
  Result.Y := ShPalla.Top;
end;

procedure TFrCampoDiGioco.SetPosPalla(const Value: TPoint);
begin
  ShPalla.Left := Value.X;
  ShPalla.Top := Value.Y;
  ShPalla.Update;
end;

procedure TFrCampoDiGioco.NuovoGioco;
begin
  Randomize;
  ShPlayer1.Tag := 0;
  ShPlayer2.Tag := 0;
  DoCambioPunteggio;
  PallaAlCentro;
end;

procedure TFrCampoDiGioco.PallaAlCentro;
begin
  ShPlayer1.Left := 190;
  ShPlayer2.Left := 190;
  ShPalla.Left := 232;
  ShPalla.Top := 192;
  // La palla partirà in una direzione a caso.
  if Random(2) = 0 then
    FVersoPallaX := VERSO_DX
  else
    FVersoPallaX := VERSO_SX;
  if Random(2) = 0 then
    FVersoPallaY := VERSO_BASSO
  else
    FVersoPallaY := VERSO_ALTO;
end;

procedure TFrCampoDiGioco.Punto(Player: TShape);
begin
  Player.Tag := Player.Tag + 1;
  DoCambioPunteggio;
  if Player.Tag = MAX_PUNTEGGIO then
    FineGioco(Player)
  else
    PallaAlCentro;
end;

procedure TFrCampoDiGioco.SpostaPalla;
begin
  // Sposto la palla nella direzione corrente.
  ShPalla.Left := ShPalla.Left +
    (FVersoPallaX * SPOSTA_PALLA_X);
  ShPalla.Top := ShPalla.Top +
    (FVersoPallaY * SPOSTA_PALLA_Y);
  // Controllo se è entrata in contatto con qualcosa.
  ControllaCollisioni;
end;

procedure TFrCampoDiGioco.SpostaPlayer(Player: TShape; Verso: Integer);
var
  Spostamento: Integer;
begin
  // Sposto la racchetta.
  Spostamento := SPOSTA_PLAYER * Verso;
  Player.Left := Player.Left + Spostamento;
  // Controllo lo sconfinamento dal campo di gioco.
  if ControlliSovrapposti(Player, ShMuroSx) then
    Player.Left := ShMuroSx.Left + ShMuroSx.Width + 1
  else if ControlliSovrapposti(Player, ShMuroDx) then
    Player.Left := ShMuroDx.Left - Player.Width - 1;
end;

procedure TFrCampoDiGioco.SpostaPlayer1(Verso: Integer);
begin
  SpostaPlayer(ShPlayer1, Verso);
end;

procedure TFrCampoDiGioco.SpostaPlayer2(Verso: Integer);
begin
  SpostaPlayer(ShPlayer2, Verso);
end;

end.
