program MostraID3;

uses
  Forms,
  UFmID3Info in 'UFmID3Info.pas' {FmID3Info},
  ID3Tag in 'ID3Tag.pas',
  UFmMain in 'UFmMain.pas' {FmMain};

{$R *.RES}

begin
  Application.Initialize;
  Application.CreateForm(TFmMain, FmMain);
  Application.Run;
end.
