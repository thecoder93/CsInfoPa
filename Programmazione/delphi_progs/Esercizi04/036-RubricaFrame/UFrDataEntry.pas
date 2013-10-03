unit UFrDataEntry;

interface

uses 
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, Mask, DBCtrls;

type
  TFrDataEntry = class(TFrame)
    StNome: TLabel;
    EtNome: TDBEdit;
    StIndirizzo: TLabel;
    EtIndirizzo: TDBEdit;
    StEMail: TLabel;
    EtEMail: TDBEdit;
    StTelefono: TLabel;
    EtTelefono: TDBEdit;
    StCellulare: TLabel;
    EtCellulare: TDBEdit;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

implementation

{$R *.DFM}

end.
