unit UFmMain;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, ExtCtrls, Buttons;

type
  TFmMain = class(TForm)
    PnParametri: TPanel;
    PnGriglia: TPanel;
    EtLarghezza: TEdit;
    Label1: TLabel;
    Label2: TLabel;
    EtAltezza: TEdit;
    StPunteggio: TLabel;
    SbInizia: TButton;
    procedure SbIniziaClick(Sender: TObject);
  private
    FCellaCorrente: TBitBtn;
    function GetPunteggio: Integer;
    procedure SetPunteggio(const Value: Integer);
    procedure SetCellaCorrente(const Value: TBitBtn);
    procedure CellaClick(Sender: TObject);
  public
    property Punteggio: Integer read GetPunteggio write SetPunteggio;
    property CellaCorrente: TBitBtn read FCellaCorrente write SetCellaCorrente;
    procedure EliminaGriglia;
    procedure CreaGriglia(Larghezza, Altezza: Integer);
    procedure MescolaGriglia;
    procedure CominciaGioco;
    procedure VerificaFineGioco;
  public
  end;

var
  FmMain: TFmMain;

implementation

{$R *.DFM}

{ TFmMain }

procedure TFmMain.SbIniziaClick(Sender: TObject);
var
  Larghezza, Altezza: Integer;

  function LeggiParametro(Edit: TEdit): Integer;
  begin
    Result := StrToIntDef(Edit.Text, 0);
    if (Result <= 1) or (Result > 10) then begin
      Edit.SetFocus;
      raise Exception.Create('Valore non ammesso; è possibile ' +
        'indicare solo numeri compresi tra 2 e 10.');
    end;
  end;

begin
  // Acquisisco i parametri e ne verifico la validità.
  Larghezza := LeggiParametro(EtLarghezza);
  Altezza := LeggiParametro(EtAltezza);
  if ((Larghezza * Altezza) mod 2) <> 0 then begin
    EtLarghezza.SetFocus;
    raise Exception.Create('Il numero delle celle deve essere pari.');
  end;
  // Elimino una griglia eventualmente già creata.
  EliminaGriglia;
  // Creo una nuova griglia...
  CreaGriglia(Larghezza, Altezza);
  // ...e comincio il gioco.
  CominciaGioco;
end;

procedure TFmMain.CreaGriglia(Larghezza, Altezza: Integer);
var
  x, y: Integer;
  AltezzaCelle, LarghezzaCelle: Integer;
  TagCorrente: Integer;
begin
  // Determino la dimensione delle celle da creare.
  AltezzaCelle := PnGriglia.ClientHeight div Altezza;
  LarghezzaCelle := PnGriglia.ClientWidth div Larghezza;
  TagCorrente := 1;
  // Creo la griglia di celle.
  for y := 0 to Pred(Altezza) do
    for x := 0 to Pred(Larghezza) do begin
      with TBitBtn.Create(Self) do begin
        SetBounds(x * LarghezzaCelle, y * AltezzaCelle,
          LarghezzaCelle - 2, AltezzaCelle - 2);
        Parent := PnGriglia;
        Inc(TagCorrente);
        // Uso il Tag per memorizzare il valore della cella.
        Tag := TagCorrente div 2;
        // Uso lo stesso font usato per il punteggio.
        Font := StPunteggio.Font;
        Caption := '*';
        OnClick := CellaClick;
      end;
    end;
  // Ho impostato i Tag in ordine; ora li mescolo
  MescolaGriglia;
end;

// Event handler per il click sulle celle.
procedure TFmMain.CellaClick(Sender: TObject);
begin
  if CellaCorrente <> Sender then begin
    if CellaCorrente = nil then begin
      // Primo click.
      CellaCorrente := Sender as TBitBtn;
    end
    else begin
      // Secondo click.
      with Sender as TBitBtn do begin
        if Tag = CellaCorrente.Tag then begin
          // Ho trovato una coppia: faccio sparire i due
          // pulsanti che la costituiscono...
          CellaCorrente.Hide;
          CellaCorrente := nil;
          Hide;
        end
        else
          // Non ho trovato la coppia; proseguo.
          CellaCorrente := Sender as TBitBtn;
      end;
    end;
    // In ogni caso il punteggio aumenta.
    Punteggio := Punteggio + 1;
    VerificaFineGioco;
  end;
end;

procedure TFmMain.SetCellaCorrente(const Value: TBitBtn);
begin
  if FCellaCorrente <> Value then begin
    // Nascondo il valore della precedente cella corrente.
    if Assigned(FCellaCorrente) then begin
      FCellaCorrente.Font.Color := clBlue;
      FCellaCorrente.Caption := '*';
    end;
    FCellaCorrente := Value;
    // Mostro il valore della cella corrente.
    if Assigned(CellaCorrente) then begin
      FCellaCorrente.Font.Color := clYellow;
      FCellaCorrente.Caption := IntToStr(FCellaCorrente.Tag);
    end;
  end;
end;

// Il punteggio è memorizzato direttamente nella Label StPunteggio.

function TFmMain.GetPunteggio: Integer;
begin
  Result := StrToInt(StPunteggio.Caption);
end;

procedure TFmMain.SetPunteggio(const Value: Integer);
begin
  StPunteggio.Caption := IntToStr(Value);
end;

procedure TFmMain.CominciaGioco;
begin
  Punteggio := 0;
  CellaCorrente := nil;
end;

procedure TFmMain.EliminaGriglia;
var
  g: Integer;
begin
  // Assumo che tutto ciò che si trova su PnGriglia
  // sia da eliminare.
  for g := Pred(PnGriglia.ControlCount) downto 0 do
    PnGriglia.Controls[g].Free;
end;

procedure TFmMain.MescolaGriglia;
var
  g: Integer;
  UltimaCella: Integer;

  procedure ScambiaTag(C1, C2: TComponent);
  var
    C3: Integer;
  begin
    C3 := C1.Tag;
    C1.Tag := C2.Tag;
    C2.Tag := C3;
  end;

begin
  UltimaCella := Pred(PnGriglia.ControlCount);
  Randomize;
  // Effettuo 1000 scambi casuali tra i tag dei pulsanti della griglia.
  for g := 1 to 1000 do
    with PnGriglia do
      ScambiaTag(Controls[Random(UltimaCella)],
                 Controls[Random(UltimaCella)]);
end;

procedure TFmMain.VerificaFineGioco;
var
  g: Integer;
  PulsantiVisibili: Boolean;
begin
  // Quando tutti i pulsanti della griglia sono nascosti,
  // il gioco ha termine.
  PulsantiVisibili := False;
  for g := 0 to Pred(PnGriglia.ControlCount) do
    PulsantiVisibili := PulsantiVisibili or PnGriglia.Controls[g].Visible;
  if not PulsantiVisibili then
    ShowMessage(Format('Game over. Hai totalizzato %d punti.', [Punteggio]));
end;

end.
