program InternetTOD;

{$APPTYPE CONSOLE}

uses
  WebBroker,
  CGIApp,
  UWmTOD in 'UWmTOD.pas' {WmTOD: TWebModule};

begin
  Application.Initialize;
  Application.CreateForm(TWmTOD, WmTOD);
  Application.Run;
end.
