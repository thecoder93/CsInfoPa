unit Stringhe;

interface

uses
  SysUtils;

function StrToFloatDef( Value: string; Default: Extended ): Extended;
function StrToFloatDef2( Value: string; Default: Extended ): Extended;

implementation

function StrToFloatDef( Value: string; Default: Extended ): Extended;
begin
  try
    // prima proviamo a convertire il valore in float
    result := StrToFloat( Value );
  except
    // se qualcosa va storto restituiamo il valore di default
    result := Default;
  end;
end;

function StrToFloatDef2( Value: string; Default: Extended ): Extended;
begin
  // stessa cosa ma senza usare le eccezioni
  if not TextToFloat(PChar(Value), Result, fvExtended) then
    result := Default;
end;

end.
