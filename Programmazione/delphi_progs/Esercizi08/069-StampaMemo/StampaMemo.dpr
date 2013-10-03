program StampaMemo;

uses
  Forms,
  UFmStampaMemo in 'UFmStampaMemo.pas' {FmStampaMemo},
  UStampa in 'UStampa.pas';

{$R *.RES}

begin
  Application.Initialize;
  Application.CreateForm(TFmStampaMemo, FmStampaMemo);
  Application.Run;
end.
