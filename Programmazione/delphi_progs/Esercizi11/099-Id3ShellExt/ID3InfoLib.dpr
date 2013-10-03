library ID3InfoLib;

uses
  ComServ,
  ID3ContextMenu in 'ID3ContextMenu.pas',
  UFmID3Info in 'UFmID3Info.pas' {FmID3Info},
  ID3Tag in 'ID3Tag.pas',
  ID3InfoLib_TLB in 'ID3InfoLib_TLB.pas';

exports
  DllGetClassObject,
  DllCanUnloadNow,
  DllRegisterServer,
  DllUnregisterServer;

{$R *.TLB}

{$R *.RES}

begin
end.
