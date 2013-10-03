unit UNumeraRighe;

interface

uses
  SysUtils, Classes;

// definiamo il tipo di operazione
type
  TModoNumeri = ( mdAgg, mdTogli, mdSost );

function ElaboraRighe( const NomeFileOrig: string;
  NomeFileDest: string = ''; Inizio: integer = 1;
  Modo: TModoNumeri = mdSost): boolean;

implementation

function ElaboraRighe( const NomeFileOrig: string;
  NomeFileDest: string = ''; Inizio: integer = 1;
  Modo: TModoNumeri = mdSost): boolean;
var
  Testo: TStringList;
  i, PrevNum: integer;
  Riga: string;
begin
  if NomeFileDest = '' then
    NomeFileDest := NomeFileOrig;
  result := true;
  try
    Testo := TStringList.Create;
    try
      Testo.LoadFromFile( NomeFileOrig );
      for i := 0 to Testo.Count - 1 do begin
        // carichiamo la riga
        Riga := Testo[ i ];
        // controlliamo se è già numerata
        PrevNum := StrToIntDef( Copy( Riga, 1, 5 ), 0 );
        // se è necessario togliamo il numero inziale
        if ( PrevNum > 0 ) and ( Modo in [ mdSost, mdTogli ] ) then
          Riga := Copy( Riga, 7, Length( Riga ) );
        // se viene richiesto aggiungiamo il nuovo numero davanti
        if Modo in [ mdSost, mdAgg ] then
          Riga := Format( '%5.5d %s', [ i + Inizio, Riga ] );
        // rimettiamo la riga nel testo
        Testo[ i ] := Riga;
      end;
      Testo.SaveToFile( NomeFileDest );
    finally
      Testo.Free;
    end;
  except
    result := false;
  end;
end;

end.
