program Editor;

uses
  Forms,
  fmEdit in 'fmEdit.pas' {fmEditor};

{$R *.RES}

begin
  Application.Initialize;
  Application.CreateForm(TfmEditor, fmEditor);
  // carico il file passato come parametro
  if ParamCount > 0 then
    fmEditor.CaricaFile( ParamStr( 1 ) );
  Application.Run;
end.
