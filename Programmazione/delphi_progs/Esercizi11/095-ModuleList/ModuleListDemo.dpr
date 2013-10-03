program ModuleListDemo;

uses
  Forms,
  UFmModuleListDemo in 'UFmModuleListDemo.pas' {FmModuleListDemo};

{$R *.RES}

begin
  Application.Initialize;
  Application.CreateForm(TFmModuleListDemo, FmModuleListDemo);
  Application.Run;
end.
