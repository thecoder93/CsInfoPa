unit UfmEstratti;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  Db, DBTables, Grids, DBGrids, StdCtrls, DBCtrls, Mask, ExtCtrls,
  UInterfaccia;

type
  TFmEstratti = class(TForm, IDataForm)
    QrMastrini: TQuery;
    dsMastrini: TDataSource;
    DbGrMastrini: TDBGrid;
    DbGrEstratti: TDBGrid;
    QrEstratti: TQuery;
    DsEstratti: TDataSource;
    Label1: TLabel;
    Label2: TLabel;
    procedure FormCreate(Sender: TObject);
    procedure dsMastriniDataChange(Sender: TObject; Field: TField);
    procedure FormDestroy(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
  private
    FDataChangeHandler: TNotifyEvent;
    procedure OnDataChange(Handler: TNotifyEvent);
    procedure AggiornaEstratti;
  public
    function GetRecordCorrente: string;
    procedure Risincronizza;
  end;

var
  FmEstratti: TFmEstratti;

implementation

{$R *.DFM}

uses
  FileCtrl;

procedure TFmEstratti.FormCreate(Sender: TObject);
begin
  // impostiamo il database dove trovare le tabelle
  with QrEstratti do
    DatabaseName := ExtractFilePath(Application.ExeName) + 'Dati';
  with QrMastrini do begin
    DatabaseName := ExtractFilePath(Application.ExeName) + 'Dati';
    // SUM e GROUP BY permettono di mostrare la somma degli importi
    SQL.Add( 'SELECT M.ID_Mastrino AS ID, M.Descrizione,' );
    SQL.Add( 'SUM( R.Importo ) AS Saldo FROM Mastrini M, RigheMov R' );
    SQL.Add( 'WHERE M.ID_Mastrino = R.ID_Mastrino' );
    SQL.Add( 'GROUP BY M.ID_Mastrino, M.Descrizione' );
    // lanciamo la query
    Open;
  end;
  // lanciamo la seconda query iniziale
  AggiornaEstratti;
end;

procedure TFmEstratti.dsMastriniDataChange(Sender: TObject; Field: TField);
begin
  AggiornaEstratti;
  if Assigned( FDataChangeHandler ) then
    FDataChangeHandler(self);
end;

procedure TFmEstratti.AggiornaEstratti;
begin
// procedura per aggiornare gli estratti in base al mastrino
  with QrEstratti do begin
    // chiudiamo la query nel caso fosse aperta
    Close;
    // ripuliamo il comando SQL
    SQL.Clear;
    // definiamo il nuovo comando cambiando il mastrino corrente
    SQL.Add('SELECT M.Data, M.Motivo, R.Importo' );
    SQL.Add('FROM Movimenti M, RigheMov R' );
    SQL.Add('WHERE M.ID_Movimento = R.ID_Movimento' );
    SQL.Add('AND R.ID_Mastrino = ' +
      QrMastrini.FieldByName( 'ID' ).AsString );
    SQL.Add('ORDER BY 1' );
    // lanciamo la query
    Open;
  end;
end;

function TFmEstratti.GetRecordCorrente: string;
begin
  result := QrMastrini.FieldByName( 'Descrizione' ).AsString;
end;

procedure TFmEstratti.OnDataChange(Handler: TNotifyEvent);
begin
  FDataChangeHandler := Handler;
end;

procedure TFmEstratti.Risincronizza;
begin
// ricarichiamo i dati
  dsMastrini.OnDataChange := nil;
  QrMastrini.Refresh;
  dsMastrini.OnDataChange := dsMastriniDataChange;
end;

procedure TFmEstratti.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  Action := caFree;
end;

procedure TFmEstratti.FormDestroy(Sender: TObject);
begin
  FDataChangeHandler(self);
end;

end.
