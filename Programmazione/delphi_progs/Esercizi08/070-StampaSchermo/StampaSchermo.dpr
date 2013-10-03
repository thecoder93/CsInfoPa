program StampaSchermo;

uses
  Forms,
  UStampaSchermo in 'UStampaSchermo.pas';

{$R *.RES}

begin
// non faccio partire il ciclo principale...
//  Application.Initialize;
//  Application.Run;
// ...e chiamo subito la mia funzione
  StampaDesktop;
end.
