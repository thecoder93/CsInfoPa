program StampaIndirizzi;

uses
  Forms,
  UFmRubrica in 'UFmRubrica.pas' {FmRubrica};

{$R *.RES}

begin
  Application.Initialize;
  Application.CreateForm(TFmRubrica, FmRubrica);
  Application.Run;
end.
