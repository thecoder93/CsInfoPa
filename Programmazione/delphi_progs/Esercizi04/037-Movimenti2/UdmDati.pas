unit UdmDati;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  Db, DBTables;

type
  TdmDati = class(TDataModule)
    tbMovimenti: TTable;
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
    tbPortafogli: TTable;
    tbMovimentiID_Movimento: TAutoIncField;
    procedure DataModuleCreate(Sender: TObject);
    procedure tbMovimentiAfterInsert(DataSet: TDataSet);
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
  // creo le tabelle alla creazione del Datamodule
  CreaApri( tbMastrini, 'Dati' );
  CreaApri( tbPortafogli, 'Dati' );
  tbMastrini.IndexName := 'TipoDescr';
  CreaApri( tbRigheMov, 'Dati' );
  CreaApri( tbMovimenti, 'Dati' );
  tbPortafogli.IndexName := 'TipoDescr';
  tbPortafogli.SetRange( ['P'], ['P'] );
end;

procedure TdmDati.tbMovimentiAfterInsert(DataSet: TDataSet);
begin
  // data di default uguale a oggi
  Dataset.FieldByName( 'Data' ).AsDateTime := Now;
end;

procedure TdmDati.tbMovimentiBeforeDelete(DataSet: TDataSet);
begin
  // ogni volta che si vuole cancellare un movimento
  // occorre prima cancellare tutte le sue righe
  with tbRigheMov do begin
    First;
    while not Eof do
      Delete;
  end;
end;

end.
