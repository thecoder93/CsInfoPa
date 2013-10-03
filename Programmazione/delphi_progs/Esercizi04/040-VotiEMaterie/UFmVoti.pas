unit UFmVoti;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  Db, DBTables, Grids, DBGrids;

type
  TFmVoti = class(TForm)
    GdVoti: TDBGrid;
    DsVoti: TDataSource;
    TbVoti: TTable;
    TbVotiCognome: TStringField;
    TbVotiNome: TStringField;
    TbVotiVoto1: TFloatField;
    TbVotiVoto2: TFloatField;
    TbVotiVoto3: TFloatField;
    TbVotiVoto4: TFloatField;
    TbVotiVoto5: TFloatField;
    TbVotiMedia: TFloatField;
    procedure FormCreate(Sender: TObject);
    procedure TbVotiCalcFields(DataSet: TDataSet);
    procedure GdVotiDrawColumnCell(Sender: TObject; const Rect: TRect;
      DataCol: Integer; Column: TColumn; State: TGridDrawState);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FmVoti: TFmVoti;

implementation

{$R *.DFM}

uses
  FileCtrl;

procedure TFmVoti.FormCreate(Sender: TObject);
begin
  // La tabella si trova in una sotto-cartella Dati.
  TbVoti.DatabaseName := ExtractFilePath(Application.ExeName) + 'Dati';
  // Se la cartella non esiste, la creo.
  ForceDirectories(TbVoti.DatabaseName);
  // Se la tabella non esiste, la creo.
  if not TbVoti.Exists then
    TbVoti.CreateTable;
  // Apro la tabella.
  TbVoti.Open;
end;

procedure TFmVoti.TbVotiCalcFields(DataSet: TDataSet);
const
  NumeroVoti = 5;
var
  g: Integer;
  Somma: Double;
begin
  // Calcolo la somma dei voti.
  Somma := 0;
  for g := 1 to NumeroVoti do
    Somma := Somma + DataSet.FieldByName('Voto' + IntToStr(g)).AsFloat;
  // Calcolo e assegno la media.
  DataSet.FieldByName('Media').AsFloat := Somma / NumeroVoti;
end;

procedure TFmVoti.GdVotiDrawColumnCell(Sender: TObject; const Rect: TRect;
  DataCol: Integer; Column: TColumn; State: TGridDrawState);

  function CalcolaAreaIstogramma(ARect: TRect; Media: Double): TRect;
  begin
    // Per prima cosa, assottiglio l'istogramma.
    Result.Top := ARect.Top + 2;
    Result.Bottom := ARect.Bottom - 2;
    Result.Left := ARect.Left;
    // Calcolo la lunghezza (Media : 10 = x : larghezza ARect).
    Result.Right := Result.Left +
      (Round(Media * (ARect.Right - ARect.Left) / 10));
  end;

begin
  if Column.FieldName = 'Media' then begin
    with TDBGrid(Sender).Canvas do begin
      // Cancello l'area di lavoro.
      FillRect(Rect);
      // Disegno l'istogramma...
      if Column.Field.AsFloat >= 6 then
        Brush.Color := clLime
      else
        Brush.Color := clRed;
      FillRect(CalcolaAreaIstogramma(Rect, Column.Field.AsFloat));
      // ...e ci scrivo sopra il valore
      // (in grassetto, centrato e trasparente).
      Font.Style := Font.Style + [fsBold];
      Brush.Style := bsClear;
      TextOut((Rect.Right + Rect.Left + 4 -
        TextWidth(Column.Field.Text)) div 2 , Rect.Top + 2,
        Column.Field.Text);
      // Per il testo allineato a sinistra, sostituire la riga
      // sopra con quella sotto.
      //TextOut(Rect.Left + 2, Rect.Top + 2, Column.Field.Text);
    end;
  end;
end;

end.
