unit Unit2;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  UFmTiled, StdCtrls, ExtCtrls;

type
  TFmTiled2 = class(TFmTiled)
    Bevel1: TBevel;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    BtShow: TButton;
    Edit1: TEdit;
    Edit2: TEdit;
    Edit3: TEdit;
    Edit4: TEdit;
    Edit5: TEdit;
    Edit6: TEdit;
    Edit7: TEdit;
    Edit8: TEdit;
    ListBox1: TListBox;
    RadioGroup1: TRadioGroup;
    Panel1: TPanel;
    CheckBox1: TCheckBox;
    CheckBox2: TCheckBox;
    CheckBox3: TCheckBox;
    CheckBox4: TCheckBox;
    procedure BtShowClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FmTiled2: TFmTiled2;

implementation

{$R *.DFM}

uses
  Unit3;

procedure TFmTiled2.BtShowClick(Sender: TObject);
begin
  Form3.Show;
end;

end.
