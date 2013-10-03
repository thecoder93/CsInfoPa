unit UFmMain;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls;

type
  TFmMain = class(TForm)
    EtNomeFile: TEdit;
    BtSfoglia: TButton;
    BtMostra: TButton;
    OdNomeFile: TOpenDialog;
    Label1: TLabel;
    procedure BtSfogliaClick(Sender: TObject);
    procedure BtMostraClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FmMain: TFmMain;

implementation

{$R *.DFM}

uses
  UFmID3Info;

procedure TFmMain.BtSfogliaClick(Sender: TObject);
begin
  if OdNomeFile.Execute then
    EtNomeFile.Text := OdNomeFile.FileName;
end;

procedure TFmMain.BtMostraClick(Sender: TObject);
begin
  MostraInfoID3(EtNomeFile.Text);
end;

end.
