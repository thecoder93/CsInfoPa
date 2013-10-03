program FileJoin;

uses
  Forms,
  UFmFileJoin in 'UFmFileJoin.pas' {FmFileJoin};

{$R *.RES}

begin
  Application.Initialize;
  Application.CreateForm(TFmFileJoin, FmFileJoin);
  Application.Run;
end.
