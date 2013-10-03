program Movimenti;

uses
  Forms,
  UfmMovimenti in 'UfmMovimenti.pas' {fmMovimenti},
  UdmDati in 'UdmDati.pas' {dmDati: TDataModule};

{$R *.RES}

begin
  Application.Initialize;
  Application.CreateForm(TfmMovimenti, fmMovimenti);
  Application.CreateForm(TdmDati, dmDati);
  Application.Run;
end.
