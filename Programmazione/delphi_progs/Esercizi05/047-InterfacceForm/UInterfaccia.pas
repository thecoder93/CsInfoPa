unit UInterfaccia;

interface

uses
  Classes;

type
// interfaccia della form di dati
// cambiare il GUID con Ctrl+Shift+G
  IDataForm = interface
    ['{E24A1710-8283-11D4-86FE-0010DC1F52C0}']
    function GetRecordCorrente: string;
    procedure Risincronizza;
    procedure OnDataChange( Handler: TNotifyEvent );
  end;

implementation

end.
