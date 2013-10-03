program MailPreview;

uses
  Forms,
  UFmMailPreview in 'UFmMailPreview.pas' {FmMailPreview};

{$R *.RES}

begin
  Application.Initialize;
  Application.CreateForm(TFmMailPreview, FmMailPreview);
  Application.Run;
end.
