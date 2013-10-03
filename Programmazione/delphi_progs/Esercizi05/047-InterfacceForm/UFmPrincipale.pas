unit UFmPrincipale;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, Grids, UInterfaccia;

type
  TFormClass = class of TForm;

  TFmPrincipale = class(TForm)
    SgForm: TStringGrid;
    BtMastrini: TButton;
    BtEstratti: TButton;
    procedure BtMastriniClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure BtEstrattiClick(Sender: TObject);
  private
    { Private declarations }
    procedure CreaForm(AFormClass: TFormClass);
    procedure Aggiorna( Sender: TObject );
  public
    { Public declarations }
  end;

var
  FmPrincipale: TFmPrincipale;

implementation

{$R *.DFM}

uses
  UFmMastrini, UFmEstratti;

procedure TFmPrincipale.CreaForm( AFormClass: TFormClass );
var
  f: TForm;
  df: IDataForm;
begin
// procedura per creare una form a partire dalla classe
// creiamo la form e la mostriamo
  f := AFormClass.Create( Application );
  f.Show;
// se possiede l'interfaccia colleghiamo l'evento OnDataChange
  if f.GetInterface( IDataForm, df ) then
    df.OnDataChange( Aggiorna );
// aggiorniamo la lista
  Aggiorna( nil );
end;

procedure TFmPrincipale.Aggiorna( Sender: TObject );
var
  i: integer;
  s: string;
  df: IDataForm;
  f: TForm;
  NumForm: integer;
begin
  with sgForm do begin
  // prepariamo la griglia
    Cells[ 0, 0 ] := 'Nome form';
    Cells[ 1, 0 ] := 'Record corrente';
    RowCount := 2;
    NumForm := 0;
  // passiamo in rassegna tutte le form dell'applicazione
    for i := 0 to Screen.formcount - 1 do begin
    // ne prendiamo una
      f := Screen.Forms[ i ];
    // se sta venendo distrutta la ignoriamo
      if not(csDestroying in f.ComponentState) then begin
        Inc( NumForm );
        RowCount := NumForm + 1;
    // altrimenti carichiamo la Caption nella griglia
        cells[ 0, NumForm ] := f.Caption ;
    // se possiede l'interfaccia carichiamo il
    // record corrente e la sincronizziamo sui dati
        if f.GetInterface( IDataForm, df ) then begin
          df.Risincronizza;
          s := df.GetRecordCorrente;
        end else
          s := '';
        cells[ 1, NumForm ] := S;
        end;
      end;
    end;
end;

procedure TFmPrincipale.FormShow(Sender: TObject);
begin
  Aggiorna( Sender );
end;

procedure TFmPrincipale.BtMastriniClick(Sender: TObject);
begin
  CreaForm( TFmMastrini );
end;

procedure TFmPrincipale.BtEstrattiClick(Sender: TObject);
begin
  CreaForm( TFmEstratti );
end;

end.
