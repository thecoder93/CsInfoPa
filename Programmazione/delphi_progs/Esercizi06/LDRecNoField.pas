unit LDRecNoField;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  Db;

type
  TLDRecNoField = class(TIntegerField)
  protected
    function GetAsInteger: Longint; override;
    procedure GetText(var Text: string; DisplayText: Boolean); override;
  public
    constructor Create(AOwner: TComponent); override;
  published
    property FieldKind default fkAggregate;
  end;

procedure Register;

implementation

procedure Register;
begin
  RegisterFields([TLDRecNoField]);
end;

{ TLDRecNoField }

constructor TLDRecNoField.Create(AOwner: TComponent);
begin
  inherited;
  FieldKind := fkAggregate;
end;

function TLDRecNoField.GetAsInteger: Longint;
begin
  Result := DataSet.RecNo;
end;

procedure TLDRecNoField.GetText(var Text: string; DisplayText: Boolean);
begin
  Text := IntToStr(GetAsInteger);
end;

end.
