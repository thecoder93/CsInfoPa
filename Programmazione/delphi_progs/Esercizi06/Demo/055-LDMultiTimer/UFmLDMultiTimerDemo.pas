unit UFmLDMultiTimerDemo;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  LDMultiTimer, StdCtrls, ExtCtrls, Buttons;

type
  TFmLDMultiTimerDemo = class(TForm)
    LDMultiTimer1: TLDMultiTimer;
    ShRandom: TShape;
    StTime: TLabel;
    Label2: TLabel;
    procedure LDMultiTimer1SubTimers0Timer(Sender: TObject);
    procedure LDMultiTimer1SubTimers1Timer(Sender: TObject);
    procedure LDMultiTimer1SubTimers2Timer(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FmLDMultiTimerDemo: TFmLDMultiTimerDemo;

implementation

{$R *.DFM}

procedure TFmLDMultiTimerDemo.LDMultiTimer1SubTimers0Timer(Sender: TObject);
begin
  StTime.Caption := TimeToStr(Now);
end;

procedure TFmLDMultiTimerDemo.LDMultiTimer1SubTimers1Timer(Sender: TObject);
begin
  ShRandom.Brush.Color := Random(High(TColor));
end;

procedure TFmLDMultiTimerDemo.LDMultiTimer1SubTimers2Timer(Sender: TObject);
begin
  ShRandom.Shape := TShapeType(Random(Ord(High(TShapeType))));
end;

end.
