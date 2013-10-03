unit UFmFileSplit;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, ComCtrls;

type
  TFmFileSplit = class(TForm)
    Label1: TLabel;
    EtSrcFileName: TEdit;
    PbBrowseSrc: TButton;
    Label2: TLabel;
    EtDestFileName: TEdit;
    PbBrowseDest: TButton;
    PbGo: TButton;
    PbSplit: TProgressBar;
    Label3: TLabel;
    CbSliceSize: TComboBox;
    procedure PbBrowseSrcClick(Sender: TObject);
    procedure PbBrowseDestClick(Sender: TObject);
    procedure PbGoClick(Sender: TObject);
  private
    procedure AfterEachSlice(Sender: TObject);
  public
    { Public declarations }
  end;

var
  FmFileSplit: TFmFileSplit;

implementation

{$R *.DFM}

procedure SplitFile(const SrcFileName, DestFileName: string;
  SliceSize: Integer; AfterEachSlice: TNotifyEvent);
var
  CurrentSlice: Integer;
  Src, Dest: TStream;
  Finished: Boolean;
  BytesToCopy, BytesCopied: Integer;

  function GetDestFileName(SliceNumber: Integer): string;
  begin
    if CurrentSlice = 0 then
      Result := DestFileName
    else
      Result := ChangeFileExt(DestFileName, Format('.%3.3d', [CurrentSlice]));
  end;

begin
  // Apro il file sorgente.
  Src := TFileStream.Create(SrcFileName, fmOpenRead or fmShareDenyWrite);
  try
    CurrentSlice := 0;
    BytesCopied := 0;
    Finished := False;
    while not Finished do begin
      // Apro il file destinazione del segmento CurrentSlice.
      Dest := TFileStream.Create(GetDestFileName(CurrentSlice), fmCreate);
      try
        // Se possibile copio un intero segmento, altrimenti
        // solo la rimanenza.
        if Src.Size - BytesCopied >= SliceSize then
          BytesToCopy := SliceSize
        else begin
          BytesToCopy := Src.Size - BytesCopied;
          Finished := True;
        end;
        // Copio il segmento.
        if BytesToCopy > 0 then begin
          Dest.CopyFrom(Src, BytesToCopy);
          Inc(CurrentSlice);
          Inc(BytesCopied, BytesToCopy);
        end;
        // Notifico l'avvenuta copia.
        if Assigned(AfterEachSlice) then
          AfterEachSlice(nil);
      finally
        Dest.Free;
      end;
    end;
  finally
    Src.Free;
  end;
end;

function GetFileSize(FileName: string): Integer;
var
  F: file of Byte;
begin
  AssignFile(F, FileName);
  Reset(F);
  try
    Result := FileSize(F);
  finally
    CloseFile(F);
  end;
end;

procedure TFmFileSplit.PbBrowseSrcClick(Sender: TObject);
begin
  // Creo un dialogo per la scelta del file sorgente, lo
  // mostro e memorizzo il nome del file scelto.
  with TOpenDialog.Create(Self) do begin
    Options := Options + [ofPathMustExist, ofFileMustExist];
    try
      if Execute then
        EtSrcFileName.Text := FileName;
    finally
      Free;
    end;
  end;
end;

procedure TFmFileSplit.PbBrowseDestClick(Sender: TObject);
begin
  // Creo un dialogo per la scelta del file destinazione, lo
  // mostro e memorizzo il nome del file scelto.
  with TSaveDialog.Create(Self) do begin
    Options := Options + [ofOverwritePrompt, ofPathMustExist];
    try
      if Execute then
        EtDestFileName.Text := FileName;
    finally
      Free;
    end;
  end;
end;

procedure TFmFileSplit.PbGoClick(Sender: TObject);
var
  SliceSize: Integer;
begin
  // Imposto la progress-bar.
  SliceSize := StrToInt(CbSliceSize.Text);
  PbSplit.Max := (GetFileSize(EtSrcFileName.Text) div SliceSize) + 1;
  PbSplit.Position := 0;
  // Suddivido il file in segmenti.
  SplitFile(EtSrcFileName.Text, EtDestFileName.Text, SliceSize, AfterEachSlice);
  ShowMessage('Operazione completata.');
end;

procedure TFmFileSplit.AfterEachSlice(Sender: TObject);
begin
  // Un passo della progress-bar per ciascun segmento.
  PbSplit.StepIt;
end;

end.
