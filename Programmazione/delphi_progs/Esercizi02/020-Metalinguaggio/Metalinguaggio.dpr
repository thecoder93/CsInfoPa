program Metalinguaggio;

uses
  Forms,
  UfmMetalinguaggio in 'UfmMetalinguaggio.pas' {fmMetalinguaggio};

{$R *.RES}

begin
  Application.Initialize;
  Application.CreateForm(TfmMetalinguaggio, fmMetalinguaggio);
  Application.Run;
end.
