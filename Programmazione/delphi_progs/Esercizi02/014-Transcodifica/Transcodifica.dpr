program Transcodifica;

uses
  Forms,
  UfmTranscodifica in 'UfmTranscodifica.pas' {fmTranscodifica};

{$R *.RES}

begin
  Application.Initialize;
  Application.CreateForm(TfmTranscodifica, fmTranscodifica);
  Application.Run;
end.
