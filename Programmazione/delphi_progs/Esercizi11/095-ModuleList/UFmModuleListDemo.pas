unit UFmModuleListDemo;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, ExtCtrls;

type
  TFmModuleListDemo = class(TForm)
    RgKind: TRadioGroup;
    PbGo: TButton;
    EtList: TMemo;
    procedure PbGoClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FmModuleListDemo: TFmModuleListDemo;

implementation

{$R *.DFM}

uses
  LDModuleList;

procedure TFmModuleListDemo.PbGoClick(Sender: TObject);
var
  g: Integer;
begin
  EtList.Lines.Clear;
  with CreateModuleList(TLDModuleListKind(RgKind.ItemIndex)) do
    try
      for g := 0 to Pred(ModuleCount) do begin
        Modules[g].AddToStrings(EtList.Lines);
        EtList.Lines.Add('');
      end;
    finally
      Free;
    end;
end;

end.
