unit LDEdit;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls;

type
  TLDEdit = class(TEdit)
  private
  public
    // Per gestire la lista delle istanze.
    constructor Create(AOwner: TComponent); override;
    destructor Destroy; override;
    // Per gestire il colore globale.
    class procedure SetGlobalColor(Value: TColor);
    class function GetGlobalColor: TColor;
  published
    // Non salvo mai la proprietà Color nel file dfm.
    property Color stored False;
  end;

procedure Register;

implementation

procedure Register;
begin
  RegisterComponents('LabDelphi', [TLDEdit]);
end;

var
  // Colore globale.
  FGlobalColor: TColor = clWindow;
  // Lista delle istanze.
  FInstances: TList;

{ TLDEdit }

constructor TLDEdit.Create(AOwner: TComponent);
begin
  inherited Create(AOwner);
  FInstances.Add(Self);
  Color := FGlobalColor;
end;

destructor TLDEdit.Destroy;
begin
  FInstances.Remove(Self);
  inherited;
end;

class function TLDEdit.GetGlobalColor: TColor;
begin
  Result := FGlobalColor;
end;

class procedure TLDEdit.SetGlobalColor(Value: TColor);
var
  g: Integer;
begin
  if Value <> FGlobalColor then begin
    // Applico il colore a tutte le istanze.
    FGlobalColor := Value;
    for g := 0 to Pred(FInstances.Count) do
      TLDEdit(Finstances[g]).Color := FGlobalColor;
  end;
end;

// Gestione della lista di istanze.

initialization
  FInstances := TList.Create;

finalization
  FInstances.Free;

end.
