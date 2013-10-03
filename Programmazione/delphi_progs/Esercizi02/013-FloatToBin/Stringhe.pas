unit Stringhe;

interface

uses
  SysUtils;

//  Single: 32 bit
function FloatToBin( Numero: Single ): string; overload;
//  Double: 64 bit
function FloatToBin( Numero: Double ): string; overload;
//  Extended: 80 bit
function FloatToBin( Numero: Extended ): string; overload;

implementation

// il codice delle tre funzioni è identico, cambiano solo i parametri
function FloatToBin( Numero: Single ): string;
var
  i, j: integer;
  b: byte;
begin
  result := '';
  // procedo un byte alla volta...
  for i := 0 to SizeOf( Numero ) - 1 do
  begin
    // tratto il numero come se fosse un array di byte in modo da
    // leggere direttamente il byte che mi interessa
    b := PByteArray( @Numero )[ i ];
    for j := 0 to 7 do // dal byte estraggo i bit come in BinToStr
      if b and ( 1 shl j ) = 0 then
        result := result + '0'
      else
        result := result + '1';
    // dopo ogni byte aggiungo uno spazio
    // per rendere più leggibile il risultato
    result := result + ' ';
  end;
end;

function FloatToBin( Numero: Double ): string;
var
  i, j: integer;
  b: byte;
begin
  result := '';
  for i := 0 to SizeOf( Numero ) - 1 do
  begin
    b := PByteArray( @Numero )[ i ];
    for j := 0 to 7 do
      if b and ( 1 shl j ) = 0 then
        result := result + '0'
      else
        result := result + '1';
    result := result + ' ';
  end;
end;

function FloatToBin( Numero: Extended ): string;
var
  i, j: integer;
  b: byte;
begin
  result := '';
  for i := 0 to SizeOf( Numero ) - 1 do
  begin
    b := PByteArray( @Numero )[ i ];
    for j := 0 to 7 do
      if b and ( 1 shl j ) = 0 then
        result := result + '0'
      else
        result := result + '1';
    result := result + ' ';
  end;
end;

end.
