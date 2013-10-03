program GiocoDel15;

uses
  Forms,
  UFm15 in 'UFm15.pas' {Fm15};

{$R *.RES}

begin
  Application.Initialize;
  Application.CreateForm(TFm15, Fm15);
  Application.Run;
end.
