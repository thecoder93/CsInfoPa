unit UfmMastrini;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  Db, DBTables, Grids, DBGrids, StdCtrls, DBCtrls, Mask, ExtCtrls;

type
  TFmMastrini = class(TForm)
    tbMastrini: TTable;
    tbMastriniID_Mastrino: TAutoIncField;
    tbMastriniDescrizione: TStringField;
    tbMastriniTipo: TStringField;
    tbMastriniSpiegazione: TMemoField;
    Label1: TLabel;
    DBEdit1: TDBEdit;
    dsMastrini: TDataSource;
    Label3: TLabel;
    DBMemo1: TDBMemo;
    DBNavigator1: TDBNavigator;
    DBRadioGroup1: TDBRadioGroup;
    DBGrid1: TDBGrid;
    procedure FormCreate(Sender: TObject);
  private
    procedure CreaApri(Tabella: TTable; TbPath: string= '');
    { Private declarations }
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

end.
