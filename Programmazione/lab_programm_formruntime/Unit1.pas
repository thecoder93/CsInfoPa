unit Unit1;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls,unit3;

type
  TForm1 = class(TForm)
    Button1: TButton;
    Button2: TButton;
    tantefinestre: TButton;
    Button3: TButton;
    Button4: TButton;
    procedure Button1Click(Sender: TObject);
    procedure Button2Click(Sender: TObject);
    procedure tantefinestreClick(Sender: TObject);
    procedure Button3Click(Sender: TObject);
    procedure Button4Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form1: TForm1;
  eccolo:Tform3;

implementation

uses Unit2, Unit4, Unit5;

{$R *.DFM}

procedure TForm1.Button1Click(Sender: TObject);
var nuova:Tform2;
begin
  nuova:=Tform2.create(application);
  try //showmodal potrebbe sollevare qualche eccezione
    nuova.showmodal;
  finally //cosi' si e' sicuri di distruggere in ogni caso l'oggetto
    nuova.free;
  end;
end;

procedure TForm1.Button2Click(Sender: TObject);
begin
eccolo:=Tform3.create(application);
eccolo.show;
end;

procedure TForm1.tantefinestreClick(Sender: TObject);
begin
 with TForm4.create(application) do
    show;
end;



procedure TForm1.Button3Click(Sender: TObject);
begin
Form3.show;
end;

procedure TForm1.Button4Click(Sender: TObject);
begin
if not Assigned(Form5) then //controlla se la variabile form5 è nil
   Form5:=Tform5.create(self);
Form5.show;
end;

end.
