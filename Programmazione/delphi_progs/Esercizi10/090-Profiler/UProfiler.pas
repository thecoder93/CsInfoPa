unit UProfiler;

interface

uses
  Windows, Messages, SysUtils, Classes, Contnrs;

type

// classe che incapsula una misurazione
  TMisurazione = class
  private
    FCommento: string;
    FCrono: Int64;
  public
    constructor Create( const UnCommento: string = '' );
    property Commento: string read FCommento;
    property Crono: Int64 read FCrono;
  end;

// classe per gestire tutte le misurazioni
  TProfiler = class
  private
    FMisurazioni: TObjectList;
    FIniziato: boolean;
    FFreq: Int64;
  public
    constructor Create;
    destructor Destroy; override;
    procedure Inizia;
    procedure Misura( const Commento: string = '' );
    procedure Finisci;
    procedure Rapporto( Linee: TStrings );
    property Freq: Int64 read FFreq;
  end;

var
  Profiler: TProfiler;

implementation

{ TMisurazione }

constructor TMisurazione.Create(const UnCommento: string='');
begin
// memorizzo il commento
  FCommento := UnCommento;
// memorizzo il tempo trascorso
  QueryPerformanceCounter( FCrono );
end;

{ TProfiler }

constructor TProfiler.Create;
begin
// creo la lista di oggetti dove metterò
// tutte le misurazioni
  FMisurazioni := TObjectList.Create( true );
// inizializzo il flag per indicare che
// non c'è una misurazione in corso
  FIniziato := False;
end;

destructor TProfiler.Destroy;
begin
// distruggo la lista
  FMisurazioni.Free;
  inherited;
end;

procedure TProfiler.Inizia;
begin
// controllo che il processore sia adatto e memorizzo
// la precisione dei rilevamenti
  if not QueryPerformanceFrequency( FFreq ) then
    raise Exception.Create( 'Funzione non supportata' );
// ripulisco la lista
  FMisurazioni.Clear;
// imposto il flag
  FIniziato := True;
// aggiungo la prima misurazione
  Misura( 'Inizio' );
end;

procedure TProfiler.Finisci;
begin
// aggiungo l'ultima misurazione
  Misura( 'Fine' );
// reinizializzo il flag
  FIniziato := False;
end;

procedure TProfiler.Misura(const Commento: string = '');
begin
// se il flag non è impostato, sollevo un'eccezione...
  if not FIniziato then
    raise Exception.Create( 'Misurazioni non iniziate' )
  else
  // ...altrimenti aggiungo una misurazione col commento
    FMisurazioni.Add( TMisurazione.Create( Commento ) );
end;

procedure TProfiler.Rapporto(Linee: TStrings);
var
  inizio, ultimo, corrente: Int64;
  i: integer;
  s: string;
begin
// se il flag è impostato, sollevo un'eccezione...
  if FIniziato then
    raise Exception.Create( 'Misurazioni non finite' );
  if Assigned(Linee) then begin
  // aggiungo la frequenza...
    Linee.Add( Format('La frequenza è di %d unità al secondo',
      [Freq] ) );
  // ...e le singole misurazioni
    if FMisurazioni.Count = 0 then
      Linee.Add( 'Nessuna misurazione')
    else begin
    // memorizzo l'inizio delle misurazioni
      inizio := (FMisurazioni[ 0 ] as TMisurazione).Crono;
      ultimo := inizio;
      for i := 0 to FMisurazioni.Count - 1 do begin
      // prendo il tempo della misurazione corrente
        corrente := (FMisurazioni[ i ] as TMisurazione).Crono;
      // scrivo il numero della misurazione...
        s := IntToStr( i );
      // ...il tempo passato dalla precedente in unità...
        s := s + '   ' + IntToStr( corrente - ultimo );
      // ...e in secondi...
        s := s + '   ' + FloatToStr( ( corrente - ultimo ) / Freq );
      // ...più l'eventuale commento memorizzato
        s := s + '   ' +
          (FMisurazioni[ i ] as TMisurazione).Commento;
        Linee.Add( s );
        ultimo := corrente;
      end;
    // aggiungo il tempo complessivo in secondi
      s := 'Tempo complessivo in secondi: ';
      s := s + FloatToStr( (ultimo - inizio) / Freq );
      Linee.Add( s );
    end;
  end;
end;

initialization
// creo l'istanza globale
  Profiler := TProfiler.Create;

finalization
// distruggo l'istanza globale
  Profiler.Free;

end.
