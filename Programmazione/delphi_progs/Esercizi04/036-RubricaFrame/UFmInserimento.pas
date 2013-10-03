unit UFmInserimento;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, Buttons, ExtCtrls, UFrDataEntry;

type
  TFmInserimento = class(TForm)
    Panel1: TPanel;
    BitBtn1: TBitBtn;
    BitBtn2: TBitBtn;
    FrDataEntry1: TFrDataEntry;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

// La form non è auto-creata, quindi questa variabile non serve.
//var
//  FmInserimento: TFmInserimento;

implementation

uses UFmRubricaFrame;

{$R *.DFM}

end.
