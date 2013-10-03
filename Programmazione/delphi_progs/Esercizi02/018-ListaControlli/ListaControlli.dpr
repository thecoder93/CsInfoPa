program ListaControlli;

uses
  Forms,
  UfmListaControlli in 'UfmListaControlli.pas' {fmListaControlli},
  Unit1 in 'Unit1.pas' {Form1},
  Unit2 in 'Unit2.pas' {Form2};

{$R *.RES}

begin
  Application.Initialize;
  Application.CreateForm(TfmListaControlli, fmListaControlli);
  Application.CreateForm(TForm1, Form1);
  Application.CreateForm(TForm2, Form2);
  Application.Run;
end.
