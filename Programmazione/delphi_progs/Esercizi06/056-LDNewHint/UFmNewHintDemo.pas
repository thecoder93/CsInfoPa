unit UFmNewHintDemo;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, ComCtrls;

type
  TFmNewHintDemo = class(TForm)
    Edit1: TEdit;
    Label1: TLabel;
    TbDelay: TTrackBar;
    procedure TbDelayChange(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FmNewHintDemo: TFmNewHintDemo;

implementation

{$R *.DFM}

uses
  LDNewHint;

procedure TFmNewHintDemo.TbDelayChange(Sender: TObject);
begin
  LDHintHideDelay := TbDelay.Position;
end;

end.
