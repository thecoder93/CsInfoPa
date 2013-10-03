program IndovinaLaCombinazione;

uses
  Forms,
  MainUnit in 'MainUnit.pas' {Form1},
  ComboUnit in 'ComboUnit.pas' {Form2};

{$R *.res}

begin
  Application.Initialize;
  Application.CreateForm(TForm1, Form1);
  Application.CreateForm(TForm2, Form2);
  Application.Run;
end.
