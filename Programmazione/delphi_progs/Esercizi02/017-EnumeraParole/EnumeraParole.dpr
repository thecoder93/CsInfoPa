program EnumeraParole;

uses
  Forms,
  Stringhe in 'Stringhe.pas',
  UfmEditor in 'UfmEditor.pas' {fmEditor};

{$R *.RES}

begin
  Application.Initialize;
  Application.CreateForm(TfmEditor, fmEditor);
  Application.Run;
end.
