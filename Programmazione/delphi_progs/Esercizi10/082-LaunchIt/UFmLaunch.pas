unit UFmLaunch;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, Buttons;

type
  TFmLaunch = class(TForm)
    Label1: TLabel;
    EtFileName: TEdit;
    SbFileName: TSpeedButton;
    BbStart: TBitBtn;
    CkWait: TCheckBox;
    procedure SbFileNameClick(Sender: TObject);
    procedure BbStartClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FmLaunch: TFmLaunch;

implementation

{$R *.DFM}

uses
  ShellAPI;

procedure ExecuteAndWait(FileName: string; Wait: Boolean);
var
  SEI: TShellExecuteInfo;
begin
  // Inizializzo la struttura con i parametri.
  FillChar(SEI, SizeOf(SEI), #0);
  SEI.cbSize := SizeOf(SEI);
  if Wait then
    // Questo flag è necessario perché il campo
    // hProcess venga restituito in output.
    SEI.fMask := SEE_MASK_NOCLOSEPROCESS;
  SEI.lpFile := PChar(FileName);
  // Per mostrare l'applicazione lanciata.
  SEI.nShow := SW_NORMAL;
  if ShellExecuteEx(@SEI) then begin
    if Wait then
      // Aspetto che il processo termini.
      WaitForSingleObject(SEI.hProcess, INFINITE);
    CloseHandle(SEI.hProcess);
  end;
end;

procedure TFmLaunch.SbFileNameClick(Sender: TObject);
begin
  with TOpenDialog.Create(Self) do begin
    try
      FileName := EtFileName.Text;
      if Execute then
        EtFileName.Text := FileName;
    finally
      Free;
    end;
  end;
end;

procedure TFmLaunch.BbStartClick(Sender: TObject);
begin
  ExecuteAndWait(EtFileName.Text, CkWait.Checked);
  if CkWait.Checked then
    ShowMessage('Esecuzione terminata.');
end;

end.
