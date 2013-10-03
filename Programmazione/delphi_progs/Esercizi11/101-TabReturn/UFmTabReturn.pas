unit UFmTabReturn;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls;

type
  TFmTabReturn = class(TForm)
    Edit1: TEdit;
    Edit2: TEdit;
    Edit3: TEdit;
    Memo1: TMemo;
    ListBox1: TListBox;
    BtShowForm2: TButton;
    Label1: TLabel;
    procedure BtShowForm2Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FmTabReturn: TFmTabReturn;

implementation

{$R *.DFM}

uses
  UTabReturn, Unit2;
  
procedure TFmTabReturn.BtShowForm2Click(Sender: TObject);
begin
  Form2.Show;
end;

end.
