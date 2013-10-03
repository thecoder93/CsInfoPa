unit UFmFileJoin;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  ComCtrls, StdCtrls;

type
  TFmFileJoin = class(TForm)
    Label1: TLabel;
    Label2: TLabel;
    LbFileNames: TListBox;
    PbAddFile: TButton;
    PbDeleteFile: TButton;
    EtDestFileName: TEdit;
    PbBrowse: TButton;
    PbJoin: TProgressBar;
    PbDeleteAllFiles: TButton;
    PbGo: TButton;
    procedure PbAddFileClick(Sender: TObject);
    procedure PbDeleteFileClick(Sender: TObject);
    procedure PbBrowseClick(Sender: TObject);
    procedure PbDeleteAllFilesClick(Sender: TObject);
    procedure PbGoClick(Sender: TObject);
  private
    procedure AfterEachFile(Sender: TObject);
  public
  end;

var
  FmFileJoin: TFmFileJoin;

implementation

{$R *.DFM}

procedure JoinFiles(FileNames: TStrings; const DestFileName: string;
  AfterEachFile: TNotifyEvent);
var
  g: Integer;
  Src, Dest: TStream;
begin
  // Verifico la bontà dei dati di input.
  if not Assigned(FileNames) or (FileNames.Count = 0) then
    raise Exception.Create('Elenco file da concatenare non indicato.');
  if DestFileName = '' then
    raise Exception.Create('Nome file destinazione non indicato.');
  Dest := TFileStream.Create(DestFileName, fmCreate);
  try
    for g := 0 to Pred(FileNames.Count) do begin
      Src := TFileStream.Create(FileNames[g], fmOpenRead + fmShareDenyWrite);
      try
        // Copio l'intero contenuto di Src in Dest.
        Dest.CopyFrom(Src, 0);
      finally
        Src.Free;
      end;
      if Assigned(AfterEachFile) then
        AfterEachFile(nil);
    end;
  finally
    Dest.Free;
  end;
end;

procedure TFmFileJoin.PbAddFileClick(Sender: TObject);
begin
  // Creo un dialogo multiselezione, lo mostro e aggiungo i nomi
  // dei file selezionati all'elenco.
  with TOpenDialog.Create(Self) do begin
    Options := Options + [ofPathMustExist, ofFileMustExist, ofAllowMultiSelect];
    try
      if Execute then
        LbFileNames.Items.AddStrings(Files);
    finally
      Free;
    end;
  end;
end;

procedure TFmFileJoin.PbDeleteFileClick(Sender: TObject);
begin
  // Elimino l'elemento corrente dell'elenco.
  if LbFileNames.ItemIndex >= 0 then
    LbFileNames.Items.Delete(LbFileNames.ItemIndex);
end;

procedure TFmFileJoin.PbDeleteAllFilesClick(Sender: TObject);
begin
  // Elimino tutti gli elementi dell'elenco.
  LbFileNames.Items.Clear;
end;

procedure TFmFileJoin.PbBrowseClick(Sender: TObject);
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

procedure TFmFileJoin.PbGoClick(Sender: TObject);
begin
  PbJoin.Max := LbFileNames.Items.Count;
  PbJoin.Position := 0;
  JoinFiles(LbFileNames.Items, EtDestFileName.Text, AfterEachFile);
  ShowMessage('Operazione completata.');
end;

procedure TFmFileJoin.AfterEachFile(Sender: TObject);
begin
  PbJoin.StepIt;
end;

end.
