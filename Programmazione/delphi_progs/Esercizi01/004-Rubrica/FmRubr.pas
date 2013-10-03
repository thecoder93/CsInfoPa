unit FmRubr;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  Menus, Grids;

type
  TFmRubrica = class(TForm)
    MainMenu1: TMainMenu;
    File1: TMenuItem;
    Esci1: TMenuItem;
    Indirizzo1: TMenuItem;
    Aggiungi1: TMenuItem;
    Elimina1: TMenuItem;
    EliminaTutti1: TMenuItem;
    sgIndir: TStringGrid;
    procedure FormCreate(Sender: TObject);
    procedure EliminaTutti1Click(Sender: TObject);
    procedure Aggiungi1Click(Sender: TObject);
    procedure Elimina1Click(Sender: TObject);
    procedure Esci1Click(Sender: TObject);
    procedure FormCloseQuery(Sender: TObject; var CanClose: Boolean);
  private
    procedure CancellaTutto;
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FmRubrica: TFmRubrica;

implementation

{$R *.DFM}

procedure TFmRubrica.FormCreate(Sender: TObject);
begin
  // spazio per le colonne e l'eventuale scrollbar
  Constraints.MinWidth := 640;
  // fissiamo la larghezza della form
  Constraints.MaxWidth := Constraints.MinWidth;
  CancellaTutto;
end;

procedure TFmRubrica.CancellaTutto;
var
  i: integer;
begin
  with sgIndir do // per evitare di ripeterlo ad ogni riga
  begin
    for i := 0 to 4 do
      Cols[ i ].Clear; // cancella tutte le colonne
    RowCount := 2; // una riga di intestazione e una vuota
    ColWidths[ 0 ] := 100;
    ColWidths[ 1 ] := 200;
    ColWidths[ 2 ] := 100;
    ColWidths[ 3 ] := 100;
    ColWidths[ 4 ] := 100;
    Cells[ 0, 0 ] := 'Nome'; // Nome colonne fisse
    Cells[ 1, 0 ] := 'Indirizzo';
    Cells[ 2, 0 ] := 'Email';
    Cells[ 3, 0 ] := 'Telefono';
    Cells[ 4, 0 ] := 'Cellulare';
  end;
end;

procedure TFmRubrica.EliminaTutti1Click(Sender: TObject);
begin
  CancellaTutto;
end;

procedure TFmRubrica.Aggiungi1Click(Sender: TObject);
begin
  sgIndir.RowCount := sgIndir.RowCount + 1;
end;

procedure TFmRubrica.Elimina1Click(Sender: TObject);
var
  i, k: integer;
begin
  if sgIndir.Row > 0 then // se è selezionata una riga...
  begin
    for i := 0 to 4 do // per ogni colonna...
    begin
      sgIndir.Cells[ i, sgIndir.Row ] := ''; // cancella la cella...
      for k := sgIndir.Row to sgIndir.RowCount - 2 do
        // ...e sposta in su tutte le celle a partire da quella
        // selezionata
        sgIndir.Cells[ i, k ] := sgIndir.Cells[ i, k + 1 ];
    end;
    if sgIndir.RowCount > 2 then // se c'è più di una riga
      sgIndir.RowCount := sgIndir.RowCount - 1; // elimino l'ultima
  end;
end;

procedure TFmRubrica.Esci1Click(Sender: TObject);
begin
  Close;
end;

procedure TFmRubrica.FormCloseQuery(Sender: TObject; var CanClose: Boolean);
begin
  with sgIndir do
    // se c'è qualcosa nella griglia
    if ( RowCount > 2 ) or ( trim( cells[ 0, 1 ] ) <> '' ) then
      // chiude solo se confermato
      CanClose := MessageDlg( 'Sei sicuro di voler chiudere la rubrica?',
        mtConfirmation, mbOKCancel, 0 ) = mrOk;
end;

end.
