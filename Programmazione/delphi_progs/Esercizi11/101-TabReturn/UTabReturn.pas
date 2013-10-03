unit UTabReturn;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls,
  Forms, Dialogs, StdCtrls, ExtCtrls;

// Questa unit non ha nulla nella parte interface;
// basta aggiungerla ad una clausola uses per metterla in azione
// (ved. sezioni initialization e finalization).

implementation

var
  HookHandle : integer = 0;

// funzione di hook
function HookProc(code: Integer; wParam: WPARAM;
  lParam: LPARAM): LRESULT stdcall;
var
  AttCntl: TWinControl;
begin
// solo se Result è 0 l'applicazione riceve
// il messaggio di tastiera
  Result := 0;
// se code è negativo bisogna chiamare il prossimo hook
  if code < 0 then
    Result := CallNextHookEx( HookHandle, code, wParam, lParam )
// altrimenti, se il messaggio è KeyDown
// e il tasto è Invio, lo intecettiamo
  else if Assigned( Screen.ActiveForm ) and
          (lParam and $80000000 = 0 ) and
          (wParam = VK_RETURN ) then begin
  // riferimento al controllo che ha il focus
    AttCntl := Screen.ActiveForm.ActiveControl;
  // se è un Edit ma non un Memo...
    if ( AttCntl is TCustomEdit ) and not
       ( AttCntl is TCustomMemo ) then begin
  // ...sostituisco il messaggio con un altro che indica
  // di passare al controllo successivo
      Result := 1;
      SendMessage( Screen.ActiveForm.Handle, WM_NEXTDLGCTL, 0, 0)
    end;
  end;
end;

initialization
begin
// collego l'hook per il thread corrente
  HookHandle := SetWindowsHookEx( WH_KEYBOARD,
    HookProc, 0, GetCurrentThreadId );
end;

finalization
begin
// scollego l'hook alla fine
  UnhookWindowsHookEx( HookHandle );
end;

end.
