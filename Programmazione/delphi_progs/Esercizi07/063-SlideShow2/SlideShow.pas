unit SlideShow;

interface

uses
  Windows, Classes, ExtCtrls, Graphics;

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
    procedure Disegna(Output: TImage; var Interruzione: Boolean);
  end;

  TEffettoClass = class of TEffetto;

  TMotoreSlideShow = class(TObject)
  private
    FTerminato: Boolean;
    FContinuo: Boolean;
  public
    // Gestione registro effetti.
    class procedure RegistraEffetto(ID: string; Classe: TEffettoClass);
    class procedure DeregistraEffetto(ID: string);
    class function CreaEffetto(ID: string): TEffetto;
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

var
  RegistroEffetti: TStringList;

{ TMotoreSlideShow }

class procedure TMotoreSlideShow.RegistraEffetto(ID: string;
  Classe: TEffettoClass);
begin
  RegistroEffetti.AddObject(ID, TObject(Classe));
end;

class procedure TMotoreSlideShow.DeregistraEffetto(ID: string);
var
  Indice: Integer;
begin
  Indice := RegistroEffetti.IndexOf(ID);
  if Indice >= 0 then
    RegistroEffetti.Delete(Indice);
end;

class function TMotoreSlideShow.CreaEffetto(ID: string): TEffetto;
var
  Indice: Integer;
begin
  Indice := RegistroEffetti.IndexOf(ID);
  if Indice >= 0 then
    Result := TEffettoClass(RegistroEffetti.Objects[Indice]).Create
  else
    raise Exception.CreateFmt('L''effetto "%s" non è registrato', [ID]);
end;

procedure TMotoreSlideShow.AvviaSlideShow(NomeFileScript: string;
  Output: TImage);
var
  g: Integer;
  Ini: TIniFile;
  Passi, ParametriEffetto: TStrings;
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

procedure TEffetto.Disegna(Output: TImage; var Interruzione: Boolean);
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

initialization
  RegistroEffetti := TStringList.Create;
  // Non ammetto nomi duplicati nel registro.
  RegistroEffetti.Sorted := True;
  RegistroEffetti.Duplicates := dupError;

finalization
  RegistroEffetti.Free;

end.
