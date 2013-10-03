unit LDModuleList;

interface

uses
  Classes, SysUtils, Contnrs, Windows, TLHelp32, PsAPI;

type
  TLDModuleListKind = (lkToolHelp32, lkPSAPI);

  TLDModule = class
  private
    FBaseName: string;
    FFullPath: string;
    FLastModified: TDateTime;
    FSize: LongWord;
    FID: Longword;
  public
    // Informazioni sul modulo.
    // Identificativo univoco.
    property ID: Longword read FID write FID;
    // Nome.
    property BaseName: string read FBaseName write FBaseName;
    // Nome del file completo di percorso.
    property FullPath: string read FFullPath write FFullPath;
    // Data di ultima modifica del file.
    property LastModified: TDateTime read FLastModified write FLastModified;
    // Dimensione.
    property Size: LongWord read FSize write FSize;
    // Output.
    procedure AddToStrings(Strings: TStrings);
  end;

  ELDModuleListError = class(Exception);

  TLDModuleList = class
  private
    FActive: Boolean;
    FModules: TObjectList;
    function GetModules(Index: Integer): TLDModule;
    procedure SetActive(const Value: Boolean);
    function GetModuleCount: Integer;
  protected
    // Restituisce lo stesso valore passato.
    function AddModule(Value: TLDModule): TLDModule;
    procedure LoadModuleList; virtual; abstract;
    procedure Error(Msg: string);
  public
    constructor Create;
    destructor Destroy; override;
    property Active: Boolean read FActive write SetActive;
    property Modules[Index: Integer]: TLDModule read GetModules; default;
    property ModuleCount: Integer read GetModuleCount;
  end;

function CreateModuleList(Kind: TLDModuleListKind): TLDModuleList;

implementation

resourcestring
  msgCantCreateModuleList = 'Impossibile creare elenco dei moduli caricati.';

{ Classi interne }

type
  TTH32ModuleList = class(TLDModuleList)
  private
    procedure MapModuleEntryToModuleObject(Entry: TModuleEntry32;
      Obj: TLDModule);
  protected
    procedure LoadModuleList; override;
  end;

  TPSAPIModuleList = class(TLDModuleList)
  private
    procedure MapModuleHandleToModuleObject(Process: THandle; Module: HMODULE;
      Obj: TLDModule);
  protected
    procedure LoadModuleList; override;
  end;

function CreateModuleList(Kind: TLDModuleListKind): TLDModuleList;
begin
  if Kind = lkPSAPI then
    Result := TPSAPIModuleList.Create
  else
    Result := TTH32ModuleList.Create;
  Result.Active := True;
end;

{ TLDModule }

procedure TLDModule.AddToStrings(Strings: TStrings);
begin
  if Assigned(Strings) then begin
    Strings.Add('ID=' + IntToStr(FID));
    Strings.Add('BaseName=' + FBaseName);
    Strings.Add('FullPath=' + FFullPath);
    Strings.Add('LastModified=' + DateTimeToStr(FLastModified));
    Strings.Add('Size=' + IntToStr(FSize));
  end;
end;

{ TLDModuleList }

function TLDModuleList.AddModule(Value: TLDModule): TLDModule;
begin
  FModules.Add(Value);
  Result := Value;
end;

constructor TLDModuleList.Create;
begin
  inherited Create;
  FModules := TObjectList.Create;
  // E' il default, ma è più chiaro esplicitarlo.
  FModules.OwnsObjects := True;
end;

destructor TLDModuleList.Destroy;
begin
  // La ObjectList distrugge automaticamente tutti gli oggetti che contiene.
  FModules.Free;
  inherited;
end;

procedure TLDModuleList.Error(Msg: string);
begin
  raise ELDModuleListError.Create(Msg);
end;

function TLDModuleList.GetModuleCount: Integer;
begin
  Result := FModules.Count;
end;

function TLDModuleList.GetModules(Index: Integer): TLDModule;
begin
  Result := TLDModule(FModules[Index]);
end;

procedure TLDModuleList.SetActive(const Value: Boolean);
begin
  if FActive <> Value then begin
    FActive := Value;
    FModules.Clear;
    if FActive then
      LoadModuleList;
  end;
end;

{ TTH32ModuleList - utilizza la API ToolHelp32 }

procedure TTH32ModuleList.MapModuleEntryToModuleObject(Entry: TModuleEntry32;
  Obj: TLDModule);
begin
  // Copio una struttura TModuleEntry32 in un oggetto TLDModule.
  with Obj, Entry do begin
    ID := th32ModuleID;
    BaseName := szModule;
    FullPath := szExePath;
    LastModified := FileDateToDateTime(FileAge(FullPath));
    Size := modBaseSize;
  end;
end;

procedure TTH32ModuleList.LoadModuleList;
var
  hSnapShot: THandle;
  CurMod: TModuleEntry32;
  Continue: Boolean;
begin
  // Ottengo un elenco dei moduli caricati.
  // Il secondo parametro a 0 indica il processo corrente.
  hSnapShot := CreateToolhelp32Snapshot(TH32CS_SNAPModule, 0);
  if hSnapShot <= 0 then
    Error(msgCantCreateModuleList);
  try
    // La struttura va sempre inizializzata.
    CurMod.dwSize := SizeOf(CurMod);
    // Converto ciascuna entry in un oggetto TLDModule e lo
    // aggiungo alla lista.
    Continue := Module32First(hSnapShot, CurMod);
    MapModuleEntryToModuleObject(CurMod, AddModule(TLDModule.Create));
    while Continue do begin
      Continue := Module32Next(hSnapShot, CurMod);
      if Continue then
        MapModuleEntryToModuleObject(CurMod, AddModule(TLDModule.Create));
    end;
  finally
    CloseHandle(hSnapShot);
  end;
end;

{ TPSAPIModuleList - utilizza la PSAPI (disponibile solo su WinNT/2000) }

procedure TPSAPIModuleList.MapModuleHandleToModuleObject(Process: THandle;
  Module: HMODULE; Obj: TLDModule);
var
  CurModName: array[0..MAX_PATH] of char;
  CurModInfo: TModuleInfo;
begin
  // Copio i dati di un HMODULE in un oggetto TLDModule.
  with Obj do begin
    // Identificativo del modulo.
    ID := Module;
    // Uso il buffer CurModName prima per il nome del modulo...
    FillChar(CurModName, SizeOf(CurModName), #0);
    if GetModuleBaseName(Process, Module, CurModName, SizeOf(CurModName)) <> 0 then
      BaseName := CurModName;
    // ...e poi per il nome completo di percorso.
    FillChar(CurModName, SizeOf(CurModName), #0);
    if GetModuleFileNameEx(Process, Module, CurModName, SizeOf(CurModName)) <> 0 then
      FullPath := CurModName;
    LastModified := FileDateToDateTime(FileAge(FullPath));
    FillChar(CurModInfo, SizeOf(CurModInfo), #0);
    if GetModuleInformation(Process, Module, @CurModInfo, SizeOf(CurModInfo)) then
      Size := CurModInfo.SizeOfImage;
  end;
end;

procedure TPSAPIModuleList.LoadModuleList;
var
  MyProcess: THandle;
  ModList: array[1..1024] of HMODULE;
  Needed: DWORD;
  g: Integer;
begin
  MyProcess := GetCurrentProcess();
  // Ottengo in un buffer l'elenco degli handle dei moduli caricati
  // dal processo corrente, e aggiungo alla lista gli oggetti TLDModule
  // corrispondenti.
  if EnumProcessModules(MyProcess, @ModList, SizeOf(ModList), Needed) then
    for g := 1 to (Needed div SizeOf(HMODULE)) do
      MapModuleHandleToModuleObject(MyProcess, ModList[g], AddModule(TLDModule.Create))
  else
    Error(msgCantCreateModuleList);
end;

end.

