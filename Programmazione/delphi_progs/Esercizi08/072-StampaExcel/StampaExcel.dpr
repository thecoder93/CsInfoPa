program StampaExcel;

uses
  Forms,
  UfmEstratti in 'UfmEstratti.pas' {FmEstratti};

{$R *.RES}

begin
  Application.Initialize;
  Application.CreateForm(TFmEstratti, FmEstratti);
  Application.Run;
end.
