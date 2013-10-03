program Editor;

uses
  Forms,
  fmEdit in 'fmEdit.pas' {fmEditor};

{$R *.RES}

begin
  Application.Initialize;
  Application.CreateForm(TfmEditor, fmEditor);
  Application.Run;
end.
