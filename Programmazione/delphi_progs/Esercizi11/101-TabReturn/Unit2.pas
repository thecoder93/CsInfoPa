unit Unit2;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, DBCtrls, Mask, ExtCtrls;

type
  TForm2 = class(TForm)
    Edit1: TEdit;
    Edit2: TEdit;
    Edit3: TEdit;
    DBEdit1: TDBEdit;
    DBEdit2: TDBEdit;
    ComboBox1: TComboBox;
    DBComboBox1: TDBComboBox;
    DBMemo1: TDBMemo;
    Label1: TLabel;
    Bevel1: TBevel;
    Label2: TLabel;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form2: TForm2;

implementation

{$R *.DFM}

end.
