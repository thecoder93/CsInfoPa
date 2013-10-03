program Esame_Nadia_Luglio_05;

uses
  Forms,
  regola110 in 'regola110.pas' {Form1};

{$R *.res}

begin
  Application.Initialize;
  Application.CreateForm(TForm1, Form1);
  Application.Run;
end.
