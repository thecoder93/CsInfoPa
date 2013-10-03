unit UFrRighe;

interface

uses 
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, DBCtrls, Buttons;

type
  TFrRighe = class(TFrame)
    EtMastrini: TDBLookupComboBox;
    EtImporto: TEdit;
    LbProg: TLabel;
    BtMeno: TSpeedButton;
    procedure EtImportoKeyPress(Sender: TObject; var Key: Char);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

implementation

{$R *.DFM}

procedure TFrRighe.EtImportoKeyPress(Sender: TObject; var Key: Char);
begin
  // accetta solo numeri o il separatore decimale
  // altrimenti emette un suono d'errore
  if not( ( Key in ['0'..'9'] ) or ( Key = DecimalSeparator ) ) then begin
    Key := #0;
    MessageBeep( 0 );
  end;
end;

end.
