unit UFmSlideShow;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, ExtCtrls, SlideShow;

type
  TFmSlideShow = class(TForm)
    BtSlideShow: TButton;
    OdSlide: TOpenDialog;
    ImSlideShow: TImage;
    Bevel1: TBevel;
    BtInterrompi: TButton;
    CkContinuo: TCheckBox;
    procedure BtSlideShowClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
    procedure BtInterrompiClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
  private
    SS: TMotoreSlideShow;
  public
    { Public declarations }
  end;

var
  FmSlideShow: TFmSlideShow;

implementation

{$R *.DFM}

procedure TFmSlideShow.FormCreate(Sender: TObject);
begin
  SS := TMotoreSlideShow.Create;
end;

procedure TFmSlideShow.FormDestroy(Sender: TObject);
begin
  SS.Free;
end;

procedure TFmSlideShow.BtSlideShowClick(Sender: TObject);
begin
  BtInterrompi.Click;
  if OdSlide.Execute then begin
    SS.Continuo := CkContinuo.Checked;
    SS.AvviaSlideShow(OdSlide.FileName, ImSlideShow);
  end;
end;

procedure TFmSlideShow.BtInterrompiClick(Sender: TObject);
begin
  SS.TerminaSlideShow;
end;

procedure TFmSlideShow.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  BtInterrompi.Click;
end;

end.
