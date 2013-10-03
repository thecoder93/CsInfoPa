unit Stringhe;

interface

uses
  SysUtils;

// trasforma un valore booleano in una stringa "Vero" o "Falso"
function BoolToStr( Value: boolean ): string;

// restituisce una stringa formata dai primi n caratteri della stringa data
function StrLeft( const Stringa: string; Caratteri: integer ): string;

// restituisce una stringa formata dagli ultimi n caratteri della stringa data
function StrRight( const Stringa: string; Caratteri: integer ): string;

// restituisce una stringa formata da n caratteri a partire dalla posizione
// specificata della stringa data. Se il parametro viene omesso restituisce
// il resto della stringa a partire dalla stessa posizione.
function StrMid( const Stringa: string; Posizione: integer;
  Caratteri: integer = -1 ): string;

// restituisce una stringa a caso tra quelle passate
function RandomStr( InputArray: array of string ): string;

implementation

function BoolToStr( Value: boolean ): string;
begin
  if Value then
    result := 'Vero'
  else
    result := 'Falso';
end;

function StrLeft( const Stringa: string; Caratteri: integer ): string;
begin
  // copio i caratteri a partire dal primo
  result := Copy( Stringa, 1, Caratteri );
end;

function StrRight( const Stringa: string; Caratteri: integer ): string;
begin
  // uso StrMid senza passare l'ultimo parametro
  result := StrMid( Stringa, Length( Stringa ) - Caratteri + 1 );
end;

function StrMid( const Stringa: string; Posizione: integer; Caratteri: integer = -1 ): string;
begin
  // nel caso di default (Caratteri = -1) prendo tutti i caratteri
  // della stringa a partire dalla posizione indicata
  if Caratteri < 0 then
    Caratteri := Length( Stringa ) - Posizione + 1;
  // prendo n Caratteri a partire da Posizione
  result := Copy( Stringa, Posizione, Caratteri );
end;

function RandomStr( InputArray: array of string ): string;
begin
  // dato che High restituisce l'indice dell'ultimo elemento dell'array,
  // devo incrementarlo di uno per usare Random, che restituisce un numero
  // casuale tra zero e il suo argomento meno uno
  Result := InputArray[ Random( Succ( High( InputArray ) ) ) ];
end;

end.
