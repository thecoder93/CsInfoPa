program SlideShowDemo;

uses
  Forms,
  UFmSlideShow in 'UFmSlideShow.pas' {FmSlideShow},
  SlideShow in 'SlideShow.pas',
  Effetti in 'Effetti.pas',
  EffettiABlocchi in 'EffettiABlocchi.pas',
  EffettiDiSovrapposizione in 'EffettiDiSovrapposizione.pas';

{$R *.RES}

begin
  Application.Initialize;
  Application.CreateForm(TFmSlideShow, FmSlideShow);
  Application.Run;
end.
