program cnv2;

uses
  Forms,
  conv in 'conv.pas' {fmConverti};

{$R *.RES}

begin
  Application.Initialize;
  Application.CreateForm(TfmConverti, fmConverti);
  Application.Run;
end.
