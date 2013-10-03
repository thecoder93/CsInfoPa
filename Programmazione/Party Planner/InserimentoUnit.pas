unit InserimentoUnit;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls;

type
  TForm2 = class(TForm)
    teInserimento: TEdit;
    tbInserisci: TButton;
    tbAnnulla: TButton;
    procedure tbInserisciClick(Sender: TObject);
    procedure tbAnnullaClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form2: TForm2;

implementation

uses MainUnit;

{$R *.dfm}

procedure TForm2.tbInserisciClick(Sender: TObject);
begin
 with Form1.sgTabella do
  Cells[ACol2,ARow2]:=teInserimento.Text;
 close;
end;

procedure TForm2.tbAnnullaClick(Sender: TObject);
begin
 close;
end;

end.
