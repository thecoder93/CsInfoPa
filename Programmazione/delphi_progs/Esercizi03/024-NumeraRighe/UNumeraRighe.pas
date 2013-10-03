unit UNumeraRighe;

interface

uses
  SysUtils, Classes;

function ElaboraRighe(const NomeFileOrig: string;
  NomeFileDest: string = ''): boolean;

implementation

// funzione per numerare tutte le righe di un file di testo
// se è specificato il secondo parametro salva il risultato su
// un secondo file di testo, altrimenti direttamente sul primo

function ElaboraRighe(const NomeFileOrig: string;
  NomeFileDest: string = ''): boolean;
var
  Testo: TStringList;
  i: integer;
begin
  // poniamo il nome del secondo file di testo uguale
  // al primo se non specificato
  if NomeFileDest = '' then
    NomeFileDest := NomeFileOrig;

  // risultato a true salvo eccezioni
  result := true;
  try
    // carichiamo il testo in una StringList per gestirlo meglio
    Testo := TStringList.Create;
    try
      Testo.LoadFromFile( NomeFileOrig );
      // poniamo il numero davanti ad ogni riga,
      // allineato a destra con zeri
      for i := 0 to Testo.Count - 1 do
        Testo[ i ] := Format( '%5.5d %s', [ i + 1, Testo[ i ] ] );
      // salviamo il file numerato
      Testo.SaveToFile( NomeFileDest );
    finally
      // distruggiamo la StringList alla fine dell'operazione
      Testo.Free;
    end;
  except
    // se qualcosa è andato storto restituiamo false
    result := false;
  end;
end;

end.
