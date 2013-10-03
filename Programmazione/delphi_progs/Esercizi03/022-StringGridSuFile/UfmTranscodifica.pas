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
    btCaricaReg: TSpeedButton;
    btSalvaReg: TSpeedButton;
    procedure btApriClick(Sender: TObject);
    procedure btSalvaClick(Sender: TObject);
    procedure sgRegoleSetEditText(Sender: TObject; ACol, ARow: Integer;
      const Value: String);
    procedure FormCreate(Sender: TObject);
    procedure btTranscodificaClick(Sender: TObject);
    procedure btSalvaRegClick(Sender: TObject);
    procedure btCaricaRegClick(Sender: TObject);
  private
    procedure EffettuaSostituzioni;
  public
    { Public declarations }
  end;

var
  fmTranscodifica: TfmTranscodifica;

implementation

{$R *.DFM}
uses
  Stringhe;

procedure TfmTranscodifica.btApriClick(Sender: TObject);
begin
  if dlgApri.Execute then
    etTesto.Lines.LoadFromFile( dlgApri.FileName );
end;

procedure TfmTranscodifica.btSalvaClick(Sender: TObject);
begin
  if dlgSalva.Execute then
    etTesto.Lines.SaveToFile( dlgSalva.FileName );
end;

procedure TfmTranscodifica.sgRegoleSetEditText(Sender: TObject; ACol,
  ARow: Integer; const Value: String);
begin
  if ( Trim( Value ) <> '' ) and ( ARow = sgRegole.RowCount - 1 ) then
    sgRegole.RowCount := sgRegole.RowCount + 1; // aggiunge una riga se serve
end;

procedure TfmTranscodifica.FormCreate(Sender: TObject);
begin
  sgRegole.Cells[ 0, 0 ] := 'Cosa sostituire';
  sgRegole.Cells[ 1, 0 ] := 'Sostituire con';
end;

procedure TfmTranscodifica.btTranscodificaClick(Sender: TObject);
begin
  EffettuaSostituzioni;
end;

procedure TfmTranscodifica.EffettuaSostituzioni;
var
  i: integer;
  t : string;
  flag : TReplaceFlags;
begin
  flag := [ rfReplaceAll ];
  if ckCase.Checked then // ricerca ignorando la differenza tra maiuscole e
    Include(flag, rfIgnoreCase); // minuscole (Case)
  t := etTesto.Text; // carica il testo in una variabile locale per far prima
  // per ogni riga della griglia carica il valore della sostituzione nella
  // posizione specificata dalla prima colonna della griglia
  for i := 1 to sgRegole.RowCount - 1 do
    t := StringReplace( t, sgRegole.Cells[ 0, i ], sgRegole.Cells[ 1, i ], flag );
  etTesto.Text := t; // rimette il testo nel memo
end;

procedure TfmTranscodifica.btSalvaRegClick(Sender: TObject);
begin
  if dlgSalva.Execute then
    // salviamo la griglia
    SalvaGridSuFile( sgRegole, dlgSalva.FileName );
end;

procedure TfmTranscodifica.btCaricaRegClick(Sender: TObject);
begin
  if dlgApri.Execute then
  begin
    // carichiamo la griglia
    CaricaGridDaFile( sgRegole, dlgApri.FileName );
    // dobbiamo rimettere i titoli
    sgRegole.FixedRows := 1;
  end;
end;

end.
