program StampaQR;

uses
  Forms,
  UfmEstratti in 'UfmEstratti.pas' {FmEstratti},
  UQrStampa in 'UQrStampa.pas' {QrStampa: TQuickRep};

{$R *.RES}

begin
  Application.Initialize;
  Application.CreateForm(TFmEstratti, FmEstratti);
  Application.CreateForm(TQrStampa, QrStampa);
  Application.Run;
end.
