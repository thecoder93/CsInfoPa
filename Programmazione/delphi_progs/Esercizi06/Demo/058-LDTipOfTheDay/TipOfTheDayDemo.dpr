program TipOfTheDayDemo;

uses
  Forms,
  UFmTipOfTheDayDemo in 'UFmTipOfTheDayDemo.pas' {FmTipOfTheDay};

{$R *.RES}

begin
  Application.Initialize;
  Application.CreateForm(TFmTipOfTheDay, FmTipOfTheDay);
  Application.Run;
end.
