unit UfmEstratti;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  Db, DBTables, Grids, DBGrids, StdCtrls, DBCtrls, Mask, ExtCtrls;

type
  TFmEstratti = class(TForm)
    QrMastrini: TQuery;
    dsMastrini: TDataSource;
    DbGrMastrini: TDBGrid;
    DbGrEstratti: TDBGrid;
    QrEstratti: TQuery;
    DsEstratti: TDataSource;
    procedure FormCreate(Sender: TObject);
    procedure DbGrMastriniClick(Column: TColumn);
  private
    { Private declarations }
  public
    { Public declarations }
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
  DbGrMastriniClick( nil );
end;

procedure TFmEstratti.DbGrMastriniClick(Column: TColumn);
begin
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

end.
