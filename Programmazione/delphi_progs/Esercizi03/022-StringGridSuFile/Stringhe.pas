unit Stringhe;

interface

uses
  SysUtils, Grids;

procedure SalvaGridSuFile( const Grid: TStringGrid;
  const NomeFile: string; Separatore: string = #9 );
procedure CaricaGridDaFile( const Grid: TStringGrid;
  const NomeFile: string; Separatore: string = #9 );
function SeparaStringa(const DaSeparare, Separatore: string;
  out Separata: string ): string; // restituisce la stringa rimanente

implementation

procedure SalvaGridSuFile( const Grid: TStringGrid;
  const NomeFile: string; Separatore: string = #9 );
var
  riga, col: integer;
  NuovoFile: TextFile;
begin
  // salva una griglia su file usando la stringa specificata
  // per separare i valori delle celle

  // apriamo il file da scrivere
  AssignFile(NuovoFile, NomeFile);
  // ci assicuriamo di chiudere comunque il file con un try-finally
  try
    Rewrite(NuovoFile);
    for riga := 0 to Grid.RowCount - 1 do begin
      // per ogni riga della griglia
      for col := 0 to Grid.ColCount - 1 do begin
        // e per ogni colonna della riga
        if col > 0 then // tranne che nella prima colonna...
          Write( NuovoFile, Separatore ); // mettiamo il separatore...
        // e scriviamo il valore della cella
        Write( NuovoFile, Grid.Cells[ col, riga ] );
      end;
      Writeln( NuovoFile, '' ); // chiudiamo la riga
    end;
  finally
    // alla fine chiudiamo il file
    CloseFile( NuovoFile );
  end;
end;

procedure CaricaGridDaFile( const Grid: TStringGrid;
  const NomeFile: string; Separatore: string = #9 );
var
  col: integer;
  NuovoFile: TextFile;
  linea, cella: string;
begin
  // carica una griglia da file usando la stringa
  // specificata per separare i valori delle celle

  // apriamo il file da leggere
  AssignFile( NuovoFile, NomeFile );
  // ci assicuriamo di chiudere comunque il file con un try-finally
  try
    Reset( NuovoFile );
    // lasciamo solo la riga iniziale alla griglia
    Grid.RowCount := 1;
    while not Eof( NuovoFile ) do
    begin
      // leggiamo una riga alla volta tutto il file
      ReadLn( NuovoFile, linea );
      for col := 0 to Grid.ColCount - 1 do
      begin
        // estraiamo un valore alla volta dalla riga del file
        linea := SeparaStringa( linea, Separatore, cella );
        // assegniamo il valore alla cella
        Grid.Cells[ col, Grid.RowCount - 1 ] := cella;
      end;
      // aggiungiamo la prossima riga
      Grid.RowCount := Grid.RowCount + 1;
    end;
    // togliamo l'ultima riga non utilizzata
    Grid.RowCount := Grid.RowCount - 1;
  finally
    // chiudiamo il file
    CloseFile( NuovoFile );
  end;
end;

function SeparaStringa(const DaSeparare, Separatore: string;
  out Separata: string ): string;
var
  p: integer;
begin
  // funzione per estrarre un valore alla volta da una riga
  // i valori sono separati dal carattere separatore specificato
  // la funzione restituisce la stringa rimanente

  p := Pos( Separatore, DaSeparare );
  if p = 0 then begin
    // se non ci sono più separatori restituiamo la stringa restante
    Separata := DaSeparare;
    result := '';
    end
  else begin
    // altrimenti estraiamo la nostra stringa e
    // restituiamo il resto senza separatore
    Separata := copy( DaSeparare, 1, p - 1 );
    result := copy( DaSeparare, p + 1, Length( DaSeparare ) - p );
  end;
end;

end.
