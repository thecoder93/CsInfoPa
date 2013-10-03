unit UQrStampa;

interface

uses Windows, SysUtils, Messages, Classes, Graphics, Controls,
  StdCtrls, ExtCtrls, Forms, Quickrpt, QRCtrls;

type
  TQrStampa = class(TQuickRep)
    QRBandMastrino: TQRBand;
    QRDescrizione: TQRDBText;
    QRLabel1: TQRLabel;
    QRSaldo: TQRDBText;
    QRBandDettaglio: TQRSubDetail;
    QRData: TQRDBText;
    QRMotivo: TQRDBText;
    QRImporto: TQRDBText;
    QRBand1: TQRBand;
    QRLabel2: TQRLabel;
    QRSysData1: TQRSysData;
    QRBand2: TQRBand;
    QRExpr1: TQRExpr;
    QRLabel3: TQRLabel;
  private

  public

  end;

var
  QrStampa: TQrStampa;

implementation

{$R *.DFM}

end.
