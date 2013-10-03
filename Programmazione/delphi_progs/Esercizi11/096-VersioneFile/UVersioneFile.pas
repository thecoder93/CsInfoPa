unit UVersioneFile;

interface

// Estrae e restituisce la versione del file indicato.
function VersioneFile(const NomeFile: string): string;
// Restituisce True se Ver1 è precedente a Ver2.
function VersionePrecedente(const VerA, VerB: string): Boolean;
// Scompone un numero di versione nei suoi 4
// componenti.
procedure ScomponiVersione(Versione: string;
  out Major, Minor, Release, Build: Integer);

implementation

uses
  Windows, SysUtils;

function VersioneFile(const NomeFile: string): string;
var
  InfoSize, Wnd: DWORD;
  VerBuf: Pointer;
  FI: PVSFixedFileInfo;
  VerSize: DWORD;
begin
  // In caso non ci siano informazioni sulla versione...
  Result := '0.0.0.0';
  // Leggo la dimensione delle informazioni.
  InfoSize := GetFileVersionInfoSize(PChar(NomeFile), Wnd);
  if InfoSize <> 0 then begin
    // Alloco un buffer temporaneo.
    GetMem(VerBuf, InfoSize);
    try
      // Carico le informazioni
      if GetFileVersionInfo(PChar(NomeFile), Wnd, InfoSize, VerBuf) then
        if VerQueryValue(VerBuf, '\', Pointer(FI), VerSize) then
          // I numeri di versione sono memorizzati in due LongWord.
          Result := IntToStr(FI.dwFileVersionMS div $10000) + '.' +
                    IntToStr(FI.dwFileVersionMS mod $10000) + '.' +
                    IntToStr(FI.dwFileVersionLS div $10000) + '.' +
                    IntToStr(FI.dwFileVersionLS mod $10000);
    finally
      FreeMem(VerBuf);
    end;
  end;
end;

function VersionePrecedente(const VerA,
  VerB: string): Boolean;
var
  AMajor, AMinor, ARelease, ABuild: Integer;
  BMajor, BMinor, BRelease, BBuild: Integer;
begin
  ScomponiVersione(VerA, AMajor, AMinor, ARelease, ABuild);
  ScomponiVersione(VerB, BMajor, BMinor, BRelease, BBuild);
  if AMajor = BMajor then begin
    if AMinor = BMinor then begin
      if ARelease = BRelease then
        Result := ABuild < BBuild
      else
        Result := ARelease < BRelease
    end
    else
      Result := AMinor < BMinor;
  end
  else
    Result := AMajor < BMajor;
end;

procedure ScomponiVersione(Versione: string;
  out Major, Minor, Release, Build: Integer);

  function EstraiNumero(var Versione: string): Integer;
  var
    p: Integer;
  begin
    p := Pos('.', Versione);
    if p > 0 then begin
      Result :=
        StrToIntDef(Copy(Versione, 1, p - 1), 0);
      Delete(Versione, 1, p);
    end
    else
      Result := StrToIntDef(Versione, 0);
  end;

begin
  Major := EstraiNumero(Versione);
  Minor := EstraiNumero(Versione);
  Release := EstraiNumero(Versione);
  Build := EstraiNumero(Versione);
end;

end.
