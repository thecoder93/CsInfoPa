program Profiler;

uses
  Forms,
  UFmProfiler in 'UFmProfiler.pas' {FmProfiler},
  UProfiler in 'UProfiler.pas';

{$R *.RES}

begin
  Application.Initialize;
  Application.CreateForm(TFmProfiler, FmProfiler);
  Application.Run;
end.
