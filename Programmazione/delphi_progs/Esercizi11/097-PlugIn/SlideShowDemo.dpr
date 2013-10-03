program SlideShowDemo;

uses
  ShareMem,
  Forms,
  UFmSlideShow in 'UFmSlideShow.pas' {FmSlideShow},
  SlideShow in 'SlideShow.pas';
{
  // Unit trasferite in DLL esterne:
  Effetti in 'Effetti.pas',
  EffettiABlocchi in 'EffettiABlocchi.pas',
  EffettiDiSovrapposizione in 'EffettiDiSovrapposizione.pas';
}

{$R *.RES}

begin
  Application.Initialize;
  Application.CreateForm(TFmSlideShow, FmSlideShow);
  Application.Run;
end.
