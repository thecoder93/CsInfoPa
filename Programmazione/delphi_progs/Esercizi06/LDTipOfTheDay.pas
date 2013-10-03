unit LDTipOfTheDay;

interface

uses
  SysUtils, Classes;

type
  TLDTipOfTheDay = class(TComponent)
  private
    FTipFileName: TFileName;
    function GetNextTip: string;
  published
    property TipFileName: TFileName read FTipFileName write FTipFileName;
    property NextTip: string read GetNextTip;
  end;

procedure Register;

implementation

uses
  IniFiles;

const
  // Sezione del file INI contenente i Tip.
  TIP_SECTION = 'Tips';
  // Sezione e voce del file INI contenente l'indice.
  TIP_INDEX_SECTION = 'TipIndex';
  TIP_INDEX_IDENT = 'TipIndex';

procedure Register;
begin
  RegisterComponents('LabDelphi', [TLDTipOfTheDay]);
end;

{ TLDTipOfTheDay }

function TLDTipOfTheDay.GetNextTip: string;
var
  TipFile: TIniFile;
  Tips: TStrings;
  TipIndex: Integer;
begin
  if FTipFileName = '' then
    raise Exception.Create(
      'È necessario indicare un nome di file contenente i Tip.');
  // Apro il file INI.
  TipFile := TIniFile.Create(FTipFileName);
  try
    // Leggo l'indice corrente.
    TipIndex := TipFile.ReadInteger(TIP_INDEX_SECTION, TIP_INDEX_IDENT, 0);
    Tips := TStringList.Create;
    try
      // Carico gli identificativi della sezione Tips.
      TipFile.ReadSection(TIP_SECTION, Tips);
      // Arrivati alla fine, si ricomincia da capo.
      if TipIndex >= Tips.Count then
        TipIndex := 0;
      // Leggo e restituisco l'ennesimo Tip in lista.
      Result := TipFile.ReadString(TIP_SECTION, Tips[TipIndex], '');
      // Scrivo l'indice incrementato.
      TipFile.WriteInteger(TIP_INDEX_SECTION, TIP_INDEX_IDENT, Succ(TipIndex));
    finally
      Tips.Free;
    end;
  finally
    TipFile.Free;
  end;
end;

end.
