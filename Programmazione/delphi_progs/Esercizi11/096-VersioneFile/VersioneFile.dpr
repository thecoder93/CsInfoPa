program VersioneFile;

uses
  Forms,
  UFmVersioneFile in 'UFmVersioneFile.pas' {FmVersioneFile},
  UVersioneFile in 'UVersioneFile.pas';

{$R *.RES}

begin
  Application.Initialize;
  Application.CreateForm(TFmVersioneFile, FmVersioneFile);
  Application.Run;
end.
