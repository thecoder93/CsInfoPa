unit BinStr;

interface

uses
  SysUtils;

type
  TIntDigits = 1..32;
  TInt64Digits = 1..64;

// Per convertire un numero intero nella stringa di
// cifre binarie corrispondente.
// Passare in digits il numero di cifre del risultato voluto.
function IntToBin(Value: Integer; Digits: TIntDigits): string; overload;
function IntToBin(Value: Int64; Digits: TInt64Digits): string; overload;

type
  TStrDigits = string[32];

// Per convertire una stringa di cifre binarie nel
// numero intero corrispondente.
function BinToInt(Value: TStrDigits): Integer;

implementation

function IntToBin(Value: Integer; Digits: TIntDigits): string; overload;
var
  D2: TInt64Digits;
begin
  // Sfrutto la funzione a 64 bit anche per i numeri a 32 bit.
  D2 := Digits;
  Result := IntToBin(Value, D2);
end;

function IntToBin(Value: Int64; Digits: TInt64Digits): string; overload;
var
  i : integer;
  v: Int64;
begin
  result := '';
  // Per ciascuna cifra da generare...
  for i := 0 to Digits - 1 do
  begin
    v := 1;
    // Verifico con uno shift più un and
    // se deve essere 0 oppure 1.
    v := (v shl i);
    if v and value = 0 then
      result := '0' + result
    else
      result := '1' + result;
  end;
end;

// Uso interno: eleva Base a Esponente.
function IntPower(Base, Esponente: Integer): Integer;
var
  g: Integer;
begin
  Result := 1;
  for g := 1 to Esponente do
    Result := Result * Base;
end;

function BinToInt(Value: TStrDigits): Integer; overload;
var
  g, Posizione: Integer;
begin
  Result := 0;
  Posizione := 0;
  // Leggo le cifre binarie da destra a sinistra.
  for g := Length(Value) downto 1 do begin
    // Aggiungo al risultato il valore della cifra binaria moltiplicato per
    // l'ennesima potenza della base (in questo caso 2).
    Result := Result + (StrToInt(Value[g]) * IntPower(2, Posizione));
    Inc(Posizione);
  end;
  // Nota:
  // Si può risparmiare la variabile Posizione,
  // che è sempre uguale a Length(Binary) - g.
end;

end.
