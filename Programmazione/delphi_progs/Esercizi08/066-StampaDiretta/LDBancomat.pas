unit LDBancomat;

interface

uses
  Classes, SysUtils;

type
  TTagli = (tMilleEuro, tCentoEuro, tCinquantaEuro, tVentiEuro,
    tDieciEuro, tCinqueEuro, tUnEuro, tCinquantaCentesimi,
    tVentiCentesimi, tDieciCentesimi, tCinqueCentesimi, tUnCentesimo);

  TPezzi = array[TTagli] of Integer;

  TLDBancomat = class(TObject)
  private
    FCentesimi: Integer;
    FPezzi: TPezzi;
    // Metodi di uso interno.
    function GetImporto: Double;
    procedure SetImporto(const Value: Double);
    function GetPezzi(Index: TTagli): Integer;
    procedure InizializzaPezzi;
    procedure CalcolaPezzi;
  public
    // Per immettere l'importo richiesto.
    property Importo: Double read GetImporto write SetImporto;
    // Per ottenere il denaro corrispondente all'importo.
    property Pezzi[Index: TTagli]: Integer read GetPezzi; default;
    // Una lista dettagliata dell'importo suddiviso in pezzi.
    procedure EmettiScontrino(List: TStrings);
    // Stampa lo scontrino tramite StampaLista
    procedure StampaScontrino(NuovaPagina: Boolean);
  end;

// Stampa una lista di stringhe direttamente sulla stampante,
// scavalcando il sistema di stampa di Windows. Se NuovaPagina
// è True, la pagina viene espulsa dopo la stampa.
// Se Condensato è True, la stampa avviene con un carattere più
// stretto.
procedure StampaLista(Lista: TStrings; NuovaPagina: Boolean;
  Condensato: Boolean);

implementation

var
  // Descrizioni dei tagli, per lo scontrino.
  DescrizioniTagli: array[TTagli] of string =
    ('mille Euro', 'cento Euro', 'cinquanta Euro', 'venti Euro', 'dieci Euro',
     'cinque Euro', 'un Euro', 'cinquanta centesimi', 'venti centesimi',
     'dieci centesimi', 'cinque centesimi', 'un centesimo');

  // Valori dei tagli in centesimi, per il calcolo del numero dei pezzi.
  ValoriTagli: array[TTagli] of Integer =
    (100000, 10000, 5000, 2000, 1000, 500, 100, 50, 20, 10, 5, 1);

{ Utilità }

const
  FORMFEED = #12;
  CONDENSED = #15;
  NORMAL = #18;

procedure StampaLista(Lista: TStrings; NuovaPagina: Boolean;
  Condensato: Boolean);
var
  P: TextFile;
  g: Integer;
begin
  if Assigned(Lista) then begin
    AssignFile(P, 'LPT1');
    Rewrite(P);
    try
      if Condensato then
        Writeln(P, CONDENSED);
      try
        for g := 0 to Pred(Lista.Count) do
          Writeln(P, Lista[g]);
      finally
        if Condensato then
          Writeln(P, NORMAL);
      end;
      if NuovaPagina then
        Writeln(P, FORMFEED);
    finally
      CloseFile(P);
    end;
  end;
end;

{ TLDBancomat }

// public

procedure TLDBancomat.EmettiScontrino(List: TStrings);
var
  g: TTagli;
begin
  if Assigned(List) then begin
    // Intestazione.
    List.Add('Scontrino stampato in data');
    List.Add(DateTimeToStr(Now()));
    List.Add('');
    List.Add('Importo: ' + FloatToStr(GetImporto) + ' Euro');
    List.Add('');
    List.Add('Suddivisione:');
    List.Add('');
    // Numero di pezzi per ciascun taglio (tralasciando
    // i tagli con 0 pezzi).
    for g := Low(FPezzi) to High(FPezzi) do
      if FPezzi[g] <> 0 then
        if FPezzi[g] = 1 then
          List.Add(Format('un pezzo da %s',
            [DescrizioniTagli[g]]))
        else
          List.Add(Format('%d pezzi da %s',
            [FPezzi[g], DescrizioniTagli[g]]));
  end;
end;

procedure TLDBancomat.StampaScontrino(NuovaPagina: Boolean);
var
  Scontrino: TStrings;
begin
  Scontrino := TStringList.Create;
  try
    // Sfrutto la procedura di emissione dello scontrino
    // su StringList, poi stampo la StringList.
    EmettiScontrino(Scontrino);
    StampaLista(Scontrino, NuovaPagina, True);
  finally
    Scontrino.Free;
  end;
end;

// private

function TLDBancomat.GetPezzi(Index: TTagli): Integer;
begin
  Result := FPezzi[Index];
end;

function TLDBancomat.GetImporto: Double;
begin
  Result := FCentesimi / 100;
end;

procedure TLDBancomat.SetImporto(const Value: Double);
begin
  FCentesimi := Round(Value * 100);
  CalcolaPezzi;
end;

procedure TLDBancomat.InizializzaPezzi;
var
  g: TTagli;
begin
  for g := Low(FPezzi) to High(FPezzi) do
    FPezzi[g] := 0;
end;

procedure TLDBancomat.CalcolaPezzi;
var
  g: TTagli;
  CentesimiRimasti: Integer;
begin
  InizializzaPezzi;
  CentesimiRimasti := FCentesimi;
  // Attribuisco i pezzi dal taglio maggiore al minore.
  for g := Low(FPezzi) to High(FPezzi) do begin
    FPezzi[g] := CentesimiRimasti div ValoriTagli[g];
    CentesimiRimasti := CentesimiRimasti mod ValoriTagli[g];
  end;
end;

end.
