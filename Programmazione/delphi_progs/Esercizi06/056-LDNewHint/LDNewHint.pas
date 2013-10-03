unit LDNewHint;

interface

uses
  Windows, Messages, Classes, Controls, ExtCtrls;

type
  TLDNewHintWindow = class(THintWindow)
  protected
    // Chiamata alla disattivazione della finestra di Hint.
    procedure WnShowWindow(var Msg: TWMShowWindow); message WM_SHOWWINDOW;
  public
    // Chiamata all'attivazione della finestra di Hint.
    procedure ActivateHint(Rect: TRect; const AHint: string); override;
  end;

var
  // Ritardo per la chiusura animata.
  LDHintHideDelay: Integer = 10;

implementation

uses
  Forms;

{ TLDNewHintWindow }

procedure TLDNewHintWindow.ActivateHint(Rect: TRect; const AHint: string);
begin
  // Apertura con effetto sonoro standard di sistema.
  MessageBeep(MB_OK);
  inherited;
end;

procedure TLDNewHintWindow.WnShowWindow(var Msg: TWMShowWindow);
var
  x: Integer;
begin
  // Chiusura animata.
  // Se il messaggio indica che si sta nascondendo la finestra...
  if not Msg.Show then
    // ...riduco le dimensioni gradualmente.
    for x := Width div 2 downto 0 do begin
      SetBounds(Left + 1, Top + 1, Width - 2, Height - 2);
      if (Width <= 0) or (Height <= 0) then
        Break;
      Update;
      Sleep(LDHintHideDelay);
    end;
end;

initialization
  // Così facendo l'applicazione utilizza la
  // nuova classe per le finestre di Hint.
  Forms.HintWindowClass := TLDNewHintWindow;

end.
