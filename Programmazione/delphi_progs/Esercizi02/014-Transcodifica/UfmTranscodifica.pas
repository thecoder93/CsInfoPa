unit UfmTranscodifica;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  Grids, StdCtrls, Buttons;

type
  TfmTranscodifica = class(TForm)
    sgRegole: TStringGrid;
    btApri: TSpeedButton;
    btTranscodifica: TSpeedButton;
    btSalva: TSpeedButton;
    etTesto: TMemo;
    dlgApri: TOpenDialog;
    dlgSalva: TSaveDialog;
    ckCase: TCheckBox;
    procedure btApriClick(Sender: TObject);
    procedure btSalvaClick(Sender: TObject);
    procedure sgRegoleSetEditText(Sender: TObject; ACol, ARow: Integer;
      const Value: String);
    procedure FormCreate(Sender: TObject);
    procedure btTranscodificaClick(Sender: TObject);
  private
    procedure EffettuaSostituzioni;
  public
    { Public declarations }
  end;

var
  fmTranscodifica: TfmTranscodifica;

implementation

{$R *.DFM}

procedure TfmTranscodifica.btApriClick(Sender: TObject);
begin
  // carica un testo nel memo
  if dlgApri.Execute then
    etTesto.Lines.LoadFromFile( dlgApri.FileName );
end;

procedure TfmTranscodifica.btSalvaClick(Sender: TObject);
begin
  // salva il testo
  if dlgSalva.Execute then
    etTesto.Lines.SaveToFile( dlgSalva.FileName );
end;

procedure TfmTranscodifica.FormCreate(Sender: TObject);
begin
  // inizializza griglia
  sgRegole.Cells[ 0, 0 ] := 'Cosa sostituire';
  sgRegole.Cells[ 1, 0 ] := 'Sostituire con';
end;

procedure TfmTranscodifica.sgRegoleSetEditText(Sender: TObject; ACol,
  ARow: Integer; const Value: String);
begin
  // ci deve essere sempre una riga vuota in fondo alla griglia
  // per inserire dei nuovi valori
  if ( Trim( Value ) <> '' ) and ( ARow = sgRegole.RowCount - 1 ) then
    // aggiunge una riga se serve
    sgRegole.RowCount := sgRegole.RowCount + 1;
end;

procedure TfmTranscodifica.btTranscodificaClick(Sender: TObject);
begin
  EffettuaSostituzioni;
end;

procedure TfmTranscodifica.EffettuaSostituzioni;
var
  i: integer;
  t : string;
  flags : TReplaceFlags;
begin
  flags := [ rfReplaceAll ];
  if ckCase.Checked then // ricerca ignorando la differenza tra
    Include(flags, rfIgnoreCase); // maiuscole e minuscole (case)
  t := etTesto.Text; // carica il testo in una variabile locale per far prima
  // per ogni riga della griglia carica il valore della sostituzione nella
  // posizione specificata dalla prima colonna della griglia
  for i := 1 to sgRegole.RowCount - 1 do
    t := StringReplace( t, sgRegole.Cells[ 0, i ],
      sgRegole.Cells[ 1, i ], flags );
  etTesto.Text := t; // rimette il testo nel memo
end;

end.
