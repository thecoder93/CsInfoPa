unit UFmFinestreAttive;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  Grids, StdCtrls, Buttons, ExtCtrls;

type
  TFmFinestreAttive = class(TForm)
    SgFinestre: TStringGrid;
    BtMostra: TBitBtn;
    BtNascondi: TBitBtn;
    Timer: TTimer;
    procedure AggiornaFinestre(Sender: TObject);
    procedure BtMostraClick(Sender: TObject);
    procedure BtNascondiClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
  private
  public
    procedure MostraFinestra( Handle: integer; Visibile: boolean );
  end;

function AggiungiFinestra(WndHandle: HWND; LParam: Pointer): BOOL; stdcall;

var
  FmFinestreAttive: TFmFinestreAttive;

implementation

{$R *.DFM}

procedure TFmFinestreAttive.AggiornaFinestre(Sender: TObject);
begin
// procedura per caricare sulla StringGrid le finestre aperte
// di Windows. Carica solo le principali e non le child
// viene richiamata dal timer ogni 10 secondi

// inizializza la grid
  with SgFinestre do begin
    RowCount := 2;
    Cells[ 0, 0 ] := 'Handle';
    Cells[ 1, 0 ] := 'Classe';
    Cells[ 2, 0 ] := 'Titolo';
    Cells[ 3, 0 ] := 'Visibile';
  end;

// chiama la funzione di enumerazione passando una
// funzione di callback e la StringGrid come parametro
  EnumWindows( @AggiungiFinestra, Integer( @SgFinestre ) );
end;

function AggiungiFinestra(WndHandle: HWND; LParam: Pointer): BOOL; stdcall;
var
  r: integer;
  grid: TStringGrid;
  nome: array[0..32] of char;
  s: string;
begin
// funzione da passare come callback, notare la dichiarazione
// stdcall obbligatoria per passare i parametri nello stack
// da destra a sinistra come si aspetta Windows.

// colleghiamo la grid passata col parametro LParam
  grid := TStringGrid( LParam^ );
  r := grid.RowCount - 1;
// aumentiamo il numero di righe della grid
  grid.RowCount := r + 2;
// nella penultima riga carichiamo l'handle della finestra
  grid.Cells[ 0, r ] := IntToStr( WndHandle );
// prendiamo la classe della finestra...
  GetClassName( WndHandle, @nome, Length( nome ) );
// e la mettiamo nella seconda colonna
  grid.Cells[ 1, r ] := nome;
// prendiamo il titolo della finestra...
  GetWindowText( WndHandle, @nome, Length( nome ) );
// e la mettiamo nella terza colonna
  grid.Cells[ 2, r ] := nome;
// controlliamo se la finestra è visibile...
  if IsWindowVisible( WndHandle ) then
    s := 'Visibile'
  else
    s := 'Nascosta';
// e lo scriviamo nella quarta colonna
  grid.Cells[ 3, r ] := s;
  result := true;
end;

procedure TFmFinestreAttive.FormShow(Sender: TObject);
begin
// aggiorniamo subito la griglia
  AggiornaFinestre( Self );
end;

procedure TFmFinestreAttive.MostraFinestra(Handle: integer;
  Visibile: boolean);
begin
// procedura per mostrare o nascondere una finestra
// a partire dall'handle
  if Visibile then
    ShowWindow( Handle, SW_SHOW )
  else
    ShowWindow( Handle, SW_HIDE );
end;

procedure TFmFinestreAttive.BtMostraClick(Sender: TObject);
var
  h: integer;
begin
// mostriamo la finestra della riga corrente
  with SgFinestre do
    h := StrToIntDef( Cells[ 0, Row ], -1 );
// se l'handle è valido mostriamo la finestra e
// aggiorniamo la griglia
  if h > 0 then begin
    MostraFinestra( h, True );
    AggiornaFinestre( Sender );
  end;
end;

procedure TFmFinestreAttive.BtNascondiClick(Sender: TObject);
var
  h: integer;
begin
  with SgFinestre do
    h := StrToIntDef( Cells[ 0, Row ], -1 );
// se l'handle è valido nascondiamo la finestra e
// aggiorniamo la griglia
  if h > 0 then begin
    MostraFinestra( h, False );
    AggiornaFinestre( Sender );
  end;
end;

end.
