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
    BtStampaSing: TButton;
    BtStampaTutti: TButton;
    CbPreview: TCheckBox;
    procedure FormCreate(Sender: TObject);
    procedure BtStampaSingClick(Sender: TObject);
    procedure BtStampaTuttiClick(Sender: TObject);
    procedure QrMastriniAfterScroll(DataSet: TDataSet);
  private
    procedure PreparaReport( Tutti: Boolean );
  public
    procedure StampaReport(Preview, Tutti: boolean);
  end;

var
  FmEstratti: TFmEstratti;

implementation

{$R *.DFM}

uses
  FileCtrl, UQrStampa;

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
end;

procedure TFmEstratti.QrMastriniAfterScroll(DataSet: TDataSet);
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

procedure TFmEstratti.BtStampaSingClick(Sender: TObject);
begin
// stampiamo il report del mastrino
  StampaReport( CbPreview.Checked, False );
end;

procedure TFmEstratti.BtStampaTuttiClick(Sender: TObject);
begin
// stampiamo tutto il report
  StampaReport( CbPreview.Checked, True );
end;

procedure TFmEstratti.StampaReport(Preview, Tutti: boolean);
var
  curpos : TBookmarkStr;
begin
// disabilitaimo prima i controlli
  QrMastrini.DisableControls;
  try
    QrEstratti.DisableControls;
    try
    // memorizziamo la posizione
      curpos := QrMastrini.Bookmark;
      try
      // prepariamo il report
        PreparaReport(Tutti);
      // stampa o anteprima
        if Preview then
          QrStampa.PreviewModal
        else
          QrStampa.Print;
      // riposizionamento
      finally
        QrMastrini.Bookmark := curpos;
      end;
    // riabilitiamo i controlli
    finally
      QrEstratti.EnableControls;
    end;
  finally
    QrMastrini.EnableControls;
  end;
end;

procedure TFmEstratti.PreparaReport( Tutti: Boolean );
begin
// colleghiamo via codice i componenti del Report
// alle Query della form principale
  with QRStampa do begin
  // usiamo il DataSet principale per stampare tutti i record
    if Tutti then
      DataSet := QrMastrini
    else // altrimenti stampiamo solo quello corrente
      DataSet := nil;
    QRDescrizione.DataSet := QrMastrini;
    QRSaldo.DataSet := QrMastrini;
    QRBandDettaglio.DataSet := QrEstratti;
    QRData.DataSet := QrEstratti;
    QRMotivo.DataSet := QrEstratti;
    QRImporto.DataSet := QrEstratti;
  end;
end;

end.
