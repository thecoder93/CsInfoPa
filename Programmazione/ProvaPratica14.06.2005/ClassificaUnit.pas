unit ClassificaUnit;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls;

type
  TForm2 = class(TForm)
    tlPosTitle: TLabel;
    tlNomeTitle: TLabel;
    tlPuntiTitle: TLabel;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    Label5: TLabel;
    tlGiocatore1: TLabel;
    tlGiocatore2: TLabel;
    tlGiocatore3: TLabel;
    tlGiocatore4: TLabel;
    tlGiocatore5: TLabel;
    tlPunti1: TLabel;
    tlPunti2: TLabel;
    tlPunti3: TLabel;
    tlPunti4: TLabel;
    tlPunti5: TLabel;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form2: TForm2;

implementation

uses MainUnit;

{$R *.dfm}

end.
