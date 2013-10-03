unit UfmMastrini;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  Db, DBTables, Grids, DBGrids, StdCtrls, DBCtrls, Mask, ExtCtrls;

type
  TFmMastrini = class(TForm)
    pnDestra: TPanel;
    DBNavigator1: TDBNavigator;
    DBGrid1: TDBGrid;
    tbMastrini: TTable;
    tbMastriniID_Mastrino: TAutoIncField;
    tbMastriniDescrizione: TStringField;
    tbMastriniTipo: TStringField;
    tbMastriniSpiegazione: TMemoField;
    DataSource1: TDataSource;
    pnSinistra: TPanel;
    cbFiltro: TCheckBox;
    rgRange: TRadioGroup;
    etFiltroDescr: TEdit;
    pnEdit: TPanel;
    Label3: TLabel;
    dbetDescrizione: TDBEdit;
    DBMemo1: TDBMemo;
    DBRadioGroup1: TDBRadioGroup;
    Label1: TLabel;
    procedure FormCreate(Sender: TObject);
    procedure cbFiltroClick(Sender: TObject);
    procedure tbMastriniFilterRecord(DataSet: TDataSet;
      var Accept: Boolean);
    procedure etFiltroDescrChange(Sender: TObject);
    procedure rgRangeClick(Sender: TObject);
    procedure tbMastriniAfterInsertEdit(DataSet: TDataSet);
  private
    { Private declarations }
    procedure CreaApri(Tabella: TTable; TbPath: string= '');
  public
    { Public declarations }
  end;

var
  FmMastrini: TFmMastrini;

implementation

{$R *.DFM}

uses
  FileCtrl;

procedure TFmMastrini.FormCreate(Sender: TObject);
begin
  CreaApri( tbMastrini, 'Dati' );
  tbMastrini.IndexName := 'TipoDescr';
  etFiltroDescr.Text := '';
end;

procedure TFmMastrini.CreaApri( Tabella: TTable; TbPath: string = '' );
begin
  // La tabella si trova in una sotto-cartella dell'applicazione
  Tabella.DatabaseName := ExtractFilePath(Application.ExeName) + TbPath;
  // Se la cartella non esiste, la creo.
  ForceDirectories(Tabella.DatabaseName);
  // Se la tabella non esiste, la creo.
  if not Tabella.Exists then
    Tabella.CreateTable;
  // Apro la tabella.
  Tabella.Open;
end;

procedure TFmMastrini.rgRangeClick(Sender: TObject);
begin
  with tbMastrini do
    case rgRange.ItemIndex of
      // annulla il Range
      0: CancelRange;
      // solo Portafogli
      1: SetRange( ['P'], ['P'] );
      // solo Spese
      2: SetRange( ['S'], ['S'] );
      // solo Ricavi
      3: SetRange( ['R'], ['R'] );
    end;
end;

procedure TFmMastrini.cbFiltroClick(Sender: TObject);
begin
  // il CheckBox comanda l'Edit e il filtro della tabella
  etFiltroDescr.Visible := cbFiltro.Checked;
  tbMastrini.Filtered := cbFiltro.Checked;
end;

procedure TFmMastrini.tbMastriniFilterRecord(DataSet: TDataSet;
  var Accept: Boolean);
var
  t: string;
begin
  t := etFiltroDescr.Text;
  // il record va accettato se l'Edit è vuoto
  // oppure se il testo è contenuto nel campo Descrizione
  Accept := ( t = '' ) or
    ( Pos( t, DataSet.FieldByName( 'Descrizione' ).AsString ) > 0 );
end;

procedure TFmMastrini.etFiltroDescrChange(Sender: TObject);
begin
  // ogni volta che cambia il filtro, aggiorno la griglia
  tbMastrini.Refresh;
end;

procedure TFmMastrini.tbMastriniAfterInsertEdit(DataSet: TDataSet);
begin
  dbetDescrizione.SetFocus; // porta il focus sul primo campo
end;

end.
