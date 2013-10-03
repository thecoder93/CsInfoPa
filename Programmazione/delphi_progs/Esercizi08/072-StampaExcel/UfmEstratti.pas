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
    BtExcel: TButton;
    DlgSalva: TSaveDialog;
    procedure FormCreate(Sender: TObject);
    procedure QrMastriniAfterScroll(DataSet: TDataSet);
    procedure BtExcelClick(Sender: TObject);
  private
    procedure SincronizzaEstratti;
  public
    procedure SalvaSuExcel(NomeFile: String);
  end;

var
  FmEstratti: TFmEstratti;

implementation

{$R *.DFM}

uses
  FileCtrl, ComObj;

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
  SincronizzaEstratti;
end;

procedure TFmEstratti.SincronizzaEstratti;
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

procedure TFmEstratti.BtExcelClick(Sender: TObject);
begin
// faccio scegliere il nome del file e poi
// salvo i dati nel formato di Excel
  if DlgSalva.Execute then begin
    SalvaSuExcel( DlgSalva.FileName );
  end;
end;

procedure TFmEstratti.SalvaSuExcel(NomeFile: String);
var
  x,y: integer;
  curpos : TBookmarkStr;
  Excel: OleVariant;
begin
// prepariamo Excel
  try
    Excel := CreateOLEObject( 'Excel.Application' );
  except
  // avvisiamo se non è presente
    ShowMessage( 'Excel non presente!' );
    Exit;
  end;
// aggiungiamo un nuovo WorkBook
  Excel.WorkBooks.Add;
// disabilitiamo i controlli prima
  QrMastrini.DisableControls;
  try
    QrEstratti.DisableControls;
    try
    // memorizziamo la posizione di partenza
      curpos := QrMastrini.Bookmark;
    // prepariamo la stampa
      QrMastrini.First;
    // cella di partenza
      y := 1;
      x := 1;
    // esportiamo i dati del mastrino...
      while not QrMastrini.Eof do begin
      // per le stringhe serve il carattere ' davanti
        Excel.WorkSheets['Foglio1'].Cells[y,x].Value := '''' +
          QrMastrini.FieldByName('Descrizione').AsString;
      // per i numeri non serve il carattere ' davanti
        Excel.WorkSheets['Foglio1'].Cells[y,x+1].Value :=
          QrMastrini.FieldByName('Saldo').AsString;
      // saltiamo una riga
        inc( y );
        while not QrEstratti.Eof do begin
        // ...e quelli dei suoi movimenti
          Excel.WorkSheets['Foglio1'].Cells[y,x+2].Value := '''' +
            QrEstratti.FieldByName('Data').AsString;
          Excel.WorkSheets['Foglio1'].Cells[y,x+3].Value := '''' +
            QrEstratti.FieldByName('Motivo').AsString;
          Excel.WorkSheets['Foglio1'].Cells[y,x+4].Value :=
            QrEstratti.FieldByName('Importo').AsString;
        // avanziamo di una riga sul foglio e sul dataset
          inc( y );
          QrEstratti.Next;
        end;
        QrMastrini.Next;
      end;
    // chiudiamo il file Excel
      Excel.ActiveWorkBook.SaveAs(NomeFile);
      Excel.WorkBooks.Close;
    // mi riposiziono dov'ero
      QrMastrini.Bookmark := curpos;
    // riabilito i controlli alla fine
    finally
      QrEstratti.EnableControls;
    end;
  finally
    QrMastrini.EnableControls;
  end;
  ShowMessage('Foglio Excel salvato!');
end;

end.

