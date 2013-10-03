unit USpegniComputer;

interface

uses
  Windows, Messages, SysUtils;

// tenta di spegnere il PC, restituendo
// False se non è possibile farlo
function SpegniPC: boolean;

implementation

// per assumere o cedere un privilegio
function SetPrivilege( NomePrivilegio: string;
  Abilita: boolean): boolean;
var
  tpPrev, tp : TTokenPrivileges;
  token : THandle;
  dwRetLen : DWord;
begin
  Result := False;
// richiedo il token per cambiare i privilegi
  OpenProcessToken(GetCurrentProcess,
      TOKEN_ADJUST_PRIVILEGES or TOKEN_QUERY, token);
  tp.PrivilegeCount := 1;
// richiedo il nome del privilegio desiderato
  if LookupPrivilegeValue(nil, PChar(NomePrivilegio),
      tp.Privileges[0].LUID) then begin
  // lo voglio abilitare o disabilitare?
    if Abilita then
      tp.Privileges[0].Attributes := SE_PRIVILEGE_ENABLED
    else
      tp.Privileges[0].Attributes := 0;
    dwRetLen := 0;
  // cambio i privilegi del token del processo
    Result := AdjustTokenPrivileges(token, False, tp,
        SizeOf(tpPrev), tpPrev, dwRetLen);
  end;
// chiudo il token
  CloseHandle(token);
end;

function SpegniPC: boolean;
begin
// assumo il privilegio di spegnere il computer
  SetPrivilege('SeShutdownPrivilege', True);
  try
  // forzo lo shutdown e lo spegnimento fisico (se supportato)
    Result := ExitWindowsEx(EWX_SHUTDOWN or
      EWX_POWEROFF or EWX_FORCE, 0);
  finally
  // restituisco il privilegio alla fine
    SetPrivilege('SeShutdownPrivilege', False);
  end;
end;

end.
