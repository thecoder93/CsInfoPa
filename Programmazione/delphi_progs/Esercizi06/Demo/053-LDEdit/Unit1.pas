unit Unit1;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, LDEdit, ExtCtrls;

type
  TForm1 = class(TForm)
    LDEdit1: TLDEdit;
    LDEdit2: TLDEdit;
    Button1: TButton;
    Label1: TLabel;
    Label2: TLabel;
    ShEditColor: TShape;
    Bevel1: TBevel;
    SbChangeColor: TButton;
    CdEdit: TColorDialog;
    procedure Button1Click(Sender: TObject);
    procedure SbChangeColorClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form1: TForm1;

implementation

uses
  Unit2;

{$R *.DFM}

procedure TForm1.Button1Click(Sender: TObject);
begin
  with TForm2.Create(Self) do
    Show;
end;

procedure TForm1.SbChangeColorClick(Sender: TObject);
begin
  if CdEdit.Execute then begin
    ShEditColor.Brush.Color := CdEdit.Color;
    TLDEdit.SetGlobalColor(CdEdit.Color);
  end;
end;

end.
