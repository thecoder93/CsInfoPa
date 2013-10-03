program SolitarioPedine;

uses
  Forms,
  MainUnit in 'MainUnit.pas' {Form1},
  ClassificaUnit in 'ClassificaUnit.pas' {Form2};

{$R *.res}

begin
  Application.Initialize;
  Application.CreateForm(TForm1, Form1);
  Application.Run;
end.
