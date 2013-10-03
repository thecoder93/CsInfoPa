unit UFmTipOfTheDayDemo;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  LDTipOfTheDay, ExtCtrls, StdCtrls;

type
  TFmTipOfTheDay = class(TForm)
    TOD: TLDTipOfTheDay;
    Label1: TLabel;
    StTip: TLabel;
    Bevel1: TBevel;
    BtNextTip: TButton;
    procedure FormCreate(Sender: TObject);
    procedure BtNextTipClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FmTipOfTheDay: TFmTipOfTheDay;

implementation

{$R *.DFM}

procedure TFmTipOfTheDay.FormCreate(Sender: TObject);
begin
  // Punto al file di Tip e mostro il primo.
  TOD.TipFileName := ExtractFilePath(Application.ExeName) + 'tips.ini';
  BtNextTip.Click;
end;

procedure TFmTipOfTheDay.BtNextTipClick(Sender: TObject);
begin
  StTip.Caption := TOD.NextTip;
end;

end.
