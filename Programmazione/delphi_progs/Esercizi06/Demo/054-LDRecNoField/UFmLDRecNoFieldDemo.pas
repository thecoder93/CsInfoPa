unit UFmLDRecNoFieldDemo;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  LDRecNoField, Db, DBTables, Grids, DBGrids;

type
  TForm1 = class(TForm)
    DBGrid1: TDBGrid;
    Table1: TTable;
    DataSource1: TDataSource;
    Table1NAME: TStringField;
    Table1SIZE: TSmallintField;
    Table1WEIGHT: TSmallintField;
    Table1AREA: TStringField;
    Table1RecNo: TLDRecNoField;
    procedure FormCreate(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form1: TForm1;

implementation

{$R *.DFM}

procedure TForm1.FormCreate(Sender: TObject);
begin
  Table1.Open;
end;

end.
