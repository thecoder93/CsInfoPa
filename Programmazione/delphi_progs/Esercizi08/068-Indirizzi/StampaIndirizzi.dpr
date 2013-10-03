program StampaIndirizzi;

uses
  Forms,
  UFmRubrica in 'UFmRubrica.pas' {FmRubrica},
  UFmStampa in 'UFmStampa.pas' {FmStampa};

{$R *.RES}

begin
  Application.Initialize;
  Application.CreateForm(TFmRubrica, FmRubrica);
  Application.Run;
end.
