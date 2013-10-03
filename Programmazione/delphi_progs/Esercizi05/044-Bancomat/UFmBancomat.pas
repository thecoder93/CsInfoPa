unit UFmBancomat;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, ExtCtrls;

type
  TFmBancomat = class(TForm)
    EtImporto: TEdit;
    Label1: TLabel;
    Label2: TLabel;
    BtPreleva: TButton;
    Bevel1: TBevel;
    Label3: TLabel;
    EtScontrino: TMemo;
    procedure BtPrelevaClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FmBancomat: TFmBancomat;

implementation

{$R *.DFM}

uses
  LDBancomat;
  
procedure TFmBancomat.BtPrelevaClick(Sender: TObject);
begin
  with TLDBancomat.Create do begin
    try
      Importo := StrToFloat(EtImporto.Text);
      EtScontrino.Lines.Clear;
      EmettiScontrino(EtScontrino.Lines);
    finally
      Free;
    end;
  end;
end;

end.
