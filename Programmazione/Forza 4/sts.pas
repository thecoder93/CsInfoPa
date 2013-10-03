unit sts;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls;

type
  TForm2 = class(TForm)
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
  private

  public
    procedure aggiorna(x,y:integer);
  end;

var
  Form2: TForm2;

implementation

{$R *.dfm}

{ TForm2 }

procedure TForm2.aggiorna(x,y:integer);
begin
Label2.Font.Color:=clred;
label2.Caption:='Vittorie del rosso       '+ intTostr(x);
label3.Font.Color:=clblue;
label3.Caption:='Vittorie del blu           ' + inttostr(y);
end;

end.
