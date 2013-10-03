program PartyPlanner;

uses
  Forms,
  MainUnit in 'MainUnit.pas' {Form1},
  InserimentoUnit in 'InserimentoUnit.pas' {Form2},
  classifica in 'classifica.pas' {Form3};

{$R *.res}

begin
  Application.Initialize;
  Application.CreateForm(TForm1, Form1);
  Application.CreateForm(TForm2, Form2);
  Application.CreateForm(TForm3, Form3);
  Application.Run;
end.
