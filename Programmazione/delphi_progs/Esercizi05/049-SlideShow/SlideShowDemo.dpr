program SlideShowDemo;

uses
  Forms,
  UFmSlideShow in 'UFmSlideShow.pas' {FmSlideShow},
  SlideShow in 'SlideShow.pas',
  Effetti in 'Effetti.pas';

{$R *.RES}

begin
  Application.Initialize;
  Application.CreateForm(TFmSlideShow, FmSlideShow);
  Application.Run;
end.
