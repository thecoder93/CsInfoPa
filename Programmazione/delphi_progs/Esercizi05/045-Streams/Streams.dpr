program Streams;

uses
  Forms,
  UFmStreams in 'UFmStreams.pas' {FmStreams},
  LabStreams in 'LabStreams.pas';

{$R *.RES}

begin
  Application.Initialize;
  Application.CreateForm(TFmStreams, FmStreams);
  Application.Run;
end.
