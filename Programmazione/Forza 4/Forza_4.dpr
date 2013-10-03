program Forza_4;

uses
  Forms,
  quattro in 'quattro.pas' {Form1},
  sts in 'sts.pas' {Form2};

{$R *.RES}

begin
  Application.Initialize;
  Application.CreateForm(TForm1, Form1);
  Application.Run;
end.
