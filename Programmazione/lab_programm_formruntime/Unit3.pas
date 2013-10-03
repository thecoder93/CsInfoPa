unit Unit3;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls;

type
  TForm3 = class(TForm)
    Button1: TButton;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure Button1Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form3: TForm3;

implementation

uses Unit4;
var  eccola:Tform4;
{$R *.DFM}

procedure TForm3.FormClose(Sender: TObject; var Action: TCloseAction);
begin
if Messagedlg('sei sicuro di chiudere la form',mtConfirmation,
[mbyes,mbno],0)=mryes then action:=caFree
else action:=caNone;
end;

procedure TForm3.Button1Click(Sender: TObject);
begin
eccola:=Tform4.create(self);
eccola.show;
end;

end.
