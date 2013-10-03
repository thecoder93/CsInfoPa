unit Selettore;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  ExtCtrls, StdCtrls, ComCtrls;

type
  TfmSelettore = class(TForm)
    lbCaratteri: TListBox;
    lbDimensioni: TListBox;
    reTesto: TRichEdit;
    Splitter1: TSplitter;
    Splitter2: TSplitter;
    procedure FormCreate(Sender: TObject);
    procedure ListeClick(Sender: TObject);
  private
    procedure SistemaTesto;
    procedure CaricaCaratteri(aList: TListBox);
    procedure CaricaDimensioni(aList: TListBox);
    { Private declarations }
  public
    { Public declarations }
  end;

var
  fmSelettore: TfmSelettore;

implementation

{$R *.DFM}

procedure TfmSelettore.FormCreate(Sender: TObject);
begin  // inizializza tutti i controlli
  Caption := 'Selettore di testo';
  CaricaCaratteri( lbCaratteri ); // carica i nomi dei font nella listbox
  CaricaDimensioni( lbDimensioni ); // carica i numeri da 6 a 72 nella listbox
  reTesto.Text := 'Testo di prova';
  SistemaTesto; // applica il font selezionato al testo del RichEdit
end;

procedure TfmSelettore.CaricaCaratteri( aList: TListBox );
begin
  // copia i nomi di tutti i caratteri disponibili per lo schermo nella
  // ListBox passata alla funzione. Notare che non è detto che i caratteri
  // disponibili per la stampante coincidano con questi.
  aList.Items := Screen.Fonts;
  aList.ItemIndex := 0; // seleziona il primo font.
end;

procedure TfmSelettore.CaricaDimensioni( aList: TListBox );
var
  i: integer;
begin
  aList.Clear;
  for i := 6 to 72 do
    aList.Items.Add( IntToStr( i ) ); // aggiunge il valore
  aList.ItemIndex := 0;
end;

procedure TfmSelettore.SistemaTesto;
begin
  if reTesto.SelLength = 0 then
  begin
    // se non è selezionato nulla applica la formattazione a tutto il testo
    reTesto.Font.Name := lbCaratteri.Items[ lbCaratteri.ItemIndex ];
    reTesto.Font.Size := StrToInt( lbDimensioni.Items[lbDimensioni.ItemIndex] );
  end
  else
  begin
    // altrimenti la applica solo al testo selezionato
    reTesto.SelAttributes.Name := lbCaratteri.Items[ lbCaratteri.ItemIndex ];
    reTesto.SelAttributes.Size :=
      StrToInt( lbDimensioni.Items[ lbDimensioni.ItemIndex ] );
  end;
end;

procedure TfmSelettore.ListeClick(Sender: TObject);
begin
  // Selezionando su ambedue le liste il risultato è il medesimo.
  SistemaTesto;
end;

end.
