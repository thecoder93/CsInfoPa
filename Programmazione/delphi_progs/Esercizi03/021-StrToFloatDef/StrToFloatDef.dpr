program StrToFloatDef;

uses
  Forms,
  UfmStrToFloatDef in 'UfmStrToFloatDef.pas' {Form1},
  Stringhe in 'Stringhe.pas';

{$R *.RES}

begin
  Application.Initialize;
  Application.CreateForm(TForm1, Form1);
  Application.Run;
end.
