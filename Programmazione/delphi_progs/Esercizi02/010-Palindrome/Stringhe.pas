unit Stringhe;

interface

uses
  SysUtils;

// Le funzioni vanno dichiarate nella parte interface per essere usate
// da altre unit. Dato che la funzione non modifica la parola passata,
// si può dichiarare quest'ultima come const.
function Palindroma( const Parola: string ): boolean;

implementation

function Palindroma( const Parola: string ): boolean;
var
  i, lun: integer;
begin
  // pongo il risultato a false
  result := false;
  // prendo la lunghezza della stringa
  lun := Length( Parola );
  // scorro la prima metà delle lettere (approssimata per difetto)
  for i := 1 to lun div 2 do
    if Parola[ i ] <> Parola[ lun - i + 1 ] then
      exit; // se la lettera non corrisponde esco
  result := true; // se non sono uscito la parola è palindroma
end;

end.
