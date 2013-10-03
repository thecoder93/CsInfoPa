unit UdmDati;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  Db, DBTables;

type
  TdmDati = class(TDataModule)
    tbMovimenti: TTable;
    tbMovimentiID_Movimento: TAutoIncField;
    tbMovimentiTipo: TStringField;
    tbMovimentiData: TDateField;
    tbMovimentiMotivo: TStringField;
    tbMovimentiRiferimento: TIntegerField;
    tbMovimentiNote: TMemoField;
    tbRigheMov: TTable;
    tbRigheMovID_Movimento: TIntegerField;
    tbRigheMovID_Riga: TAutoIncField;
    tbRigheMovID_Mastrino: TIntegerField;
    tbRigheMovImporto: TCurrencyField;
    tbMastrini: TTable;
    tbMastriniID_Mastrino: TAutoIncField;
    tbMastriniDescrizione: TStringField;
    tbMastriniTipo: TStringField;
    tbMastriniSpiegazione: TMemoField;
    dsMovimenti: TDataSource;
    tbMovimentiID_Mastrino: TIntegerField;
    tbRigheMovDescMastrino: TStringField;
    tbPortafogli: TTable;
    tbRigheMovRO: TTable;
    tbRigheMovRoImporto: TCurrencyField;
    tbRigheMovROID_Movimento: TIntegerField;
    tbRigheMovROID_Riga: TAutoIncField;
    tbRigheMovROID_Mastrino: TIntegerField;
    tbMovimentiTotImporto: TCurrencyField;
    procedure DataModuleCreate(Sender: TObject);
    procedure tbMovimentiAfterInsert(DataSet: TDataSet);
    procedure tbRigheMovAfterInsert(DataSet: TDataSet);
    procedure tbRigheMovBeforeEditInsert(DataSet: TDataSet);
    procedure MettiRangeMastrini(DataSet: TDataSet);
    procedure tbMovimentiBeforeDelete(DataSet: TDataSet);
  private
    { Private declarations }
  public
    { Public declarations }
  end;


var
  dmDati: TdmDati;
  
procedure CreaApri( Tabella: TTable; TbPath: string = '' );

implementation

{$R *.DFM}

uses
  FileCtrl;
procedure CreaApri( Tabella: TTable; TbPath: string = '' );
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

procedure TdmDati.DataModuleCreate(Sender: TObject);
begin
// crea le tabelle alla creazione del Datamodule
  CreaApri( tbMastrini, 'Dati' );
  CreaApri( tbPortafogli, 'Dati' );
  tbMastrini.IndexName := 'TipoDescr';
  CreaApri( tbRigheMov, 'Dati' );
  CreaApri( tbRigheMovRO, 'Dati' );
  CreaApri( tbMovimenti, 'Dati' );
  tbPortafogli.IndexName := 'TipoDescr';
  tbPortafogli.SetRange( ['P'], ['P'] );
end;

procedure TdmDati.MettiRangeMastrini(DataSet: TDataSet);
begin
  // a seconda del tipo movimento seleziono
  // solo i mastrini di un determinato tipo
  if tbMovimentiTipo.AsString = 'S' then
    tbMastrini.SetRange( ['S'], ['S'] )
  else if tbMovimentiTipo.AsString = 'R' then
    tbMastrini.SetRange( ['R'], ['R'] )
  else if tbMovimentiTipo.AsString = 'T' then
    tbMastrini.SetRange( ['P'], ['P'] );
end;

procedure TdmDati.tbRigheMovBeforeEditInsert(DataSet: TDataSet);
begin
  // prima di inserire una riga confermo la testata
  // se era in modalità di inserimento
  if tbMovimenti.State = dsInsert then begin
    tbMovimenti.BeforePost( tbMovimenti );
    tbMovimenti.Post;
    tbMovimenti.Edit;
  end;
end;

procedure TdmDati.tbMovimentiAfterInsert(DataSet: TDataSet);
begin
// data di default uguale a oggi
  Dataset.FieldByName( 'Data' ).AsDateTime := Now;
end;

procedure TdmDati.tbRigheMovAfterInsert(DataSet: TDataSet);
begin
// importo di default uguale a zero
  DataSet.FieldByName( 'Importo' ).AsCurrency := 0;
end;

procedure TdmDati.tbMovimentiBeforeDelete(DataSet: TDataSet);
begin
// ogni volta che si vuole cancellare un movimento occorre prima
// cancellare tutte le sue righe
  with tbRigheMov do begin
    First;
    while not Eof do
      Delete;
  end;
end;

end.
