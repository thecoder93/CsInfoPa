unit UFmDosOutput;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls;

type
  TFmDosOutput = class(TForm)
    EtCmdLine: TEdit;
    Label1: TLabel;
    Label2: TLabel;
    EtOutput: TMemo;
    procedure EtCmdLineKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
  private
  public
  end;

var
  FmDosOutput: TFmDosOutput;

implementation

{$R *.DFM}

// Restituisce un nome di file da utilizzare
// per dati temporanei.
function GetTemporaryFileName: string;
var
  Buffer: array[0..MAX_PATH] of Char;
begin
  Result := '';
  FillChar(Buffer, SizeOf(Buffer), #0);
  if GetTempFileName('.', '', 0, Buffer) <> 0 then
    Result := Buffer;
end;

// restituisce il valore della variabile
// d'ambiente indicata.
function GetEnvValue(VariableName: string): string;
var
  Buffer: array[0..MAX_PATH] of Char;
begin
  Result := '';
  FillChar(Buffer, SizeOf(Buffer), #0);
  if GetEnvironmentVariable(PChar(VariableName), Buffer, SizeOf(Buffer)) <> 0 then
    Result := Buffer;
end;

// Esegue la riga di comando passata e ne carica l'output
// nella variabile Output.
procedure ExecuteCmdLine(CmdLine: string; Output: TStrings);
var
  OutputFileName: string;
  StartupInfo: TStartupInfo;
  ProcessInfo: TProcessInformation;
begin
  // Prima di tutto, mi procuro un nome di file temporaneo da usare per
  // redirigere l'output.
  OutputFileName := GetTemporaryFileName;
  try
    // Occorre identificare l'esecutore di comandi (COMSPEC)
    // per poter eseguire anche i comandi interni, come Dir.
    CmdLine := GetEnvValue('COMSPEC') + ' /C ' + CmdLine + ' > "' + OutputFileName + '"';
    // Riempio StartupInfo con valori di default.
    GetStartupInfo(StartupInfo);
    // Per non mostrare la console.
    StartupInfo.dwFlags := STARTF_USESHOWWINDOW;
    StartupInfo.wShowWindow := 0;
    // Eseguo la riga di comando.
    Win32Check(CreateProcess(nil, PChar(CmdLine), nil, nil,
      False, 0, nil, nil, StartupInfo, ProcessInfo));
    try
      // Attendo il termine del comando.
      WaitForInputIdle(ProcessInfo.hProcess, INFINITE);
      WaitForSingleObject(ProcessInfo.hProcess, INFINITE);
    finally
      // Rilascio gli handle allocati.
      CloseHandle(ProcessInfo.hThread);
      CloseHandle(ProcessInfo.hProcess);
    end;
    // Carico l'output.
    Output.LoadFromFile(OutputFileName);
  finally
    // Pulizia.
    if FileExists(OutputFileName) then
      DeleteFile(OutputFileName);
  end;
end;

procedure TFmDosOutput.EtCmdLineKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if Key = VK_RETURN then
    ExecuteCmdLine(EtCmdLine.Text, EtOutput.Lines);
end;

end.
