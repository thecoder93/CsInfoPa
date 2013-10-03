unit UFmSpegni;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls;

type
  TFmSpegni = class(TForm)
    BtSpegni: TButton;
    procedure BtSpegniClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FmSpegni: TFmSpegni;

implementation

{$R *.DFM}

uses
  USpegniComputer;

procedure TFmSpegni.BtSpegniClick(Sender: TObject);
begin
  if not SpegniPC then
    ShowMessage( 'Impossibile spegnere il computer' );
end;

end.
