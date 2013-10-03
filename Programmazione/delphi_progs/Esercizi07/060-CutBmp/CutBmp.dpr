program CutBmp;

uses
  Forms,
  UFmCutBmp in 'UFmCutBmp.pas' {FmCutBmp};

{$R *.RES}

begin
  Application.Initialize;
  Application.CreateForm(TFmCutBmp, FmCutBmp);
  Application.Run;
end.
