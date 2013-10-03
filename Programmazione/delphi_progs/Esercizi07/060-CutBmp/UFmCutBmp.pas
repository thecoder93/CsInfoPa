unit UFmCutBmp;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  ComCtrls, StdCtrls, ExtCtrls, Spin, ExtDlgs;

type
  TFmCutBmp = class(TForm)
    Label1: TLabel;
    EtSrcFileName: TEdit;
    Label2: TLabel;
    EtDestFileName: TEdit;
    PbBrowseSrc: TButton;
    PbBrowseDest: TButton;
    PbGo: TButton;
    EtY: TSpinEdit;
    Label3: TLabel;
    Label4: TLabel;
    EtX: TSpinEdit;
    ImCurrent: TImage;
    OdSrc: TOpenPictureDialog;
    SdDest: TSavePictureDialog;
    procedure PbBrowseSrcClick(Sender: TObject);
    procedure PbBrowseDestClick(Sender: TObject);
    procedure PbGoClick(Sender: TObject);
  private
    procedure CutBmp(Src, Dest1: string; NumCols, NumRows: Integer;
      Progress: TImage = nil);
  public
    { Public declarations }
  end;

var
  FmCutBmp: TFmCutBmp;

implementation

{$R *.DFM}

procedure TFmCutBmp.PbBrowseSrcClick(Sender: TObject);
begin
  if OdSrc.Execute then
    EtSrcFileName.Text := OdSrc.FileName;
end;

procedure TFmCutBmp.PbBrowseDestClick(Sender: TObject);
begin
  if SdDest.Execute then
    EtDestFileName.Text := SdDest.FileName;
end;

procedure TFmCutBmp.PbGoClick(Sender: TObject);
begin
  CutBmp(EtSrcFileName.Text, EtDestFileName.Text,
    EtX.Value, EtY.Value, ImCurrent);
  ShowMessage('Operazione completata.');
end;

procedure TFmCutBmp.CutBmp(Src, Dest1: string;
  NumCols, NumRows: Integer; Progress: TImage = nil);
var
  SrcBmp, CurrentBmp: TBitmap;
  BlockWidth, BlockHeight: Integer;
  x, y, FileIndex: Integer;
begin
  // Un buffer per ospitare l'immagine sorgente.
  SrcBmp := TBitmap.Create;
  try
    SrcBmp.LoadFromFile(Src);
    BlockWidth := SrcBmp.Width div NumCols;
    BlockHeight := SrcBmp.Height div NumRows;
    // Un buffer per ciascun blocco.
    CurrentBmp := TBitmap.Create;
    try
      CurrentBmp.Width := BlockWidth;
      CurrentBmp.Height := BlockHeight;
      CurrentBmp.Canvas.CopyMode := cmSrcCopy;
      FileIndex := 0;
      // Per ogni riga e colonna...
      for y := 0 to Pred(NumRows) do begin
        for x := 0 to Pred(NumCols) do begin
          // ...copio un rettangolo dal buffer sorgente a
          // quello corrente...
          CurrentBmp.Canvas.CopyRect(
            Rect(0, 0, CurrentBmp.Width, CurrentBmp.Height),
            SrcBmp.Canvas, Rect(x * BlockWidth, y * BlockHeight,
              x * BlockWidth + BlockWidth - 1, y * BlockHeight + BlockHeight - 1));
          // ...e lo mostro nel componente Image passato.
          if Assigned(Progress) then begin
            Progress.Picture.Assign(CurrentBmp);
            Progress.Update;
          end;
          // Salvo l'immagine su file.
          CurrentBmp.SaveToFile(ChangeFileExt(Dest1, Format('%3.3d.bmp', [FileIndex])));
          Inc(FileIndex);
        end;
      end;
    finally
      CurrentBmp.Free;
    end;
  finally
    SrcBmp.Free;
  end;
end;

end.
