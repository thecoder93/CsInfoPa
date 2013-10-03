unit MainUnit;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, QExtCtrls;

type
  TForm1 = class(TForm)
    teNome: TEdit;
    tlNome: TLabel;
    tbOkNome: TButton;
    tlCodGenerato: TLabel;
    tlCodGenerato2: TLabel;
    tbRandom: TButton;
    tbStart: TButton;
    procedure FormCreate(Sender: TObject);
    procedure tbOkNomeClick(Sender: TObject);
    procedure tbRandomClick(Sender: TObject);
    procedure tbStartClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form1: TForm1;
  colore:array[0..5] of TColor;
  secret: array[0..3] of 0..5;

implementation

uses ComboUnit;

{$R *.dfm}

procedure TForm1.FormCreate(Sender: TObject);
begin
 randomize;
 colore[0]:=clRed;
 colore[1]:=clBlue;
 colore[2]:=clGreen;
 colore[3]:=clFuchsia;
 colore[4]:=clYellow;
 colore[5]:=clAqua;
end;

procedure TForm1.tbOkNomeClick(Sender: TObject);
begin
 if teNome.Text<>'' then
  begin //SalvaNome
   teNome.Enabled:=False;
   tbRandom.Enabled:=True;
  end
 else
  ShowMessage('Inserisci prima il nome del giocatore');
end;

procedure TForm1.tbRandomClick(Sender: TObject);
var i:integer;
begin
 for i:=0 to 3 do
  secret[i]:=random(6);
 tlCodGenerato2.Caption:='    GENERATO';
 tbStart.Enabled:=True;
end;

procedure TForm1.tbStartClick(Sender: TObject);
begin
 Form2.ShowModal;
end;

end.
