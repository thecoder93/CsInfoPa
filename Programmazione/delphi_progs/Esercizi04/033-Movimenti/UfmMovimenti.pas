unit UfmMovimenti;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  Db, DBTables, StdCtrls, DBCtrls, Mask, Grids, DBGrids, ExtCtrls, DBCGrids;

type
  TfmMovimenti = class(TForm)
    dsRigheMov: TDataSource;
    dsMovimenti: TDataSource;
    Label2: TLabel;
    dbetData: TDBEdit;
    Label3: TLabel;
    dbetMotivo: TDBEdit;
    Label4: TLabel;
    dbetRiferimento: TDBEdit;
    Label5: TLabel;
    dbetNote: TDBMemo;
    DBNavigator1: TDBNavigator;
    dbetPortafoglio: TDBLookupComboBox;
    dbrgTipo: TDBRadioGroup;
    Label1: TLabel;
    dsMastrini: TDataSource;
    dsPortafogli: TDataSource;
    DbgrRighe: TDBGrid;
    Label6: TLabel;
    lbTotale: TLabel;
    procedure dsMovimentiDataChange(Sender: TObject; Field: TField);
    procedure FormShow(Sender: TObject);
  private
    procedure tbMovimentiBeforePost(DataSet: TDataSet);
    { Private declarations }
  public
    { Public declarations }
  end;

var
  fmMovimenti: TfmMovimenti;

implementation

{$R *.DFM}
uses
  UdmDati;

procedure TfmMovimenti.dsMovimentiDataChange(Sender: TObject;
  Field: TField);
var
  tot: Currency;
begin
  if dmDati.tbRigheMov.Active then
    // uso una seconda tabella collegata alle righe dei movimenti
    with dmDati.tbRigheMovRO do begin
      First;
      tot := 0;
      // per ogni riga del movimento corrente sommo l'importo...
      while not Eof do begin
        tot := tot + dmDati.tbRigheMovRoImporto.AsCurrency;
        Next;
        end;
      if dbrgTipo.ItemIndex <> 1 then
        tot := -tot;
      // ...e lo riporto (eventualmente cambiato
      // di segno) nella Label
      lbTotale.Caption := CurrToStr( tot );
    end;
end;

procedure TfmMovimenti.tbMovimentiBeforePost(DataSet: TDataSet);
begin
  // controlli da effettuare prima della conferma del movimento
// deve essere assegnato un tipo...
  if dbrgTipo.ItemIndex < 0 then begin
    MessageBeep(0);
    (dbrgTipo.Components[0] as TWinControl).SetFocus;
    dbrgTipo.ItemIndex := - 1;
    Abort;
    end
  // ...e un portafoglio...
  else if dbetPortafoglio.Text = '' then begin
    MessageBeep(0);
    dbetPortafoglio.SetFocus;
    Abort;
    end
  // ...ed un motivo per la spesa
  else if dbetMotivo.Text = '' then begin
    MessageBeep(0);
    dbetMotivo.SetFocus;
    Abort;
    end;
end;

procedure TfmMovimenti.FormShow(Sender: TObject);
begin
  // collego i controlli prima del Post sui Movimenti
  dmDati.tbMovimenti.BeforePost := tbMovimentiBeforePost;
end;

end.
