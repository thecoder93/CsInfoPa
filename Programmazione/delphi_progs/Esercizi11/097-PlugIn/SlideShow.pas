unit SlideShow;

interface

uses
  Windows, Classes, ExtCtrls, Graphics, Dialogs;

type
  TEffetto = class
  private
    FOutput: TImage;
    FParametri: TStrings;
    procedure SetParametri(const Value: TStrings);
    function GetRitardo: Integer;
  protected
    procedure DisegnaTransizione(Sorgente, Destinazione: TBitmap;
      var Interruzione: Boolean); virtual; abstract;
    procedure AggiornaOutput(Bitmap: TBitmap);
    property Ritardo: Integer read GetRitardo;
  public
    constructor Create; virtual;
    destructor Destroy; override;
    property Parametri: TStrings read FParametri write SetParametri;
    procedure Disegna(const Output: TImage; var Interruzione: Boolean);
  end;

  TEffettoClass = class of TEffetto;

  TMotoreSlideShow = class(TObject)
  private
    FRegistroEffetti: TStringList;
    FTerminato: Boolean;
    FContinuo: Boolean;
    procedure CaricaPlugIn(const NomeFile: string);
  public
    constructor Create;
    destructor Destroy; override;
    // Gestione caricamento Plug-in.
    procedure CaricaTuttiPlugIn;
    // Gestione registro effetti.
    procedure RegistraEffetto(ID: string; Classe: TEffettoClass);
    procedure DeregistraEffetto(ID: string);
    function CreaEffetto(ID: string): TEffetto;
    // Gestione motore SlideShow.
    procedure AvviaSlideShow(NomeFileScript: string; Output: TImage);
    procedure TerminaSlideShow;
    property Continuo: Boolean read FContinuo write FContinuo;
  end;

implementation

uses
  SysUtils, IniFiles, Forms;

const
  SEZIONE_SLIDESHOW = 'SlideShow';

{ TMotoreSlideShow }

procedure TMotoreSlideShow.RegistraEffetto(ID: string;
  Classe: TEffettoClass);
begin
  FRegistroEffetti.AddObject(ID, TObject(Classe));
end;

procedure TMotoreSlideShow.DeregistraEffetto(ID: string);
var
  Indice: Integer;
begin
  Indice := FRegistroEffetti.IndexOf(ID);
  if Indice >= 0 then
    FRegistroEffetti.Delete(Indice);
end;

function TMotoreSlideShow.CreaEffetto(ID: string): TEffetto;
var
  Indice: Integer;
begin
  Indice := FRegistroEffetti.IndexOf(ID);
  if Indice >= 0 then
    Result := TEffettoClass(FRegistroEffetti.Objects[Indice]).Create
  else
    raise Exception.CreateFmt('L''effetto "%s" non è registrato', [ID]);
end;

procedure TMotoreSlideShow.AvviaSlideShow(NomeFileScript: string;
  Output: TImage);
var
  g: Integer;
  Ini: TIniFile;
  Passi, ParametriEffetto: TStringLIst;
  Effetto: TEffetto;
  InizioAttesa, TempoDiAttesa: LongWord;
begin
  if Assigned(Output) and FileExists(NomeFileScript) then begin
    FTerminato := False;
    Ini := nil;
    Passi := nil;
    ParametriEffetto := nil;
    try
      // Creo gli oggetti che servono.
      Ini := TIniFile.Create(NomeFileScript);
      Passi := TStringList.Create;
      ParametriEffetto := TStringList.Create;
      Ini.ReadSection(SEZIONE_SLIDESHOW, Passi);
      repeat
        // Per ogni passo.
        for g := 0 to Pred(Passi.Count) do begin
          // Leggo i parametri.
          Ini.ReadSectionValues(
            Ini.ReadString(SEZIONE_SLIDESHOW, Passi[g], ''),
            ParametriEffetto);
          // Creo l'effetto.
          Effetto := CreaEffetto(ParametriEffetto.Values['NomeEffetto']);
          try
            // Attivo l'effetto.
            Effetto.Parametri := ParametriEffetto;
            Effetto.Disegna(Output, FTerminato);
            // Aspetto il tempo specificato prima di proseguire.
            InizioAttesa := GetTickCount();
            TempoDiAttesa := StrToInt(ParametriEffetto.Values['Tempo']);
            while GetTickCount() - InizioAttesa < TempoDiAttesa do begin
              if FTerminato then
                Exit;
              Application.ProcessMessages;
            end;
          finally
            Effetto.Free;
          end;
        end;
      until not FContinuo;
    finally
      Ini.Free;
      Passi.Free;
      ParametriEffetto.Free;
    end;
  end;
end;

procedure TMotoreSlideShow.TerminaSlideShow;
begin
  FTerminato := True;
end;

procedure TMotoreSlideShow.CaricaTuttiPlugIn;
var
  SR: TSearchRec;
begin
  // Cerco tutte le DLL della cartella.
  if FindFirst(ExtractFilePath(Application.ExeName) +
     '*.dll', faAnyFile, SR) = 0 then begin
    try
      repeat
        // Tento di caricare come Plug-in
        // tutte le DLL che trovo.
        CaricaPlugIn(SR.Name);
      until FindNext(SR) <> 0;
    finally
      // Libero le risorse impegnate.
      FindClose(SR);
    end;
  end;
end;

procedure TMotoreSlideShow.CaricaPlugIn(const NomeFile: string);
var
  LibHandle: Integer;
  RegistraEffetti: procedure(Motore: TMotoreSlideShow);
begin
  // Carico la libreria.
  LibHandle := LoadLibrary(PChar(NomeFile));
  if LibHandle <> 0 then begin
    // Cerco la funzione di registrazione
    // (se la DLL non è un Plug-in, non ce l'ha).
    @RegistraEffetti :=
      GetProcAddress(LibHandle, 'RegistraEffetti');
    // Se la funzione esiste, la chiamo passando
    // l'oggetto TMotoreSlideShow (Self) di cui
    // essa chiamerà il metodo RegistraEffetto.
    if Assigned(RegistraEffetti) then
      RegistraEffetti(Self);
  end;
end;

constructor TMotoreSlideShow.Create;
begin
  FRegistroEffetti := TStringList.Create;
  // Non ammetto nomi duplicati nel registro.
  FRegistroEffetti.Sorted := True;
  FRegistroEffetti.Duplicates := dupError;
  // Carico tutti i Plug-in.
  CaricaTuttiPlugIn;
end;

destructor TMotoreSlideShow.Destroy;
begin
  FRegistroEffetti.Free;
  inherited;
end;

{ TEffetto }

procedure TEffetto.AggiornaOutput(Bitmap: TBitmap);
begin
  FOutput.Picture.Assign(Bitmap);
  FOutput.Update;
  Sleep(Ritardo);
  // Per recepire una richiesta di interruzione.
  Application.ProcessMessages;
end;

constructor TEffetto.Create;
begin
  inherited Create;
  FParametri := TStringList.Create;
end;

destructor TEffetto.Destroy;
begin
  FParametri.Free;
  inherited;
end;

procedure TEffetto.Disegna(const Output: TImage; var Interruzione: Boolean);
var
  Sorgente, Destinazione: TBitmap;
begin
  FOutput := Output;
  Sorgente := TBitmap.Create;
  try
    Destinazione := TBitmap.Create;
    try
      Destinazione.Assign(Output.Picture.Bitmap);
      Sorgente.LoadFromFile(FParametri.Values['NomeImmagine']);
      // Perché i colori delle due palette siano corretti
      // in caso di immagini a bassa profondità di colore.
      Sorgente.PixelFormat := pf24bit;
      DisegnaTransizione(Sorgente, Destinazione, Interruzione);
    finally
      Destinazione.Free;
    end;
  finally
    Sorgente.Free;
  end;
end;

function TEffetto.GetRitardo: Integer;
begin
  Result := StrToIntDef(FParametri.Values['Ritardo'], 0);
end;

procedure TEffetto.SetParametri(const Value: TStrings);
begin
  FParametri.Assign(Value);
end;

end.
