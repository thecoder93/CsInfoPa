program Movimenti2;

uses
  Forms,
  UfmMovimenti in 'UfmMovimenti.pas' {fmMovimenti},
  UdmDati in 'UdmDati.pas' {dmDati: TDataModule},
  UFrRighe in 'UFrRighe.pas' {FrRighe: TFrame};

{$R *.RES}

begin
  Application.Initialize;
  Application.CreateForm(TfmMovimenti, fmMovimenti);
  Application.CreateForm(TdmDati, dmDati);
  Application.Run;
end.
