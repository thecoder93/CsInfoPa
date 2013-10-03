unit LDHyperlinkLabel;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls;

type
  TLDHyperlinkLabel = class(TLabel)
  private
    FActiveColor: TColor;
    FOldColor: TColor;
  protected
    procedure CmMouseEnter(var Message: TMessage); message CM_MOUSEENTER;
    procedure CmMouseLeave(var Message: TMessage); message CM_MOUSELEAVE;
    procedure Click; override;
  public
    constructor Create(AOwner: TComponent); override;
  published
    property ActiveColor: TColor read FActiveColor write FActiveColor default clYellow;
  end;

procedure Register;

implementation

uses
  ShellAPI;

procedure Register;
begin
  RegisterComponents('LabDelphi', [TLDHyperlinkLabel]);
end;

{ TLDHyperlinkLabel }

procedure TLDHyperlinkLabel.Click;
begin
  inherited;
  ShellExecute(Parent.Handle, 'open', PChar(Caption), '', '', SW_NORMAL);
end;

procedure TLDHyperlinkLabel.CmMouseEnter(var Message: TMessage);
begin
  inherited;
  // Memorizzo il vecchio colore e lo cambio.
  FOldColor := Font.Color;
  Font.Color := FActiveColor;
end;

procedure TLDHyperlinkLabel.CmMouseLeave(var Message: TMessage);
begin
  inherited;
  // Ripristino il colore memorizzato.
  Font.Color := FOldColor;
end;

constructor TLDHyperlinkLabel.Create(AOwner: TComponent);
begin
  inherited;
  FActiveColor := clYellow;
  Cursor := crHandPoint;
  Font.Color := clBlue;
  Font.Style := Font.Style + [fsUnderline];
  FOldColor := Font.Color;
end;

end.
