program GridSuFile;

uses
  Forms,
  UfmTranscodifica in 'UfmTranscodifica.pas' {fmTranscodifica},
  Stringhe in 'Stringhe.pas';

{$R *.RES}

begin
  Application.Initialize;
  Application.CreateForm(TfmTranscodifica, fmTranscodifica);
  Application.Run;
end.
