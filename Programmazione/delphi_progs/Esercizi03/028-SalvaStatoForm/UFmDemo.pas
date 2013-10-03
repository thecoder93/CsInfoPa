unit UFmDemo;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls;

type
  TFmDemo = class(TForm)
    Label1: TLabel;
    procedure FormCreate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FmDemo: TFmDemo;

implementation

{$R *.DFM}

uses
  StatoForm;

procedure TFmDemo.FormCreate(Sender: TObject);
begin
  RipristinaStatoForm(Self);
end;

procedure TFmDemo.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  SalvaStatoForm(Self);
end;

end.
