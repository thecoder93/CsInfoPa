unit UfmStrToFloatDef;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls;

type
  TForm1 = class(TForm)
    etFloat: TEdit;
    LbRisultato: TLabel;
    Bt10000Volte: TButton;
    Bt10000VolteSenza: TButton;
    procedure Bt10000VolteClick(Sender: TObject);
    procedure Bt10000VolteSenzaClick(Sender: TObject);
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

uses
  Stringhe;

procedure TForm1.Bt10000VolteClick(Sender: TObject);
var
  i: integer;
begin
  // test con le eccezioni
  for i := 1 to 10000 do
    LbRisultato.Caption :=
      FloatToStr( StrToFloatDef( etFloat.Text, 0 ) );
end;

procedure TForm1.Bt10000VolteSenzaClick(Sender: TObject);
var
  i: integer;
begin
  // test senza eccezioni
  for i := 1 to 10000 do
    LbRisultato.Caption :=
      FloatToStr( StrToFloatDef2( etFloat.Text, 0 ) );
end;

procedure TForm1.FormCreate(Sender: TObject);
begin
  etFloat.Text := '';
  LbRisultato.Caption := '';
end;

end.
