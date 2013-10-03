unit LDMultiTimer;

interface

uses
  Windows, Classes, ExtCtrls;

type
  TLDMultiTimer = class;
  TSubTimerCollection = class;

  // Rappresenta un elemento della lista di Timer.
  TSubTimer = class(TCollectionItem)
  private
    FCollection: TSubTimerCollection;
    FEnabled: Boolean;
    FInterval: Cardinal;
    FOnTimer: TNotifyEvent;
    FLastTimerTick: LongWord;
    procedure SetEnabled(const Value: Boolean);
    procedure SetInterval(const Value: Cardinal);
    procedure SetOnTimer(const Value: TNotifyEvent);
    function GetAlive: Boolean;
  protected
    function GetDisplayName: string; override;
    property Alive: Boolean read GetAlive;
    property LastTimerTick: LongWord read FLastTimerTick write FLastTimerTick;
    procedure Timer(Moment: LongWord);
  public
    constructor Create(Collection: TCollection); override;
    procedure Assign(Source: TPersistent); override;
  published
    property Enabled: Boolean read FEnabled write SetEnabled default True;
    property Interval: Cardinal read FInterval write SetInterval default 1000;
    property OnTimer: TNotifyEvent read FOnTimer write SetOnTimer;
  end;

  // Rappresenta la lista di oggetti SubTimer.
  TSubTimerCollection = class(TCollection)
  private
    FMultiTimer: TLDMultiTimer;
    function GetItem(Index: Integer): TSubTimer;
    procedure SetItem(Index: Integer; Value: TSubTimer);
    procedure SubTimerChanged(Sender: TSubTimer);
  public
    function GetOwner: TPersistent; override;
    constructor Create(MultiTimer: TLDMultiTimer);
    function Add: TSubTimer;
    property Items[Index: Integer]: TSubTimer read GetItem write SetItem; default;
  end;

  // Il componente Timer multiplo.
  TLDMultiTimer = class(TComponent)
  private
    FSubTimers: TSubTimerCollection;
    FEnabled: Boolean;
    FMainTimer: TTimer;
    FStartTime: LongWord;
    procedure SetEnabled(const Value: Boolean);
    procedure SetSubTimers(const Value: TSubTimerCollection);
    // Chiamata ogni volta che cambia qualcosa in uno
    // degli oggetti SubTimer.
    procedure SubTimerChanged(Sender: TSubTimer);
    // Reimposta le proprietà del Timer principale.
    procedure UpdateMainTimer;
    // Calcola l'intervallo comune (il MCD) tra tutti gli oggetti
    // SubTimer attivi. Restituisce 0 se non ce ne sono.
    function CalculateMainTimerInterval: Cardinal;
    // Event handler per FMainTimer.OnTimer.
    procedure MainTimerTick(Sender: TObject);
    // Metodo che notifica un evento OnTimer a tutti
    // gli oggetti SubTimer interessati.
    procedure NotifySubTimers(Moment: LongWord);
  public
    constructor Create(AOwner: TComponent); override;
    destructor Destroy; override;
  published
    property SubTimers: TSubTimerCollection read FSubTimers write SetSubTimers;
    property Enabled: Boolean read FEnabled write SetEnabled;
  end;

procedure Register;

implementation

uses
  SysUtils;

procedure Register;
begin
  RegisterComponents('LabDelphi', [TLDMultiTimer]);
end;

{ TSubTimer }

procedure TSubTimer.Assign(Source: TPersistent);
begin
  inherited;
  if Source is TSubTimer then begin
    with TSubTimer(Source) do begin
      Self.Enabled := Enabled;
      Self.Interval := Interval;
      Self.LastTimerTick := LastTimerTick;
      Self.OnTimer := OnTimer;
    end;
  end
  else
    inherited Assign(Source);
end;

constructor TSubTimer.Create(Collection: TCollection);
begin
  inherited Create(Collection);
  FCollection := Collection as TSubTimerCollection;
  // Imposto i default.
  FEnabled := True;
  FInterval := 1000;
end;

function TSubTimer.GetAlive: Boolean;
begin
  // Il SubTimer è "vivo" solo se è abilitato, ha un
  // intervallo significativo e un handler per
  // l'evento OnTimer.
  Result := FEnabled and (FInterval > 0) and Assigned(FOnTimer);
end;

function TSubTimer.GetDisplayName: string;
begin
  // Mostro l'intervallo per distinguere un SubTimer
  // dall'altro nell'Object Inspector.
  Result := Format('Timer (%d)', [FInterval]);
end;

procedure TSubTimer.SetEnabled(const Value: Boolean);
var
  WasAlive: Boolean;
begin
  if FEnabled <> Value then begin
    WasAlive := Alive;
    FEnabled := Value;
    // Se è cambiato lo stato di attivazione del SubTimer,
    // notifico il componente "padre".
    if WasAlive <> Alive then
      FCollection.SubTimerChanged(Self);
  end;
end;

procedure TSubTimer.SetInterval(const Value: Cardinal);
var
  WasAlive: Boolean;
begin
  if FInterval <> Value then begin
    WasAlive := Alive;
    FInterval := Value;
    // Se è cambiato lo stato di attivazione del SubTimer,
    // notifico il componente "padre".
    if WasAlive <> Alive then
      FCollection.SubTimerChanged(Self);
  end;
end;

procedure TSubTimer.SetOnTimer(const Value: TNotifyEvent);
var
  WasAlive: Boolean;
begin
  WasAlive := Alive;
  FOnTimer := Value;
  // Se è cambiato lo stato di attivazione del SubTimer,
  // notifico il componente "padre".
  if WasAlive <> Alive then
    FCollection.SubTimerChanged(Self);
end;

procedure TSubTimer.Timer(Moment: LongWord);
begin
  FLastTimerTick := Moment;
  if Assigned(FOnTimer) then
    FOnTimer(Self);
end;

{ TSubTimerCollection }

function TSubTimerCollection.Add: TSubTimer;
begin
  Result := TSubTimer(inherited Add);
end;

constructor TSubTimerCollection.Create(MultiTimer: TLDMultiTimer);
begin
  // Indico la classe degli elementi da creare (TSubTimer)
  // per questa collection.
  inherited Create(TSubTimer);
  FMultiTimer := MultiTimer;
end;

function TSubTimerCollection.GetItem(Index: Integer): TSubTimer;
begin
  Result := TSubTimer(inherited GetItem(Index));
end;

function TSubTimerCollection.GetOwner: TPersistent;
begin
  Result := FMultiTimer;
end;

procedure TSubTimerCollection.SetItem(Index: Integer; Value: TSubTimer);
begin
  inherited SetItem(Index, Value);
end;

procedure TSubTimerCollection.SubTimerChanged(Sender: TSubTimer);
begin
  // Passo la notifica all'oggetto LDMultiTimer.
  FMultiTimer.SubTimerChanged(Sender);
end;

{ TLDMultiTimer }

constructor TLDMultiTimer.Create(AOwner: TComponent);
begin
  inherited;
  FSubTimers := TSubTimerCollection.Create(Self);
  FMainTimer := TTimer.Create(Self);
  FMainTimer.OnTimer := MainTimerTick;
end;

destructor TLDMultiTimer.Destroy;
begin
  FMainTimer.Free;
  FSubTimers.Free;
  inherited;
end;

procedure TLDMultiTimer.SetEnabled(const Value: Boolean);
begin
  if FEnabled <> Value then begin
    FEnabled := Value;
    UpdateMainTimer;
  end;
end;

procedure TLDMultiTimer.SetSubTimers(const Value: TSubTimerCollection);
begin
  FSubTimers.Assign(Value);
end;

procedure TLDMultiTimer.SubTimerChanged(Sender: TSubTimer);
begin
  // Ricalcolo l'intervallo e ripristino il timer.
  UpdateMainTimer;
end;

procedure TLDMultiTimer.UpdateMainTimer;
begin
  // Ricominciamo da capo.
  FStartTime := 0;
  FMainTimer.Interval := CalculateMainTimerInterval;
end;

function TLDMultiTimer.CalculateMainTimerInterval: Cardinal;

  // Calcola il valore dell'intervallo minore tra tutti i SubTimer.
  function GetMinInterval: Cardinal;
  var
    g: Integer;
  begin
    Result := High(Result);
    for g := 0 to Pred(FSubTimers.Count) do
      if FSubTimers[g].Alive and (FSubTimers[g].Interval < Result) then
        Result := FSubTimers[g].Interval;
  end;

  // Dice se il numero passato rappresenta un divisore per
  // tutti gli intervalli dei SubTimer.
  function IsDivisorForAllIntervals(Divisor: Cardinal): Boolean;
  var
    g: Integer;
  begin
    Result := True;
    for g := 0 to Pred(FSubTimers.Count) do
      if FSubTimers[g].Alive then
        if (FSubTimers[g].Interval mod Divisor) <> 0 then begin
          Result := False;
          Break;
        end;
  end;

begin
  // L'intervallo comune è il Massimo Comune Divisore degli
  // intervalli di tutti gli oggetti SubTimer "vivi".
  for Result := GetMinInterval downto 1 do begin
    if IsDivisorForAllIntervals(Result) then
      Break;
  end;
end;

procedure TLDMultiTimer.MainTimerTick(Sender: TObject);
var
  ThisMoment: LongWord;
begin
  ThisMoment := GetTickCount;
  if FStartTime = 0 then
    // Memorizzo l'ora del primo scatto.
    FStartTime := ThisMoment - FMainTimer.Interval;
  NotifySubTimers(ThisMoment);
end;

procedure TLDMultiTimer.NotifySubTimers(Moment: LongWord);
var
  g: Integer;
begin
  // Innesco l'evento OnTimer per tutti gli oggetti SubTimer
  // "vivi", purché sia passato per ciascuno un tempo
  // sufficiente dall'ultimo scatto.
  for g := 0 to Pred(FSubTimers.Count) do begin
    with FSubTimers[g] do begin
      if Alive then begin
        if LastTimerTick = 0 then begin
          // Primo scatto.
          if (Moment - FStartTime) >= Interval then
            Timer(Moment);
        end
        else begin
          // Altri scatti.
          if (Moment - LastTimerTick) >= Interval then
            Timer(Moment);
        end;
      end;
    end;
  end;
end;

end.
